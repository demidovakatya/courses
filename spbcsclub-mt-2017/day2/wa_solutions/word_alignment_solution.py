#!/usr/bin/python
import os, sys, codecs, utils
from math import log
from models import PriorModel
from models import TranslationModel

def get_posterior_distribution_for_trg_token(trg_index, src_tokens, trg_tokens,
                                             prior_model, translation_model):
    "Compute the posterior distribution over alignments for trg_index: P(a_j = i|f_j, e)."
    # marginal_prob = p(f_j|e)
    # posterior_probs[i] = p(a_j = i|f_j, e)
    joint_probs = [prior_model.get_prior_prob(src_index, trg_index, len(src_tokens), len(trg_tokens)) *
                   translation_model.get_conditional_prob(src_token, trg_tokens[trg_index])
                   for src_index, src_token in enumerate(src_tokens)]
    # marginal_prob = p(f_j|e) = sum over i p(a_j = i, f_j|e)
    marginal_prob = sum(joint_probs)
    # posterior_probs = p(a_j = i|f_j, e) = p(a_j = i, f_j|e) / p(f_j|e) 
    posterior_probs = [joint / marginal_prob for joint in joint_probs]
    return marginal_prob, posterior_probs

def get_posterior_alignment_matrix(src_tokens, trg_tokens, prior_model, translation_model):
    "For each target token compute the posterior alignment probability: p(a_j=i | f_j, e)"
    # 1. Prior model assumes that a_j is independent of all other alignments.
    # 2. Translation model assume each target word is generated independently given its alignment.
    posterior_matrix = []
    sentence_marginal_log_likelihood = 0.0
    for trg_index, trg_token in enumerate(trg_tokens):
        # Compute posterior probability that this trg token is alignment to each src token.
        marginal_prob, posterior_distribution = get_posterior_distribution_for_trg_token(
            trg_index, src_tokens, trg_tokens, prior_model, translation_model)
        posterior_matrix.append(posterior_distribution)
        sentence_marginal_log_likelihood += log(marginal_prob)
    return sentence_marginal_log_likelihood, posterior_matrix

def collect_expected_statistics(src_corpus, trg_corpus, prior_model, translation_model):
    "Infer posterior distribution over each sentence pair and collect statistics: E-step"
    corpus_marginal_log_likelihood = 0.0
    for i in range(len(src_corpus)):
        # Infer posterior
        sentence_marginal_log_likelihood, posterior_matrix = get_posterior_alignment_matrix(
            src_corpus[i], trg_corpus[i], prior_model, translation_model)
        # Collect statistics in each model.
        prior_model.collect_statistics(len(src_corpus[i]), len(trg_corpus[i]), posterior_matrix)
        translation_model.collect_statistics(src_corpus[i], trg_corpus[i], posterior_matrix)
        # Update log prob
        corpus_marginal_log_likelihood += sentence_marginal_log_likelihood
    return corpus_marginal_log_likelihood

def reestimate_models(prior_model, translation_model):
    "Recompute parameters of each model: M-step"
    prior_model.recompute_parameters()
    translation_model.recompute_parameters()

def initialize_models(src_corpus, trg_corpus):
    prior_model = PriorModel(src_corpus, trg_corpus)
    translation_model = TranslationModel(src_corpus, trg_corpus)
    return prior_model, translation_model

def estimate_models(src_corpus, trg_corpus, prior_model, translation_model, num_iterations):
    "Estimate models iteratively."
    for iteration in range(num_iterations):
        corpus_log_likelihood = collect_expected_statistics(
            src_corpus, trg_corpus, prior_model, translation_model)
        reestimate_models(prior_model, translation_model)
        if iteration > 0:
            print "corpus log likelihood: %1.3f" % corpus_log_likelihood
    return prior_model, translation_model

def align_sentence_pair(src_tokens, trg_tokens, prior_probs, translation_probs):
    "For each target token, find the src_token with the highest posterior probability."
    # Compute the posterior distribution over alignments for all target tokens.
    corpus_log_prob, posterior_matrix = get_posterior_alignment_matrix(
        src_tokens, trg_tokens, prior_probs, translation_probs)
    # For each target word find the src index with the highest posterior probability.
    alignments = []
    for trg_index, posteriors in enumerate(posterior_matrix):
        best_src_index = posteriors.index(max(posteriors))
        alignments.append((best_src_index, trg_index))
    return alignments

def align_corpus_given_models(src_corpus, trg_corpus, prior_model, translation_model):
    "Align each sentence pair in the corpus in turn."
    alignments = []
    for i in range(len(src_corpus)):
        these_alignments = align_sentence_pair(
            src_corpus[i], trg_corpus[i], prior_model, translation_model)
        alignments.append(these_alignments)
    return alignments

def align_corpus(src_corpus, trg_corpus, num_iterations):
    "Learn models and then align the corpus using them."
    prior_model, translation_model = initialize_models(src_corpus, trg_corpus)
    prior_model, translation_model = estimate_models(
        src_corpus, trg_corpus, prior_model, translation_model, num_iterations)
    return align_corpus_given_models(src_corpus, trg_corpus, prior_model, translation_model)

if __name__ == "__main__":
    if not len(sys.argv) == 5:
        print "Usage ./word_alignment.py src_corpus trg_corpus iterations output_prefix."
        sys.exit(0)
    src_corpus = utils.read_all_tokens(sys.argv[1])
    trg_corpus = utils.read_all_tokens(sys.argv[2])
    num_iterations = int(sys.argv[3])
    output_prefix = sys.argv[4]
    assert len(src_corpus) == len(trg_corpus), "Corpora should be same size!"
    alignments = align_corpus(src_corpus, trg_corpus, num_iterations)
    utils.output_alignments_per_test_set(alignments, output_prefix)

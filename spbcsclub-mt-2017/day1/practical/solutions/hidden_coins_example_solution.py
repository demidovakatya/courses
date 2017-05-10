#!/usr/bin/python
import os
import sys
from math import log
from random import random
from coins_example_solution import generate_n_samples_size_m
from coins_example_solution import get_maximum_likelihood_parameters
from coins_example_solution import read_user_input


def infer_post_probs_coin_r(samples, est_prob_coin_r,
                                 est_prob_head_r, est_prob_head_b):
    "Given the current model estimates, infer the probability of coin a for each sample."
    post_probs_coin_r = []
    exp_log_likelihood = 0.0
    for sample in samples:
        prob_sample_and_coin_r = (
            est_prob_coin_r * est_prob_head_r ** sample.count("H") *
            (1 - est_prob_head_r) ** sample.count("T"))
        prob_sample_and_coin_b = (
            (1 - est_prob_coin_r) * est_prob_head_b ** sample.count("H") *
            (1 - est_prob_head_b) ** sample.count("T"))
        post_prob_coin_r = prob_sample_and_coin_r / \
            (prob_sample_and_coin_r + prob_sample_and_coin_b)

        exp_log_likelihood += post_prob_coin_r * \
            log(prob_sample_and_coin_r)
        exp_log_likelihood += (1 - post_prob_coin_r) * \
            log(prob_sample_and_coin_b)

        post_probs_coin_r.append(post_prob_coin_r)

    return post_probs_coin_r, exp_log_likelihood


def get_exp_statistics(post_probs_coin_r, samples):
    "Given the posterior probability of coin a for each sample, collect fractional counts."
    exp_count_coin_r, exp_count_coin_b = 0.0, 0.0
    exp_count_head_r, exp_count_head_b = 0.0, 0.0
    for i, sample in enumerate(samples):
        exp_count_coin_r += post_probs_coin_r[i] * len(sample)
        exp_count_coin_b += (1 - post_probs_coin_r[i]) * len(sample)
        exp_count_head_r += post_probs_coin_r[i] * sample.count("H")
        exp_count_head_b += (1 -
                                  post_probs_coin_r[i]) * sample.count("H")

    return exp_count_coin_r, exp_count_coin_b, exp_count_head_r, exp_count_head_b


def em(samples, est_prob_coin_r, est_prob_head_r, est_prob_head_b):
    "Perform one iteration of em: inter posterior, compute expected statistics, update estimates."
    post_probs_coin_r, exp_log_likelihood = infer_post_probs_coin_r(
        samples, est_prob_coin_r, est_prob_head_r, est_prob_head_b)
    exp_count_coin_r, exp_count_coin_b, exp_count_head_r, exp_count_head_b = (
        get_exp_statistics(post_probs_coin_r, samples))
    est_prob_coin_r, est_prob_head_r, est_prob_head_b = (
        get_maximum_likelihood_parameters(exp_count_coin_r, exp_count_coin_b,
                                          exp_count_head_r, exp_count_head_b))
    # for i, sample in enumerate(samples):
    #   print "Pr(A) = %1.5f %s" % (post_probs_coin_r[i], sample)
    return est_prob_coin_r, est_prob_head_r, est_prob_head_b, exp_log_likelihood

if __name__ == "__main__":
    prob_coin_r, prob_head_r, prob_head_b, n, m = read_user_input(sys.argv[1:])
    samples, _ = generate_n_samples_size_m(
        n, m, prob_coin_r, prob_head_r, prob_head_b)
    est_prob_coin_r, est_prob_head_r, est_prob_head_b = 0.5, 0.51, 0.49
    previous_exp_log_likelihood = 0.0
    for i in range(1000):
        est_prob_coin_r, est_prob_head_r, est_prob_head_b, exp_log_likelihood = (
            em(samples, est_prob_coin_r, est_prob_head_r, est_prob_head_b))
        print "exp_log_likelihood = %1.4f" % (exp_log_likelihood / len(samples))
        print "est_prob_coin_r = %1.4f (actual = %1.4f)" % (est_prob_coin_r, prob_coin_r)
        print "est_prob_head_r = %1.4f (actual = %1.4f)" % (est_prob_head_r, prob_head_r)
        print "est_prob_head_b = %1.4f (actual = %1.4f)" % (est_prob_head_b, prob_head_b)
        if i > 0:
            if exp_log_likelihood - previous_exp_log_likelihood < 0.0001:
                break
        previous_exp_log_likelihood = exp_log_likelihood
    print "number of iterations = %d" % i
    print "number of coins = %d" % n
    print "number of times each coin was flipped = %d" % m
    print "total coin flips = %d" % (m * n)
    print "Note: To rerun use ./hidden_coins_example_solution.py %1.4f %1.4f %1.4f %d %d" % (
        prob_coin_r, prob_head_r, prob_head_b, n, m)

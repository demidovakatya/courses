# Models for word alignment

class TranslationModel:
    "Models conditional distribution over trg words given a src word."

    def __init__(self, src_corpus, trg_corpus):
        self._src_trg_counts = {}
        self._trg_given_src_probs = {}

    def get_conditional_prob(self, src_token, trg_token):
        "Return the conditional probability of trg_token given src_token."
        if src_token not in self._trg_given_src_probs:
            return 1.0
        if trg_token not in self._trg_given_src_probs[src_token]:
            return 1.0
        return self._trg_given_src_probs[src_token][trg_token]

    def collect_statistics(self, src_tokens, trg_tokens, posterior_matrix):
        "Accumulate counts of translations from matrix: matrix[j][i] = p(a_j=i|e, f)"
        assert len(posterior_matrix) == len(trg_tokens)
        for trg_index, trg_token in enumerate(trg_tokens):
            posterior = posterior_matrix[trg_index]
            assert len(posterior) == len(src_tokens), "%d vs. %s" % (len(posterior), len(src_tokens))
            for src_index, src_token in enumerate(src_tokens):
                if src_token not in self._src_trg_counts:
                    self._src_trg_counts[src_token] = {}
                if trg_token not in self._src_trg_counts[src_token]:
                    self._src_trg_counts[src_token][trg_token] = 0.0
                self._src_trg_counts[src_token][trg_token] += posterior[src_index]

    def recompute_parameters(self):
        "Reestimate parameters and reset counters."
        self._trg_given_src_probs = {}
        for src, joint_counts in self._src_trg_counts.items():
            src_count = sum([count for count in joint_counts.values()])
            self._trg_given_src_probs[src] = {}
            for trg, joint_count in joint_counts.items():
                self._trg_given_src_probs[src][trg] = joint_count / src_count
        self._src_trg_counts = {}


class PriorModel:
    "Models the prior probability of an alignment given only the sentence lengths and token indices."

    def __init__(self, src_corpus, trg_corpus):
        "Add counters and parameters here for more sophisticated models."
        self._distance_counts = {}
        self._distance_probs = {}

    def get_prior_prob(self, src_index, trg_index, src_length, trg_length):
        "Returns a prior probability based on src and trg indices."
        if src_index not in self._distance_probs:
            return 1.0
        if trg_index not in self._distance_probs[src_index]:
            return 1.0
        return self._distance_probs[src_index][trg_index]

    def collect_statistics(self, src_length, trg_length, posterior_matrix):
        "Extract the necessary statistics from this matrix if needed."
        for trg_index, posterior in enumerate(posterior_matrix):
            for src_index, prob in enumerate(posterior):
                if not src_index in self._distance_counts:
                    self._distance_counts[src_index] = {}
                if not trg_index in self._distance_counts[src_index]:
                    self._distance_counts[src_index][trg_index] = 0.0
                self._distance_counts[src_index][trg_index] += prob

    def recompute_parameters(self):
        "Reestimate the parameters and reset counters."
        self._distance_probs = {}
        for src_index, trg_index_counts in self._distance_counts.items():
            marginal = sum(trg_index_counts.values())
            self._distance_probs[src_index] = {}
            for trg_index, joint_count in trg_index_counts.items():
                self._distance_probs[src_index][trg_index] = joint_count / marginal
        self._distance_counts = {}

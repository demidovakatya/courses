#!/usr/bin/python
import os, sys
from random import random

def choose_coin(prob_coin_r):
    "Choose red coin with probability prob_coin_r, otherwise choose blue."
    if random() < prob_coin_r:
        return "R"
    return "B"

def flip_coin(prob_head):
    "Return H (head) with probability prob_head, otherwise T (tail)."
    if random() < prob_head:
        return "H"
    return "T"

def flip_coin_m_times(m, prob_head):
    "Flip a coin m times and return the results."
    return [flip_coin(prob_head) for i in range(m)]

def generate_n_samples_size_m(n, m, prob_coin_r, prob_head_r, prob_head_b):
    "Choose n coins and flip each one m times."
    samples, labels = [], []
    for i in range(n):
        if choose_coin(prob_coin_r) == "R":
            labels.append("R")
            sample = flip_coin_m_times(m, prob_head_r)
        else:
            labels.append("B")
            sample = flip_coin_m_times(m, prob_head_b)
        samples.append(sample)
    return samples, labels

def get_observed_statistics(labels, samples):
    "Count how often we saw each coin and how often each coin was H."
    assert len(labels) == len(samples)
    count_coin_r, count_coin_b = 0, 0
    count_head_r, count_head_b = 0, 0
    for i, sample in enumerate(samples):
        if labels[i] == "R":
            count_coin_r += len(sample)
            count_head_r += sample.count("H")
        else:
            count_coin_b += len(sample)
            count_head_b += sample.count("H")

    return count_coin_r, count_coin_b, count_head_r, count_head_b

def get_maximum_likelihood_parameters(count_coin_r, count_coin_b,
                                      count_head_r, count_head_b):
    "Compute the maximum likelihood estimates for the parameters."
    estimate_prob_coin_r = count_coin_r / float(count_coin_r + count_coin_b)
    estimate_prob_head_r = count_head_r / float(count_coin_r)
    estimate_prob_head_b = count_head_b / float(count_coin_b)
    return estimate_prob_coin_r, estimate_prob_head_r, estimate_prob_head_b

def read_user_input(args):
    if len(args) != 5:
        prob_coin_r = input("Enter probability of red coin: ")
        prob_head_r = input("Enter probability of head for red coin: ")
        prob_head_b = input("Enter probability of head for blue coin: ")
        n = input("Enter number of coins to flip: ")
        m = input("Enter number of times to flip each coin: ")
    else:
        prob_coin_r = float(args[0])
        prob_head_r = float(args[1])
        prob_head_b = float(args[2])
        n = int(args[3])
        m = int(args[4])
    assert prob_coin_r >=0 and prob_coin_r <= 1
    assert prob_head_r >=0 and prob_head_r <= 1
    assert prob_head_b >=0 and prob_head_b <= 1
    assert m > 0 and n > 0
    return prob_coin_r, prob_head_r, prob_head_b, n, m
    
if __name__ == "__main__":
    prob_coin_r, prob_head_r, prob_head_b, n, m = read_user_input(sys.argv[1:])
    samples, labels = generate_n_samples_size_m(
        n, m, prob_coin_r, prob_head_r, prob_head_b)
    for i, sample in enumerate(samples[:100]):
        print labels[i], sample[:100] 

    count_coin_r, count_coin_b, count_head_r, count_head_b = (
        get_observed_statistics(labels, samples))
    estimate_prob_coin_r, estimate_prob_head_r, estimate_prob_head_b = (
        get_maximum_likelihood_parameters(count_coin_r, count_coin_b,
                                          count_head_r, count_head_b))

    print "Maximum likelihood estimates:"
    print "estimate_prob_coin_r = %1.4f (actual = %1.4f)" % (estimate_prob_coin_r, prob_coin_r)
    print "estimate_prob_head_r = %1.4f (actual = %1.4f)" % (estimate_prob_head_r, prob_head_r)
    print "estimate_prob_head_b = %1.4f (actual = %1.4f)" % (estimate_prob_head_b, prob_head_b)
    print "number of coins = %d" % n
    print "number of times each coin was flipped = %d" % m
    print "total coin flips = %d" % (m * n)
    print "Note: To rerun use ./coins_example.py %1.4f %1.4f %1.4f %d %d" % (
        prob_coin_r, prob_head_r, prob_head_b, n, m)

import numpy
import random
import pylab

from ps3b_precompiled_27 import *

def simulationWithoutDrug(numViruses, maxPop, maxBirthProb, clearProb,
                          numTrials):
    """
    Run the simulation and plot the graph for problem 3 (no drugs are used,
    viruses do not have any drug resistance).    
    For each of numTrials trial, instantiates a patient, runs a simulation
    for 300 timesteps, and plots the average virus population size as a
    function of time.

    numViruses: number of SimpleVirus to create for patient (an integer)
    maxPop: maximum virus population for patient (an integer)
    maxBirthProb: Maximum reproduction probability (a float between 0-1)        
    clearProb: Maximum clearance probability (a float between 0-1)
    numTrials: number of simulation runs to execute (an integer)
    """
    steps = 300

    results = [ [] for _ in range(steps) ]
    
    for trial in range(numTrials):
        viruses = [SimpleVirus(maxBirthProb, clearProb) for _ in range(numViruses)]
        patient = Patient(viruses, maxPop)

        for step in range(steps):
            results[step].append(patient.update())

    resultsAvg = [sum(r) * 1.0 / len(r) for r in results]

    pylab.plot(resultsAvg, label="virus population")
    pylab.xlabel("timesteps")
    pylab.ylabel("average virus population")
    pylab.title("Simple Simulation (No Drug Treatment)")
    pylab.legend()
    pylab.show()

simulationWithoutDrug(100, 1000, 0.1, 0.05, 100)

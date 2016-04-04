# 6.00.2x Problem Set 4

import numpy
import random
import pylab
from ps3b import *

def simulationWithDrug(numViruses, maxPop, maxBirthProb, clearProb, resistances,
                       mutProb, numTrials, delay):
    """
    Runs simulations and plots graphs for problem 5.

    For each of numTrials trials, instantiates a patient, runs a simulation for
    150 timesteps, adds guttagonol, and runs the simulation for an additional
    150 timesteps.  At the end plots the average virus population size
    (for both the total virus population and the guttagonol-resistant virus
    population) as a function of time.

    numViruses: number of ResistantVirus to create for patient (an integer)
    maxPop: maximum virus population for patient (an integer)
    maxBirthProb: Maximum reproduction probability (a float between 0-1)        
    clearProb: maximum clearance probability (a float between 0-1)
    resistances: a dictionary of drugs that each ResistantVirus is resistant to
                 (e.g., {'guttagonol': False})
    mutProb: mutation probability for each ResistantVirus particle
             (a float between 0-1). 
    numTrials: number of simulation runs to execute (an integer)
    
    """
    steps = 150 + delay + 150
    # steps = delay + 150

    results = []
    # resultsTotal = [ [] for _ in range(steps) ]
    # resultsGtRes = [ [] for _ in range(steps) ]
    
    for trial in range(numTrials):
        viruses = [ResistantVirus(maxBirthProb, clearProb,
                                    resistances.copy(), mutProb) 
                for _ in range(numViruses)]
        patient = TreatedPatient(viruses, maxPop)

        for step in range(steps):
            if step == 150:
                patient.addPrescription('guttagonol')
            if step == 150 + delay:
                patient.addPrescription('grimpex')

            patient.update()
            # resultsTotal[step].append(patient.getTotalPop())
            # resultsGtRes[step].append(patient.getResistPop(['guttagonol']))
        results.append(patient.getTotalPop())

    # resultsTotalAvg = [sum(r) * 1.0 / len(r) for r in resultsTotal]
    # resultsGtResAvg = [sum(r) * 1.0 / len(r) for r in resultsGtRes]

    # pylab.hist(resultsTotalAvg, label="total virus population")
    # pylab.hist(resultsGtResAvg, label="guttagonol-resistant virus population")
    pylab.hist(results, label="total virus population")
    pylab.title("Simulation (With Drug Treatment, delay = %s)" % delay)
    pylab.legend()
    pylab.show()

#
# PROBLEM 1
#        
def simulationDelayedTreatment(numTrials):
    """
    Runs simulations and make histograms for problem 1.

    Runs numTrials simulations to show the relationship between delayed
    treatment and patient outcome using a histogram.

    Histograms of final total virus populations are displayed for delays of 300,
    150, 75, 0 timesteps (followed by an additional 150 timesteps of
    simulation).

    numTrials: number of simulation runs to execute (an integer)
    """
    
    # for delay in [300, 150, 75, 0]:
    delay = 150
    simulationWithDrug(100, 1000, 0.1, 0.05, {'guttagonol': False},
                            0.005, numTrials, delay)


# simulationDelayedTreatment(100)



#
# PROBLEM 2
#
def simulationTwoDrugsDelayedTreatment(numTrials):
    """
    Runs simulations and make histograms for problem 2.

    Runs numTrials simulations to show the relationship between administration
    of multiple drugs and patient outcome.

    Histograms of final total virus populations are displayed for lag times of
    300, 150, 75, 0 timesteps between adding drugs (followed by an additional
    150 timesteps of simulation).

    numTrials: number of simulation runs to execute (an integer)
    """
    delay = 0
    simulationWithDrug(100, 1000, 0.1, 0.05, 
                        {'guttagonol': False, 'grimpex': False},
                            0.005, numTrials, delay)

simulationTwoDrugsDelayedTreatment(100)

import random, pylab

#set line width
pylab.rcParams['lines.linewidth'] = 6
#set font size for titles 
pylab.rcParams['axes.titlesize'] = 20
#set font size for labels on axes
pylab.rcParams['axes.labelsize'] = 20
#set size of numbers on x-axis
pylab.rcParams['xtick.major.size'] = 5
#set size of numbers on y-axis
pylab.rcParams['ytick.major.size'] = 5



##def makeNormal(mean, sd, numSamples):
##    samples = []
##    for i in range(numSamples):
##        samples.append(random.gauss(mean, sd))
##    pylab.hist(samples, bins = 101)
##
##makeNormal(0, 1.0, 100000)
##pylab.show()





def clear(n, clearProb, steps):
    numRemaining = [n]
    for t in range(steps):
        numRemaining.append(n*((1-clearProb)**t))
    pylab.plot(numRemaining, label = 'Exponential Decay')

##clear(1000, 0.01, 500)
##pylab.xlabel('Number of Steps')
##pylab.ylabel('Number of Molecules')
##pylab.show()


def clearSim(n, clearProb, steps):
    numRemaining = [n]
    for t in range(steps):
        numLeft = numRemaining[-1]
        for m in range(numRemaining[-1]):
            if random.random() <= clearProb: 
                numLeft -= 1
        numRemaining.append(numLeft)
    pylab.plot(numRemaining, 'ro', label = 'Simulation')

clear(10000, 0.01, 1000)
clearSim(10000, 0.01, 1000)
pylab.xlabel('Number of Steps')
pylab.ylabel('Number of Molecules')
pylab.legend()
pylab.show()

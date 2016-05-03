import random
import pylab

# Global Variables
MAXRABBITPOP = 1000
# CURRENTRABBITPOP = 500
CURRENTRABBITPOP = 50
# CURRENTFOXPOP = 30
CURRENTFOXPOP = 300

def rabbitGrowth():
    """ 
    rabbitGrowth is called once at the beginning of each time step.

    It makes use of the global variables: CURRENTRABBITPOP and MAXRABBITPOP.

    The global variable CURRENTRABBITPOP is modified by this procedure.

    For each rabbit, based on the probabilities in the problem set write-up, 
      a new rabbit may be born.
    Nothing is returned.
    """
    # you need this line for modifying global variables
    global CURRENTRABBITPOP

    for _ in range(CURRENTRABBITPOP):
        prob_rabbit_repr = 1 - float(CURRENTRABBITPOP) / MAXRABBITPOP
    
        if random.random() < prob_rabbit_repr:
            CURRENTRABBITPOP += 1
            
def foxGrowth():
    """ 
    foxGrowth is called once at the end of each time step.

    It makes use of the global variables: CURRENTFOXPOP and CURRENTRABBITPOP,
        and both may be modified by this procedure.

    Each fox, based on the probabilities in the problem statement, may eat 
      one rabbit (but only if there are more than 10 rabbits).

    If it eats a rabbit, then with a 1/3 prob it gives birth to a new fox.

    If it does not eat a rabbit, then with a 1/10 prob it dies.

    Nothing is returned.
    """
    # you need these lines for modifying global variables
    global CURRENTRABBITPOP
    global CURRENTFOXPOP
    
    foxes = CURRENTFOXPOP

    for _ in range(foxes):
        prob_fox_eatsrabbit = float(CURRENTRABBITPOP) / MAXRABBITPOP
        
        if (CURRENTRABBITPOP > 10) and (random.random() < prob_fox_eatsrabbit):
            # eat rabbit; reproduce
            CURRENTRABBITPOP -= 1
            if random.random() < 1.0 /3:
                CURRENTFOXPOP += 1
        else:
            # if (random.random() < 0.1) and (CURRENTFOXPOP > 10):
            if (random.random() < 0.9) and (CURRENTFOXPOP > 10):
                CURRENTFOXPOP -= 1
            
def runSimulation(numSteps):
    """
    Runs the simulation for `numSteps` time steps.

    Returns a tuple of two lists: (rabbit_populations, fox_populations)
      where rabbit_populations is a record of the rabbit population at the 
      END of each time step, and fox_populations is a record of the fox population
      at the END of each time step.

    Both lists should be `numSteps` items long.
    """

    rabbit_populations = []
    fox_populations = []

    for step in range(numSteps):
        rabbitGrowth()
        foxGrowth()
        rabbit_populations.append(CURRENTRABBITPOP)
        fox_populations.append(CURRENTFOXPOP)

    return((rabbit_populations, fox_populations))



# Part b
rab_pop, fox_pop = runSimulation(200)
# pylab.plot(r_p)
# pylab.show()
# pylab.plot(f_p)
# pylab.show()

coeff = pylab.polyfit(range(len(rab_pop)), rab_pop, 2)
pylab.plot(pylab.polyval(coeff, range(len(rab_pop))))
pylab.show()

coeff = pylab.polyfit(range(len(fox_pop)), fox_pop, 2)
pylab.plot(pylab.polyval(coeff, range(len(fox_pop))))
pylab.show()
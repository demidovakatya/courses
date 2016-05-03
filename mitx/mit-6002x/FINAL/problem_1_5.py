import random
import pylab

dist = []

for _ in range(500):
    dist.append(random.gauss( 50, 10 ) + random.gauss( 70, 10 ))

pylab.hist(dist, bins = 100)
pylab.show()
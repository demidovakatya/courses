import random, pylab
xVals = []
yVals = []
wVals = []
for i in range(1000):
    xVals.append(random.random())
    yVals.append(random.random())
    wVals.append(random.random())
xVals = pylab.array(xVals)
yVals = pylab.array(yVals)
wVals = pylab.array(wVals)
xVals = xVals + xVals
zVals = xVals + yVals
tVals = xVals + yVals + wVals

pylab.figure(1)
pylab.plot(tVals)
pylab.show()

pylab.figure(2)
pylab.plot(xVals)
pylab.show()

pylab.figure(3)
pylab.plot(xVals, zVals)
pylab.show()

pylab.figure(4)
pylab.plot(xVals, yVals)
pylab.show()

pylab.figure(5)
pylab.plot(xVals, sorted(yVals))
pylab.show()

pylab.figure(6)
pylab.plot(sorted(xVals), yVals)
pylab.show()

pylab.figure(7)
pylab.plot(sorted(xVals), sorted(yVals))
pylab.show()

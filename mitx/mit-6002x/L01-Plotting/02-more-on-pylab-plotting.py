import pylab

pylab.figure(1) #create figure 1
pylab.plot([1,2,3,4], [1,2,3,4]) #draw on figure 1
pylab.figure(2) #create figure 2
pylab.plot([1,4,2,3], [5,6,7,8]) #draw on figure 2
pylab.savefig('Figure-Eric') #save figure 2
pylab.figure(1) #go back to working on figure 1
pylab.plot([5,6,10,3]) #draw again on figure 1
pylab.savefig('Figure-Grimson') #save figure 1


# Second Example (comment the above code before uncommiting this example)

##principal = 10000 #initial investment
##interestRate = 0.05
##years = 20
##values = []
##for i in range(years + 1):
##    values.append(principal)
##    principal += principal*interestRate
##pylab.plot(range(years+1), values)
##pylab.title('5% Growth, Compounded Annually')
##pylab.xlabel('Years of Compounding')
##pylab.ylabel('Value of Principal ($)')
##pylab.show()




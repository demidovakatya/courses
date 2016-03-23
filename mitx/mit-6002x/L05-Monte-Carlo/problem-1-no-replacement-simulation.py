import random

def noReplacementSimulation(numTrials):
    '''
    Runs numTrials trials of a Monte Carlo simulation
    of drawing 3 balls out of a bucket containing
    3 red and 3 green balls. Balls are not replaced once
    drawn. Returns the a decimal - the fraction of times 3 
    balls of the same color were drawn.
    '''
    same_color_count = 0
    for trial in range(numTrials):
        bucket = ['red', 'red', 'red', 'gr', 'gr', 'gr']
        balls = []
        for draw in range(3):
            ball = random.choice(bucket)
            bucket.remove(ball)
            balls.append(ball)
        if balls[0] == balls[1] == balls[2]:
            same_color_count += 1
    return same_color_count * 1.0 / numTrials

# test
print("1000 trials:")
print(noReplacementSimulation(1000))

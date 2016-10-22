import random

def drawing_without_replacement_sim(numTrials):
    '''
    Runs numTrials trials of a Monte Carlo simulation
    of drawing 3 balls out of a bucket containing
    4 red and 4 green balls. Balls are not replaced once
    drawn. Returns a float - the fraction of times 3 
    balls of the same color were drawn in the first 3 draws.
    '''
    same_color_count = 0
    for trial in range(numTrials):
        bucket = ['red', 'red', 'red', 'red', 'gr', 'gr', 'gr', 'gr']
        balls = []
        for draw in range(3):
            ball = random.choice(bucket)
            bucket.remove(ball)
            balls.append(ball)
        if balls[0] == balls[1] == balls[2]:
            same_color_count += 1
    # return same_color_count * 1.0 / numTrials
    return same_color_count

# test
print("1000 trials:")
print(drawing_without_replacement_sim(1000))
print(drawing_without_replacement_sim(1000))
print(drawing_without_replacement_sim(1000))
print("100 trials:")
print(drawing_without_replacement_sim(100))
print(drawing_without_replacement_sim(100))
print(drawing_without_replacement_sim(100))

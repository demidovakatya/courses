import math

def polysum(n, s):
    '''
    Function polysum takes 2 arguments:
    - n (integer): number of sides of the regular polygon,
    - s (float): length of each side.

    This function sums the area and square of the perimeter of
    the regular polygon.
    It returns the sum, rounded to 4 decimal places.
    '''
    area = 0.25 * n * s**2 / (math.tan(math.pi/n))
    per = n * s
    
    return round(area + per**2, 4)

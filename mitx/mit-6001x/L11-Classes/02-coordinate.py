import math

def sq(x):
    return x * x

class Coordinate(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        return "<" + str(self.x) + "," + str(self.y) + ">"

    def distance(self, other):
        return math.sqrt(sq(self.x - other.x) + sq(self.y - other.y))

c = Coordinate(3, 4)
origin = Coordinate(0, 0)
print(c.x)
print(origin.x)
print(c)
print("distance between c and origin: ", str(c.distance(origin)))

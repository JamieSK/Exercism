# Globals for the bearings
# Change the values as you see fit
EAST = [1, 0]
NORTH = [0, 1]
WEST = [-1, 0]
SOUTH = [0, -1]


class Robot(object):
    def __init__(self, bearing=NORTH, x=0, y=0):
        self.bearing = bearing
        self.coordinates = x, y

    def turn_right(self):
        right = [EAST, SOUTH, WEST, NORTH, EAST]
        self.bearing = right[right.index(self.bearing) + 1]

    def turn_left(self):
        left = [EAST, NORTH, WEST, SOUTH, EAST]
        self.bearing = left[left.index(self.bearing) + 1]

    def advance(self):
        new_x = self.coordinates[0] + self.bearing[0]
        new_y = self.coordinates[1] + self.bearing[1]
        self.coordinates = new_x, new_y

    def simulate(self, string):
        for letter in string:
            if letter == 'R':
                self.turn_right()
            elif letter == 'L':
                self.turn_left()
            elif letter == 'A':
                self.advance()
class Queue(object):
    def __init__(self):
        self.queue = []

    def __str__(self):
        return '{' + ','.join([str(elem) for elem in self.queue]) + '}'

    def insert(self, elem):
        self.queue.append(elem)

    def remove(self):
        try:
            return self.queue.pop(0)
        except:
            raise ValueError()



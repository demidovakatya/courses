import datetime

class Person(object):
    def __init__(self, name):
        """create a person called name"""
        self.name = name
        self.birthday = None
        self.lastName = name.split(' ')[-1]

    def getLastName(self):
        """return self's last name"""
        return self.lastName

    def setBirthday(self,month,day,year):
        """sets self's birthday to birthDate"""
        self.birthday = datetime.date(year,month,day)

    def getAge(self):
        """returns self's current age in days"""
        if self.birthday == None:
            raise ValueError
        return (datetime.date.today() - self.birthday).days

    def __lt__(self, other):
        """return True if self's ame is lexicographically
           less than other's name, and False otherwise"""
        if self.lastName == other.lastName:
            return self.name < other.name
        return self.lastName < other.lastName

    def __str__(self):
        """return self's name"""
        return self.name

class MITPerson(Person):
    nextIDNum = 0 # next ID number to assign

    def __init__(self, name):
        Person.__init__(self, name) # initialize Person attributes
        # new MITPerson attribute: ID number
        self.idNum = MITPerson.nextIDNum
        MITPerson.nextIDNum += 1

    def getidNum(self):
        return self.idNum

    # sorting MITPeople uses their IDs
    def __lt__(self, other):
        return self.idNum < other.idNum

p1 = MITPerson('Eric')
p2 = MITPerson('John')
p3 = MITPerson('John')
p4 = Person('John')

print (p1)
print (p1.getidNum())
print (p2.getidNum())
print (p1 < p2)
print (p3 < p2)
print (p4 < p1)

# print (p1 < p4)

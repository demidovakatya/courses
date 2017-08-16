# --------------------------------------------------
# Классы и экземпляры. Часть 2 ---------------------


class Planet:
    """This class describes planets"""
    count = 0

    def __init__(self, name, population=None):
        self.name = name
        self.population = population or []

        Planet.count += 1


# Атрибуты класса
earth = Planet('Earth')
mars = Planet('Mars')
print(Planet.count)
print(mars.count)


# Деструктор экземпляра класса

class Human:
    def __del__(self):
        print('Goodbye!')


human = Human()
del human

# Словарь экземпляра и класса

planet = Planet('Earth')
print(planet.__dict__)
planet.mass = 5.97e24
print(planet.__dict__)

print(Planet.__dict__)

print(Planet.__doc__)
print(planet.__doc__)

print(dir(planet))
print(planet.__class__)


# Конструктор экземпляра класса

class Planet:
    def __new__(cls, *args, **kwargs):
        print("__new__ called")
        obj = super().__new__(cls)
        return obj

    def __init__(self, name):
        print("__init__ called")
        self.name = name


# -------------------------------------
# Методы. Часть 1 ---------------------

# Работа с методами экземпляра

class Human:
    def __init__(self, name, age=0):
        self.name = name
        self.age = age


class Planet:
    def __init__(self, name, population=None):
        self.name = name
        self.population = population or []

    def add_human(self, human):
        print(f"Welcome to {self.name}, {human.name}!")
        self.population.append(human)


mars = Planet('Mars')
bob = Human('Bob')
mars.add_human(bob)
print(mars.population)


# Вызов методов из методов

class Human:
    def __init__(self, name, age=0):
        self._name = name
        self._age = age

    def _say(self, text):
        print(text)

    def say_name(self):
        self._say(f'Hello, I am {self._name}.')

    def say_how_old(self):
        self._say(f'I am {self._age} years old.')


bob = Human('Bob', age=29)
bob.say_name()
bob.say_how_old()


# Метод класса (@classmethod)
# Обычный класс
class Event:
    def __init__(self, description, event_date):
        self.description = description
        self.date = event_date

    def __str__(self):
        return f"Event \"{self.description}\" at {self.date}"


from datetime import date

event_description = 'Рассказать, что такое @classmethod'
event_date = date.today()

event = Event(event_description, event_date)
print(event)


# Теперь добавим классу @classmethod

def extract_description(user_string):
    return "some event"


def extract_date(user_string):
    return date(2017, 11, 5)


class Event:
    def __init__(self, description, event_date):
        self.description = description
        self.date = event_date

    def __str__(self):
        return f"Event \"{self.description}\" at {self.date}"

    @classmethod
    def from_string(cls, user_input):
        description = extract_description(user_input)
        date = extract_date(user_input)
        return cls(description, date)


event = Event.from_string('sup')

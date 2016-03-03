class AdoptionCenter(object):

    def __init__(self, name, species_count, location):
        self.name = name
        self.species_count = species_count
        self.location = (location[0] * 1.0, location[1] * 1.0)

    def get_name(self):
        '''Returns the name of the adoption center'''
        return self.name

    def get_location(self):
        '''Returns the location of the adoption center'''
        return self.location

    def get_species_count(self):
        '''Returns a copy of the full list and count of the available species at the adoption center.'''
        copy_species_count = {}
        for name in self.species_count:
            if self.species_count[name] > 0:
                copy_species_count[name] = self.species_count[name]
        return copy_species_count

    def get_number_of_species(self, species_name):
        '''Returns the number of a given species that the adoption center has.'''
        if species_name not in self.get_species_count():
            number = 0
        else:
            number = self.get_species_count()[species_name]
        return number
        
    def adopt_pet(self, species_name):
        '''Decrements the value of a specific species at the adoption center.'''
        if species_name in self.get_species_count():
            if self.get_species_count()[species_name] == 1:
                del self.species_count[species_name]
            else: 
                self.species_count[species_name] -= 1

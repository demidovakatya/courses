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

class Adopter(object):
    def __init__(self, name, desired_species):
        self.name = name
        self.desired_species = desired_species

    def get_name(self):
        return self.name

    def get_desired_species(self):
        return self.desired_species

    def get_score(self, adoption_center):
        species = self.get_desired_species()
        num_desired = adoption_center.get_number_of_species(species)
        return 1.0 * num_desired

class FlexibleAdopter(Adopter):
    def __init__(self, name, desired_species, considered_species):
        Adopter.__init__(self, name, desired_species)
        self.considered_species = considered_species[:]

    def get_score(self, adoption_center):
        desired_species = self.get_desired_species()
        num_desired = adoption_center.get_number_of_species(desired_species)

        num_considered = 0
        for species in self.considered_species:
            num_considered += adoption_center.get_number_of_species(species)
        return 1.0 * num_desired + 0.3 * num_considered

class FearfulAdopter(Adopter):
    def __init__(self, name, desired_species, feared_species):
        Adopter.__init__(self, name, desired_species)
        self.feared_species = feared_species

    def get_score(self, adoption_center):
        desired_species = self.get_desired_species()
        num_desired = adoption_center.get_number_of_species(desired_species)
        num_feared = adoption_center.get_number_of_species(self.feared_species)
        score = 1.0 * num_desired - 0.3 * num_feared
        if score < 0: score = 0.0
        return score

class AllergicAdopter(Adopter):
    def __init__(self, name, desired_species, allergic_species):
        Adopter.__init__(self, name, desired_species)
        self.allergic_species = allergic_species[:]

    def get_score(self, adoption_center):
        for s in self.allergic_species:
            if adoption_center.get_number_of_species(s) > 0:
                return 0.0
        species = self.get_desired_species()
        num_desired = adoption_center.get_number_of_species(species)
        return 1.0 * num_desired

class MedicatedAllergicAdopter(AllergicAdopter):
    def __init__(self, name, desired_species, allergic_species, medicine_effectiveness):
        AllergicAdopter.__init__(self, name, desired_species, allergic_species)
        self.allergic_species = allergic_species[:]
        self.medicine_effectiveness = medicine_effectiveness.copy()

    def get_score(self, adoption_center):
        effects = []
        for s in self.medicine_effectiveness:
            if adoption_center.get_number_of_species(s) > 0:
                effects.append(self.medicine_effectiveness[s])
        if len(effects) > 0:
            lowest_effectiveness = min(effects)
        else:
            lowest_effectiveness = 1.0
        species = self.get_desired_species()
        num_desired = adoption_center.get_number_of_species(species)
        return 1.0 * num_desired * lowest_effectiveness

import random
import math
class SluggishAdopter(Adopter):
    def __init__(self, name, desired_species, location):
        Adopter.__init__(self, name, desired_species)
        self.location = (location[0] * 1.0, location[1] * 1.0)

    def get_linear_distance(self, to_location):
        x1, y1 = self.location
        x2, y2 = to_location
        return math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)

    def get_score(self, adoption_center):
        species = self.get_desired_species()
        num_desired = adoption_center.get_number_of_species(species)

        ad_cent_location = adoption_center.get_location()
        dist = self.get_linear_distance(ad_cent_location)

        if dist <= 1:
            return 1.0 * num_desired
        elif dist <= 3:
            return random.uniform(0.7, 0.9) * num_desired
        elif dist <= 5:
            return random.uniform(0.5, 0.7) * num_desired
        elif dist > 5:
            return random.uniform(0.1, 0.5) * num_desired


def get_ordered_adoption_center_list(adopter, list_of_adoption_centers):
    """
    The method returns a list of an organized adoption_center
    such that the scores for each AdoptionCenter to the Adopter
    will be ordered from highest score to lowest score.
    """
    ranking = []

    for ac in list_of_adoption_centers:
        ranking.append([ac, adopter.get_score(ac)])

    # Sort by score first, in case of duplicates - sort by center's name
    ranking = sorted(ranking, key=lambda x: x[0].get_name())
    ranking = sorted(ranking, key=lambda x: x[1], reverse=True)
    return [ac[0] for ac in ranking]

def get_adopters_for_advertisement(adoption_center, list_of_adopters, n):
    """
    The function returns a list of the top n scoring Adopters
    from list_of_adopters (in numerical order of score)
    """
    ranking = []

    for ad in list_of_adopters:
        ranking.append([ad, ad.get_score(adoption_center)])

    # Sort by score first, in case of duplicates - sort by adopters's name
    ranking = sorted(ranking, key=lambda x: x[0].get_name())
    ranking = sorted(ranking, key=lambda x: x[1], reverse=True)
    return [x[0] for x in ranking[0:n]]

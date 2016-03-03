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

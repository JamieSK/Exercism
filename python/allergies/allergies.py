class Allergies(object):

    def __init__(self, score):
        score = score % 256
        all_allergies = ['cats', 'pollen', 'chocolate', 'tomatoes', 'strawberries', 'shellfish', 'peanuts', 'eggs']
        binary_score = format(score, '0>8b')
        self.allergies = []
        for i in range(len(all_allergies)):
            if binary_score[i] == "1":
                self.allergies.append(all_allergies[i])

    def is_allergic_to(self, item):
        return self.allergies.__contains__(item)

    @property
    def lst(self):
        return self.allergies
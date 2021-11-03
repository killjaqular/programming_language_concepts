from sys import argv, stdout
from random import randint
import random

MAX_LINE_LENGTH = 150
MAX_NAME_LENGTH = 50

class line:
    def __init__(self):
        self.line = ""
        self.length = 0

    def concat(self, string):
        self.line   += string
        self.length += len(string)

class generated_names:
    def __init__(self):
        self.all_names = []

    def append(self, name):
        self.all_names.append(name)

    def pop(self, index):
        return self.all_names.pop(index)

class generated_pairs:
    def __init__(self):
        self.all_pairs = {}

    def insert(self, new_type, pair):
        if new_type in self.all_pairs.keys():
            self.all_pairs[new_type].append(pair)
        else:
            self.all_pairs[new_type] = []
            self.all_pairs[new_type].append(pair)

    def copypair(self):
        action = random.choice(".?")
        return self.all_pairs[action][random.randrange(len(self.all_pairs[action]))]

def generate_name():
    name = ""

    for every_char in range(random.randint(1, MAX_NAME_LENGTH)):
        name += random.choice("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-_=+[]{}|\\;':\"`~!@#$%^&*(),<>/")

    return name

generated_names = generated_names()
generated_pairs = generated_pairs()

# Generate names
for every_line in range(int(argv[1])):
    name     = generate_name()
    generated_names.append(name)
    name     = generate_name()
    generated_names.append(name)

# Generate pairs
for every_name in generated_names.all_names:
    left_tower  = generated_names.pop(random.randrange(len(generated_names.all_names)))
    right_tower = generated_names.pop(random.randrange(len(generated_names.all_names)))
    action = random.choice(".?")

    generated_pairs.insert(action, (left_tower, right_tower))

# Generate lines
for every_line in range(int(argv[1])):
    new_line    = line()

    pair = generated_pairs.copypair()

    new_line.concat(pair[0])
    new_line.concat(" ")
    new_line.concat(pair[1])
    new_line.concat(random.choice(".?"))

    stdout.write(f'{new_line.line}\n')

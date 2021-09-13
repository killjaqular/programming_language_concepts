from random import *
f = open("input.in", "w")

for test_case in range(1, 5):
	n = randint(1, 1000000000) # Starting population, an integer
	a = uniform(1, 5)          # Average contacted people, a float

	f.write(str(n) + " " + str(a) + "\n")

for test_case in range(1, 5):
	n = randint(1, 1000000000) # Starting population, an integer
	a = uniform(1, n - 1)      # Average contacted people, a float

	f.write(str(n) + " " + str(a) + "\n")

f.close()

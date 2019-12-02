
import math


def get_fuel(mass):
    return math.floor(mass / 3) - 2


sumoall = 0

with open("day1.input", "r") as infile:
    lines = infile.readlines()

for mass in lines: 
    print(f"Mass: {mass}")
    sumoall = sumoall + get_fuel(int(mass))

print(f"Summ: {sumoall}")



#print("Testing")
#print(get_fuel(12))
#print(get_fuel(14))
#print(get_fuel(1969))
#print(get_fuel(100756))
#

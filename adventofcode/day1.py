
import math

# Demo to make sure it works part 1
#print("Testing")
#print(get_fuel(12))
#print(get_fuel(14))
#print(get_fuel(1969))
#print(get_fuel(100756))
#

def get_fuel(mass, total=0):
    fuel = math.floor(mass / 3) - 2
    if fuel < 0:
        return 0
    else:
        return fuel


sumoall = 0

with open("day1.input", "r") as infile:
    lines = infile.readlines()

for mass in lines: 
#    print(f"Mass: {mass}")
    sumoall = sumoall + get_fuel(int(mass))

print(f"Sum for part 1: {sumoall}")



def get_fuel_recursive(mass, total=0):
    more = math.floor(mass / 3) - 2
    if more > 0:
        # print(more)
        total = get_fuel_recursive(more, more + total)
        return total
    else:
        return total


totalfuel = get_fuel_recursive(100756)

print(f"Demo info:  Module mass of 100756 fuel: {totalfuel}")

with open("day1.input", "r") as infile:
    lines = infile.readlines()

sumpart2 = 0
for mass in lines:
    sumpart2 = sumpart2 + get_fuel_recursive(int(mass))

print(f"Sum Day1 Part 2: {sumpart2}")
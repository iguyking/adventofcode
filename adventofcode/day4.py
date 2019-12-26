

def checkPW(testpw:int):
    mypw = str(testpw)
    increase = True
    pair = False

    for i in range(5):
        if mypw[i + 1] < mypw[i]:
            increase = False

    for i in range(10):
        if mypw.count(str(i)) == 2:
            pair = True

    return increase and pair


print(f"{checkPW(111111)} :Should be False in part 2")
print(f"{checkPW(223450)} :Should be False")
print(f"{checkPW(123789)} :Should be False")
print(f"{checkPW(666662)} :Should be False")
print(f"{checkPW(556666)} :Should be True")
print(f"{checkPW(555566)} :Should be True")
print(f"{checkPW(112233)} :Should be True")
print(f"{checkPW(123444)} :Should be False")
print(f"{checkPW(111122)} :Should be True")

count = 0
for puzzle in range(197487,673251):
    res = checkPW(puzzle)
    if res:
        print(f"{puzzle} is {res}")
        count = count + 1

print(f"Found {count} matches")

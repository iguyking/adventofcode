import collections

low = 197487
high = 673251

a1 = []
a2 = []

t = low

while True:
    d = list(str(t))
    
    for i in range(5):
        if d[i] > d[i+1]:
            d[i + 1:6] = d[i] * (5-i)
            t = int("".join(d))
            d = list(str(t))
            break
    
    if t > high:
        break
    if(collections.Counter(str(t)).most_common(1)[0][1] > 1):
        a1.append(t)
        
    if(2 in collections.Counter(str(t)).values()):
        a2.append(t)
    t += 1
    
print(len(a1), len(a2))
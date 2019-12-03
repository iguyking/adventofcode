
class OpCode(object):
    def execute_opcode(self, stream, ptr):
        op = stream[ptr]
        if op == 99:
            done = True
            return done, ptr+4

        pos1 = stream[ptr+1]
        pos2 = stream[ptr+2]
        end = stream[ptr+3]
        done = False
        if op == 1:
            stream[end] = stream[pos1] + stream[pos2]
        elif op == 2:
            stream[end] = stream[pos1] * stream[pos2]
        else:
            print(f"Invalid Ops Code {op} at position {ptr}")
            done = True
        return done, ptr+4
    
    def run(self, stream):
        ptr = 0
        done = False
        while not done:
            done, ptr = ops.execute_opcode(stream, ptr)
        return ",".join(map(str,stream))

ops = OpCode()

# example = [1,3,4,0,6,7,99]
# ops.run(example)
# print(example)

adventtest1 = [1,9,10,3,2,3,11,0,99,30,40,50]
print(f"Advent Test 1: {ops.run(adventtest1)}")

at2 = [1,0,0,0,99]
print(f"Advent Test 2: {ops.run(at2)}")

at3 = [2,3,0,3,99]
print(f"Advent Test 3: {ops.run(at3)}")

at4 = [2,4,4,5,99,0]
print(f"Advent Test 4: {ops.run(at4)}")

at5 = [1,1,1,4,99,5,6,0,99]
print(f"Advent Test 5: {ops.run(at5)}")


with open("day2.input", "r") as inputfile:
    line = inputfile.readline()

prog = line.strip().split(',')
prog = list(map(int, prog))

print(f"Day2 Part 1: {ops.run(prog)}")



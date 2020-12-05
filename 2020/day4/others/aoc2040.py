import re

#check ranges if they apply to a field
#expect the ruleset in either one of these two formats:
#   cm:150-193,in:59-76
#   1920-2002
def check_ranges(ranges,data):
    if ":" in ranges: #determine range to use if there are multiple units
        ranges=dict([x.split(":") for x in ranges.split(",")])[re.search("(\D+)",data).group()]
    num=int(re.search("(\d+)",data).group())
    (min,max)=ranges.split("-")
    return int(min)<=num<=int(max)
    
#print(check_ranges2("99-150","1111"))
#print(check_ranges2("cm:150-193,in:59-76","66cm"))

#given a ruleset, a rule name and a person(as dict) check the rule
def check_rule(rs,rule,data):
    if(rule in data):#see if the field exists in the passport data
        if(re.search("^"+rs[rule][0]+"$",data[rule])): #regex validation
            if len(rs[rule]) > 1: #check range if at a range rule exists
                return check_ranges(rs[rule][1],data[rule])
            else:
                return True #regex passed and there is no range check
    else:
        return False #rule failed because no field exists in the passport
        
#given a ruleset and text related to a person, check the passport
#expect mulitline input
def is_passport_valid(person,ruleset):
    fields=dict([x.split(":") for x in re.split("\n| ",person.rstrip())])
    return all(check_rule(ruleset,rule,fields) for rule in ruleset)

#read in the ruleset and a batch of passports
#calls is_valid function for each passport
def count_valid_passports(input_file,ruleset_file):
    ruleset = dict([ [re.split(" ",x)[0],re.split(" ",x)[1:]] for x in open(ruleset_file,"r").read().splitlines()])
    return sum([1 for p in open(input_file,"r").read().split("\n\n") if is_passport_valid(p,ruleset)])

print(count_valid_passports("input.txt","rules.txt"))

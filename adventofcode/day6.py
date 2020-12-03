class Tree(object):
    "Generic Tree node."
    def __init__(self, name='root', children=None, parent=None):
        self.name = name
        self.parent = parent
        self.children = []
        if children is not None:
            for child in children:
                self.add_child(child)

    def __repr__(self):
        return self.name

    def print_all(self, indent=''):
        print(indent, self)
        for child in self.children:
            child.print_all(f"{indent}  ")

    def add_child(self, name):
        self.children.append(Tree(name))

    def find_child(self, name):
        if self.name == name:
            return self
        for child in self.children:
            next = child.find_child(name)
            if next:
                return next
        return None


master = Tree("root")
# master.add_child("One")
# master.add_child("two")

# two = master.find_child("two")
# two.add_child("twoA")
# master.print_all()


with open("day6.test", "r") as input:
    line = input.readline()
    first, second = line.split(')')
    child = master.find_child(first)
    if child:
        child.add_child(second)
    else:
        master.add_child(second)

master.print_all()
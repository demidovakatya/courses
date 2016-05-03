# The list of nodes for this problem is initialized as follows:
nodes = []
for i in range(n):
    nodes.append(newNode(i)) # newNode takes one parameter, the number of the node

def addEdge(a, b):
    """A helper method, addEdge, is referenced in this problem. 
    The addEdge method takes two integers - representing nodes in the graph - 
    and adds a directed edge from the first node to the second node. 
    So, addEdge(8, 2) adds a directed edge from Node 8 to Node 2.
    """
    pass


#  Problem 5-1
for i in range(len(nodes)):
    x = random.choice(nodes)
    y = random.choice(nodes)
    addEdge(x, y)


# Problem 5-2
for i in range(len(nodes)):
    x = random.choice(nodes)
    y = random.choice(nodes)
    addEdge(x, y)
    addEdge(y, x)


# Problem 5-3
for i in range(len(nodes)):
    w = random.choice(nodes)
    x = random.choice(nodes)
    y = random.choice(nodes)
    z = random.choice(nodes)
    addEdge(w, x)
    addEdge(x, y)
    addEdge(y, z)
    addEdge(z, w)
    

# Problem 5-4
for x in nodes:
    for y in nodes:
        addEdge(x, y)
        addEdge(y, x)

# Problem 5-5
# The out degree of a node is the number of its neighbors, 
# i.e. for a node x, its degree is the number edges, of the form (x, y_i), 
# where y_i is some other node.
# Which graph has the largest out degree per node?
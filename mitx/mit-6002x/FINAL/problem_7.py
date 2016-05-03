# Graph optimization
#
# A set of data structures to represent graphs
#

class Node(object):
    def __init__(self, name):
        self.name = str(name)
        self.outbound = set([])
        self.inbound = set([])
    def getName(self):
        return self.name
    def __str__(self):
        return self.name
    def __repr__(self):
        return self.name
    def __eq__(self, other):
        return self.name == other.name
    def __ne__(self, other):
        return not self.__eq__(other)
    def __hash__(self):
        return self.name.__hash__()
    def get_outbound(self):
        return self.outbound
    def get_inbound(self):
        return self.inbound
    def get_out_degree(self):
        """an out-degree is the number of outgoing edges from the node"""
        return len(self.get_outbound())
    def get_in_degree(self):
        """an in-degree is the number of incoming edges to the node"""
        return len(self.get_inbound())


class Edge(object):
    def __init__(self, src, dest):
        self.src = src
        self.dest = dest
        self.src.outbound.add(dest)
        self.dest.inbound.add(src)
    def getSource(self):
        return self.src
    def getDestination(self):
        return self.dest
    def __str__(self):
        return '{0}->{1}'.format(self.src, self.dest)


class Digraph(object):
    """A directed graph"""
    def __init__(self):
        self.nodes = set([])
        self.edges = {}
        self.all_edges = set([])
    
    def addNode(self, node):
        if node in self.nodes:
            raise ValueError('Duplicate node')
        else:
            self.nodes.add(node)
            self.edges[node] = []
    
    def addEdge(self, edge):
        src = edge.getSource()
        dest = edge.getDestination()
        if not((src in self.nodes) and (dest in self.nodes)):
            raise ValueError('Node not in graph')
        self.edges[src].append(dest)
        # whenever a new edge—say it is (x,y)—is added
        # (x,y) is added to the list allEdges
        self.all_edges.add( (src, dest) )
    
    def childrenOf(self, node):
        return self.edges[node]
    
    def hasNode(self, node):
        return node in self.nodes
    
    def __str__(self):
        res = ''
        for e in self.all_edges:
            res = '{}{}\n'.format(res, e)
        return res[:-1]


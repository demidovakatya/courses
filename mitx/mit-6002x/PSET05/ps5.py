# 6.00.2x Problem Set 5
# Graph optimization
# Finding shortest paths through MIT buildings
#

import string
# This imports everything from `graph.py` as if it was defined in this file!
from graph import *

#
# Problem 2: Building up the Campus Map
#
# Before you write any code, write a couple of sentences here
# describing how you will model this problem as a graph.

# This is a helpful exercise to help you organize your
# thoughts before you tackle a big design problem!
#


def load_map(mapFilename):
    """
    Parses the map file and constructs a directed graph

    Parameters:
        mapFilename : name of the map file

    Assumes:
        Each entry in the map file consists of the following four positive
        integers, separated by a blank space:
            From To TotalDistance DistanceOutdoors
        e.g.
            32 76 54 23
        This entry would become an edge from 32 to 76.

    Returns:
        a directed graph representing the map
    """
    filenm = mapFilename
    rtngraph = WeightedDigraph()
    split_line = []
    with open(filenm) as infileso:
        for line in infileso:
            split_line = line.split()
            if Node(split_line[0]) not in rtngraph.nodes:
                # src node
                rtngraph.addNode(split_line[0])
            if Node(split_line[1]) not in rtngraph.nodes:
                # dest node
                rtngraph.addNode(split_line[1])

            # add edge
            sepedge = WeightedEdge(
                split_line[0], split_line[1], split_line[2], split_line[3])
            rtngraph.addEdge(sepedge)

    print("Loading map from file...")
    return rtngraph
'''
print "Begin...."
mitMap = load_map("mit_map.txt")
print mitMap.edges
'''
#
# Problem 3: Finding the Shortest Path using Brute Force Search
#
# State the optimization problem as a function to minimize
# and what the constraints are
#


def bruteForceSearch(digraph, start, end, maxTotalDist, maxDistOutdoors):
    """
    Finds the shortest path from start to end using brute-force approach.
    The total distance travelled on the path must not exceed maxTotalDist, and
    the distance spent outdoor on this path must not exceed maxDistOutdoors.
    Parameters:
        digraph: instance of class Digraph or its subclass
        start, end: start & end building numbers (strings)
        maxTotalDist : maximum total distance on a path (integer)
        maxDistOutdoors: maximum distance spent outdoors on a path (integer)
    Assumes:
        start and end are numbers for existing buildings in graph
    Returns:
        The shortest-path from start to end, represented by
        a list of building numbers (in strings), [n_1, n_2, ..., n_k],
        where there exists an edge from n_i to n_(i+1) in digraph,
        for all 1 <= i < k.
        If there exists no path that satisfies maxTotalDist and
        maxDistOutdoors constraints, then raises a ValueError.
    """
    all_edges = digraph.edges
    if not all_edges.get(Node(start)):
        raise ValueError('Invalid start node')

    shortest = DFS(digraph, start, end, [], [])

    print shortest
    if len(shortest) == 0:
        raise ValueError('No such path exits')

    distance = {}
    for path in shortest:
        distance_sum = 0.0
        outdoors_sum = 0.0
        for i in range(0, len(path) - 1):
            for dests in all_edges[Node(path[i])]:
                if str(dests[0]) == path[i + 1]:
                    distance_sum = distance_sum + dests[1][0]
                    outdoors_sum = outdoors_sum + dests[1][1]
        key = '-'.join(path)
        if distance_sum <= maxTotalDist and outdoors_sum <= maxDistOutdoors:
            distance[key] = distance_sum + outdoors_sum

    if not distance:
        raise ValueError('No such path exits')

    for k, v in distance.items():
        if v == min(distance.values()):
            return k.split('-')


def DFS(graph, start, end, path=[], avail_lst=[]):
    path = path + [start]
    if start == end:
        if path not in avail_lst:
            avail_lst.append(path)
        return avail_lst
    for node in graph.childrenOf(start):
        if str(node[0]) not in path:
            newPath = DFS(graph, str(node[0]), end, path, avail_lst)
            if newPath:
                for possible_path in newPath:
                    if possible_path not in avail_lst:
                        avail_lst.append(possible_path)
    return avail_lst

"""
print "Test begins..."

map5 = WeightedDigraph()
map5.addNode('1')
map5.addNode('2')
map5.addNode('3')
map5.addNode('4')
map5.addNode('5')
edge12 = WeightedEdge('1', '2', 5, 2)
map5.addEdge(edge12)
edge23 = WeightedEdge('2', '3', 20, 10)
map5.addEdge(edge23)
edge24 = WeightedEdge('2', '4', 10, 5)
map5.addEdge(edge24)
edge35 = WeightedEdge('3', '5', 6, 3)
map5.addEdge(edge35)
edge43 = WeightedEdge('4', '3', 2, 1)
map5.addEdge(edge43)
edge45 = WeightedEdge('4', '5', 20, 10)
map5.addEdge(edge45)
# print map5
print bruteForceSearch(map5, "1", "3", 17, 8) == ['1', '2', '4', '3']
try:
    print bruteForceSearch(map5, "4", "5", 8, 2)
except ValueError:
    print "ValueError successfully raised"

print ""

map6 = WeightedDigraph()
map6.addNode('1')
map6.addNode('2')
map6.addNode('3')
map6.addNode('4')
map6.addNode('5')
edge12 = WeightedEdge('1', '2', 5, 2)
map6.addEdge(edge12)
edge23 = WeightedEdge('2', '3', 20, 10)
map6.addEdge(edge23)
edge24 = WeightedEdge('2', '4', 10, 5)
map6.addEdge(edge24)
edge35 = WeightedEdge('3', '5', 5, 1)
map6.addEdge(edge35)
edge43 = WeightedEdge('4', '3', 5, 1)
map6.addEdge(edge43)
edge45 = WeightedEdge('4', '5', 20, 1)
map6.addEdge(edge45)
# print map6

print bruteForceSearch(map6, "1", "5", 35, 9) == ['1', '2', '4', '3', '5']
print bruteForceSearch(map6, "1", "5", 35, 8) == ['1', '2', '4', '5']
print bruteForceSearch(map6, "4", "5", 21, 11) == ['4', '3', '5']
print bruteForceSearch(map6, "4", "5", 21, 1) == ['4', '5']
try:
    print bruteForceSearch(map6, "4", "5", 19, 1)
except ValueError:
    print "ValueError successfully raised"
try:
    print bruteForceSearch(map6, "3", "2", 100, 100)
except ValueError:
    print "ValueError successfully raised"
try:
    print bruteForceSearch(map6, "4", "5", 8, 2)
except ValueError:
    print "ValueError successfully raised"


print "Test ends..."
"""

#
# Problem 4: Finding the Shorest Path using Optimized Search Method
#


def directedDFS(digraph, start, end, maxTotalDist, maxDistOutdoors):
    """
    Finds the shortest path from start to end using directed depth-first.
    search approach. The total distance travelled on the path must not
    exceed maxTotalDist, and the distance spent outdoor on this path must
        not exceed maxDistOutdoors.

    Parameters:
        digraph: instance of class Digraph or its subclass
        start, end: start & end building numbers (strings)
        maxTotalDist : maximum total distance on a path (integer)
        maxDistOutdoors: maximum distance spent outdoors on a path (integer)

    Assumes:
        start and end are numbers for existing buildings in graph

    Returns:
        The shortest-path from start to end, represented by
        a list of building numbers (in strings), [n_1, n_2, ..., n_k],
        where there exists an edge from n_i to n_(i+1) in digraph,
        for all 1 <= i < k.

        If there exists no path that satisfies maxTotalDist and
        maxDistOutdoors constraints, then raises a ValueError.
    """
    possible_paths = DFS2(
        digraph, start, end, maxTotalDist, maxDistOutdoors, [], {}, 0, 0)

    if len(possible_paths) == 0:
        raise ValueError

    for k, v in possible_paths.items():
        if v == min(possible_paths.values()):
            if len(k.split('-')) == 0:
                raise ValueError
            else:
                return k.split('-')


def DFS2(graph, start, end, maxTotalDist, maxDistOutdoors, path=[], avail_rut={}, total_distance=0, total_outdoors=0):
    path = path + [start]
    if start == end:
        if not avail_rut.get('-'.join(path)):
            total_distance += getDistance(graph, start, end)[0]
            total_outdoors += getDistance(graph, start, end)[1]
            # avail_lst.append({'-'.join(path): (total_distance,
            # total_outdoors)})
            avail_rut['-'.join(path)] = total_distance + total_outdoors
        return avail_rut
    for node in graph.childrenOf(start):
        if str(node[0]) not in path:
            tmp_distance = total_distance + \
                getDistance(graph, start, str(node[0]))[0]
            tmp_outdoors = total_outdoors + \
                getDistance(graph, start, str(node[0]))[1]
            if tmp_distance <= maxTotalDist and tmp_outdoors <= maxDistOutdoors:
                newPath = DFS2(graph, str(
                    node[0]), end, maxTotalDist, maxDistOutdoors, path, avail_rut, tmp_distance, tmp_outdoors)
                if newPath:
                    for sub_path in newPath.keys():
                        if sub_path not in avail_rut.keys():
                            avail_rut[sub_path] = newPath[sub_path]
    return avail_rut


def getDistance(graph, start, end):
    edges = graph.edges
    for dests in edges[Node(start)]:
        if end == str(dests[0]):
            return (dests[1][0], dests[1][1])
    return (0, 0)

# map2 = WeightedDigraph()
# map2.addNode('1')
# map2.addNode('2')
# map2.addNode('3')
# map2.addNode('4')
# edge12 = WeightedEdge('1', '2', 10, 5)
# map2.addEdge(edge12)
# edge23 = WeightedEdge('2', '3', 8, 5)
# map2.addEdge(edge23)
# edge14 = WeightedEdge('1', '4', 5, 1)
# map2.addEdge(edge14)
# edge43 = WeightedEdge('4', '3', 8, 5)
# map2.addEdge(edge43)

# print directedDFS(map2, "1", "3", 18, 18) == ['1', '4', '3']
# print directedDFS(map2, "1", "3", 15, 15) == ['1', '4', '3']
# try:
#     print directedDFS(map2, "1", "3", 18, 0)
# except ValueError:
#     print "ValueError successfully raised"

# try:
#     print directedDFS(map2, "1", "3", 10, 10)
# except ValueError:
#     print "ValueError successfully raised"
# print ""

# map3 = WeightedDigraph()
# map3.addNode('1')
# map3.addNode('2')
# map3.addNode('3')
# map3.addNode('4')
# edge12 = WeightedEdge('1', '2', 10, 5)
# map3.addEdge(edge12)
# edge23 = WeightedEdge('2', '3', 8, 5)
# map3.addEdge(edge23)
# edge14 = WeightedEdge('1', '4', 15, 1)
# map3.addEdge(edge14)
# edge43 = WeightedEdge('4', '3', 8, 5)
# map3.addEdge(edge43)

# print directedDFS(map3, "1", "3", 18, 18) == ['1', '2', '3']
# try:
#     print directedDFS(map3, "1", "3", 18, 0)
# except ValueError:
#     print "ValueError successfully raised"

# try:
#     print directedDFS(map3, "1", "3", 10, 10)
# except ValueError:
#     print "ValueError successfully raised"
# print ""

# map4 = WeightedDigraph()
# map4.addNode('1')
# map4.addNode('2')
# map4.addNode('3')
# map4.addNode('4')
# map4.addNode('5')
# edge12 = WeightedEdge('1', '2', 5, 2)
# map4.addEdge(edge12)
# edge23 = WeightedEdge('2', '3', 10, 5)
# map4.addEdge(edge23)
# edge24 = WeightedEdge('2', '4', 20, 10)
# map4.addEdge(edge24)
# edge35 = WeightedEdge('3', '5', 6, 3)
# map4.addEdge(edge35)
# edge43 = WeightedEdge('4', '3', 2, 1)
# map4.addEdge(edge43)
# edge45 = WeightedEdge('4', '5', 20, 10)
# map4.addEdge(edge45)

# print directedDFS(map4, "1", "5", 21, 10) == ['1', '2', '3', '5']
# try:
#     print directedDFS(map4, "1", "5", 21, 9)
# except ValueError:
#     print "ValueError successfully raised"

# try:
#     print directedDFS(map4, "1", "5", 20, 20)
# except ValueError:
#     print "ValueError successfully raised"
# print ""

# map5 = WeightedDigraph()
# map5.addNode('1')
# map5.addNode('2')
# map5.addNode('3')
# map5.addNode('4')
# map5.addNode('5')
# edge12 = WeightedEdge('1', '2', 5, 2)
# map5.addEdge(edge12)
# edge23 = WeightedEdge('2', '3', 20, 10)
# map5.addEdge(edge23)
# edge24 = WeightedEdge('2', '4', 10, 5)
# map5.addEdge(edge24)
# edge35 = WeightedEdge('3', '5', 6, 3)
# map5.addEdge(edge35)
# edge43 = WeightedEdge('4', '3', 2, 1)
# map5.addEdge(edge43)
# edge45 = WeightedEdge('4', '5', 20, 10)
# map5.addEdge(edge45)
# print "map5"
# print directedDFS(map5, "1", "3", 17, 8) == ['1', '2', '4', '3']
# print directedDFS(map5, "1", "5", 23, 11) == ['1', '2', '4', '3', '5']
# print directedDFS(map5, "4", "5", 21, 11) == ['4', '3', '5']
# try:
#     print directedDFS(map5, "5", "1", 100, 100)
# except ValueError:
#     print "ValueError successfully raised"

# try:
#     print directedDFS(map5, "4", "5", 8, 2)
# except ValueError:
#     print "ValueError successfully raised"
# print ""


# map6 = WeightedDigraph()
# map6.addNode('1')
# map6.addNode('2')
# map6.addNode('3')
# map6.addNode('4')
# map6.addNode('5')
# edge12 = WeightedEdge('1', '2', 5, 2)
# map6.addEdge(edge12)
# edge23 = WeightedEdge('2', '3', 20, 10)
# map6.addEdge(edge23)
# edge24 = WeightedEdge('2', '4', 10, 5)
# map6.addEdge(edge24)
# edge35 = WeightedEdge('3', '5', 5, 1)
# map6.addEdge(edge35)
# edge43 = WeightedEdge('4', '3', 5, 1)
# map6.addEdge(edge43)
# edge45 = WeightedEdge('4', '5', 20, 1)
# map6.addEdge(edge45)
# print "map6"

# print directedDFS(map6, "1", "5", 35, 9) == ['1', '2', '4', '3', '5']
# print directedDFS(map6, "1", "5", 35, 8) == ['1', '2', '4', '5']
# print directedDFS(map6, "4", "5", 21, 11) == ['4', '3', '5']
# print directedDFS(map6, "4", "5", 21, 1) == ['4', '5']
# try:
#     print directedDFS(map6, "4", "5", 19, 1)
# except ValueError:
#     print "ValueError successfully raised"
# try:
#     print directedDFS(map6, "3", "2", 100, 100)
# except ValueError:
#     print "ValueError successfully raised"
# try:
#     print directedDFS(map6, "4", "5", 8, 2)
# except ValueError:
#     print "ValueError successfully raised"
# print ""



# """
# # Uncomment below when ready to test
# #### NOTE! These tests may take a few minutes to run!! ####
# if __name__ == '__main__':
#     # Test cases
#     mitMap = load_map("mit_map.txt")
#     print isinstance(mitMap, Digraph)
#     print isinstance(mitMap, WeightedDigraph)
#     print 'nodes', mitMap.nodes
#     print 'edges', mitMap.edges

#     LARGE_DIST = 1000000

#     # Test case 1
#     print "---------------"
#     print "Test case 1:"
#     print "Find the shortest-path from Building 32 to 56"
#     expectedPath1 = ['32', '56']
#     print 1111111
#     brutePath1 = bruteForceSearch(mitMap, '32', '56', LARGE_DIST, LARGE_DIST)
#     print 2222222
#     dfsPath1 = directedDFS(mitMap, '32', '56', LARGE_DIST, LARGE_DIST)
#     print "Expected: ", expectedPath1
#     print "Brute-force: ", brutePath1
#     print "DFS: ", dfsPath1
#     print "Correct? BFS: {0}; DFS: {1}".format(expectedPath1 == brutePath1, expectedPath1 == dfsPath1)
# """
# #     Test case 2
# #     print "---------------"
# #     print "Test case 2:"
# #     print "Find the shortest-path from Building 32 to 56 without going outdoors"
# #     expectedPath2 = ['32', '36', '26', '16', '56']
# #     brutePath2 = bruteForceSearch(mitMap, '32', '56', LARGE_DIST, 0)
# #     dfsPath2 = directedDFS(mitMap, '32', '56', LARGE_DIST, 0)
# #     print "Expected: ", expectedPath2
# #     print "Brute-force: ", brutePath2
# #     print "DFS: ", dfsPath2
# # print "Correct? BFS: {0}; DFS: {1}".format(expectedPath2 == brutePath2,
# # expectedPath2 == dfsPath2)

# #     Test case 3
# #     print "---------------"
# #     print "Test case 3:"
# #     print "Find the shortest-path from Building 2 to 9"
# #     expectedPath3 = ['2', '3', '7', '9']
# #     brutePath3 = bruteForceSearch(mitMap, '2', '9', LARGE_DIST, LARGE_DIST)
# #     dfsPath3 = directedDFS(mitMap, '2', '9', LARGE_DIST, LARGE_DIST)
# #     print "Expected: ", expectedPath3
# #     print "Brute-force: ", brutePath3
# #     print "DFS: ", dfsPath3
# # print "Correct? BFS: {0}; DFS: {1}".format(expectedPath3 == brutePath3,
# # expectedPath3 == dfsPath3)

# #     Test case 4
# #     print "---------------"
# #     print "Test case 4:"
# #     print "Find the shortest-path from Building 2 to 9 without going outdoors"
# #     expectedPath4 = ['2', '4', '10', '13', '9']
# #     brutePath4 = bruteForceSearch(mitMap, '2', '9', LARGE_DIST, 0)
# #     dfsPath4 = directedDFS(mitMap, '2', '9', LARGE_DIST, 0)
# #     print "Expected: ", expectedPath4
# #     print "Brute-force: ", brutePath4
# #     print "DFS: ", dfsPath4
# # print "Correct? BFS: {0}; DFS: {1}".format(expectedPath4 == brutePath4,
# # expectedPath4 == dfsPath4)

# #     Test case 5
# #     print "---------------"
# #     print "Test case 5:"
# #     print "Find the shortest-path from Building 1 to 32"
# #     expectedPath5 = ['1', '4', '12', '32']
# #     brutePath5 = bruteForceSearch(mitMap, '1', '32', LARGE_DIST, LARGE_DIST)
# #     dfsPath5 = directedDFS(mitMap, '1', '32', LARGE_DIST, LARGE_DIST)
# #     print "Expected: ", expectedPath5
# #     print "Brute-force: ", brutePath5
# #     print "DFS: ", dfsPath5
# # print "Correct? BFS: {0}; DFS: {1}".format(expectedPath5 == brutePath5,
# # expectedPath5 == dfsPath5)

# #     Test case 6
# #     print "---------------"
# #     print "Test case 6:"
# #     print "Find the shortest-path from Building 1 to 32 without going outdoors"
# #     expectedPath6 = ['1', '3', '10', '4', '12', '24', '34', '36', '32']
# #     brutePath6 = bruteForceSearch(mitMap, '1', '32', LARGE_DIST, 0)
# #     dfsPath6 = directedDFS(mitMap, '1', '32', LARGE_DIST, 0)
# #     print "Expected: ", expectedPath6
# #     print "Brute-force: ", brutePath6
# #     print "DFS: ", dfsPath6
# # print "Correct? BFS: {0}; DFS: {1}".format(expectedPath6 == brutePath6,
# # expectedPath6 == dfsPath6)

# #     Test case 7
# #     print "---------------"
# #     print "Test case 7:"
# #     print "Find the shortest-path from Building 8 to 50 without going outdoors"
# #     bruteRaisedErr = 'No'
# #     dfsRaisedErr = 'No'
# #     try:
# #         bruteForceSearch(mitMap, '8', '50', LARGE_DIST, 0)
# #     except ValueError:
# #         bruteRaisedErr = 'Yes'

# #     try:
# #         directedDFS(mitMap, '8', '50', LARGE_DIST, 0)
# #     except ValueError:
# #         dfsRaisedErr = 'Yes'

# #     print "Expected: No such path! Should throw a value error."
# #     print "Did brute force search raise an error?", bruteRaisedErr
# #     print "Did DFS search raise an error?", dfsRaisedErr

# #     Test case 8
# #     print "---------------"
# #     print "Test case 8:"
# #     print "Find the shortest-path from Building 10 to 32 without walking"
# #     print "more than 100 meters in total"
# #     bruteRaisedErr = 'No'
# #     dfsRaisedErr = 'No'
# #     try:
# #         bruteForceSearch(mitMap, '10', '32', 100, LARGE_DIST)
# #     except ValueError:
# #         bruteRaisedErr = 'Yes'

# #     try:
# #         directedDFS(mitMap, '10', '32', 100, LARGE_DIST)
# #     except ValueError:
# #         dfsRaisedErr = 'Yes'

# #     print "Expected: No such path! Should throw a value error."
# #     print "Did brute force search raise an error?", bruteRaisedErr
# #     print "Did DFS search raise an error?", dfsRaisedErr
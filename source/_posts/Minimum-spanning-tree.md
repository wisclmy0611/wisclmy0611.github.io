---
title: Minimum spanning tree and Proof
date: 2017-12-14 02:42:52
tags: Algorithm
---

## Minimum spanning tree

### Kruskal's Algorithm

- **Proof.**

  - Cut Property:

    If edge e =(v, w) is the minimum-cost edge with one end in set S and the other in V-S, then every minimum spanning tree contains the edge e.

  - The proof of Cut property:

    构造一个比e贵的e',找到一个treeT有e'没有e。然后证明T‘比T cheaper。

  - The proof of Kruskal's Algorithm:

    consider any edge e = (v, w) addeed by Kruskal's Algorithm, and let S be the set of all nodes that before e is added. so v 属于S， w属于V-S, because adding e does not create a cycle. Moreover, no edge from S to V-S has been encountered yet, since any such edge could have been added without creating a cycle. Thus e is the cheapest edge with one end in S and the other in V-S. Therefore, by cut property, it belongs to every minimum spanning tree.

- **Complexity.**

  O(mlogn) (use union-find)

### Prim's Algorithm

- **Proof.**

- **Complexity.**

  O(mlogn) (use heap)

### Reverse-Delete Algorithm

- **Proof. **

  - Cycle Property: 

    ​The most expensive edge on C will not belong to any minimum spanning tree of G.

  - The proof of cycle property: 

    ​a path P with one end at v and the other at w, and begin in S and end up in V-S, we can find some edge e' that crosses from S to V-S. Then consider the spanning tree with e' and without e. 

    ​As the proof in cut property, (first) the graph is connected and has no cycles, so the T' is a spanning tree. (second) since e is the most expensive edge on the cycle C, and e' belongs to C, it must be that e' is cheaper than e, so T' is cheaper than T as desired.

  ​

  - The proof of Reverse-Delete Algorithm 

    ​Before e is removed, it is a part of cycle C. Since it is the first edge encountered by the algorithm in decreasing oreder of edge costs, it must be the most expensive edge on C. Then by Cycle property, e does not belong to any minimum spanning tree.

    ​Then prove that the output (V, T) is a spanning tree of G. (first prove it is connected) Because the algorithm never removes an edge when this will disconnect the graph, (V, T) is connected. (Then prove it is a tree, which means there is no cycle in the Graph) suppose that (V, T) contains a cycle C. Since the most expensive edge e on C will be removed by the algorithm, so there will not be cycle.
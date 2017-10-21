---
title: P/NP/NP-Complete
date: 2017-07-25 18:22:03
tags: Algorithm
---

# Definition

p problem: a problem can be solved in polynomial time

np problem: a candidate answer given to the problem can be tested in polynomial time

np-complete: (prove)

1. prove np

2. every problems in NP can be reduced to an np complete (If Y is an NP-complete problem, and X is a problem in NP with the
   property that Y ≤P X, then X is NP-complete.)

   Which means, there is another NP-complete problem Y such that Y ≤ p X


   ​			
   ​		
   ​	



# Lemma

(8.1) Suppose Y ≤P X. If X can be solved in polynomial time, then Y can be
solved in polynomial time.

(8.2) Suppose Y ≤P X. If Y cannot be solved in polynomial time, then X
cannot be solved in polynomial time.

# Classic problem

## Vertex cover

Given a graph G = (V, E), we say that a set of nodes S ⊆ V is a vertex cover if every edge e ∈ E has at least one end in S.

- **Reducing to Set cover**

Set cover: Given a set U of n elements, a collection S1, . . . , Sm of subsets of U, and a number k, does there exist a collection of at most k of these sets whose union is equal to all of U?

- **(8.6) Vertex Cover ≤P Set Cover.**

**Proof.** Suppose we have access to a black box that can solve Set Cover, and
consider an arbitrary instance of Vertex Cover, specified by a graph G = (V , E)
and a number k. How can we use the black box to help us?


Our goal is to cover the edges in E, so we formulate an instance of SetCover in which the ground set U is equal to E. Each time we pick a vertex inthe Vertex Cover Problem, we cover all the edges incident to it; thus, for eachvertex i ∈ V, we add a set Si ⊆ U to our Set Cover instance, consisting of allthe edges in G incident to i.

WenowclaimthatU canbecoveredwithatmostkofthesetsS1,...,Snif and only if G has a vertex cover of size at most k. This can be proved veryeasily. For if Si1,...,Sil are l≤k sets that cover U, then every edge in G isincident to one of the vertices i1,...,il, and so the set {i1,...,il} is a vertexcover in G of size l ≤ k. Conversely, if {i1, . . . , il} is a vertex cover in G of sizel≤k, then the sets Si1,...,Sil cover U.

Thus, given our instance of Vertex Cover, we formulate the instance ofSet Cover described above, and pass it to our black box. We answer yes if andonly if the black box answers yes.

## The Satisfiability Problem







# NP-Complete Problems

Arguably the most natural way to define a “hardest” problem X is via the
following two properties: (i) X ∈ NP; and (ii) for all Y ∈ NP, Y ≤P X. In other

words, we require that every problem in NP can be reduced to X. We will call
such an X an NP-complete problem.


(8.12) Suppose X is an NP-complete problem. Then X is solvable in polyno-

mial time if and only if P = NP.			

(8.13) Circuit Satisfiability is NP-complete.

(8.14) If Y is an NP-complete problem, and X is a problem in NP with the
property that Y ≤P X, then X is NP-complete.


(8.15) 3-Satisfiability is NP-complete.


(8.16) All of the following problems are NP-complete: Independent Set, Set
Packing, Vertex Cover, and Set Cover.


​			
​		
​			
​		
​	









References:

Kleinberg, J. (2005) *Algorithm Design,* Pearson Education, Inc.	
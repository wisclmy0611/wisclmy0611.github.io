---
title: Sample DP Problems
date: 2017-12-14 04:25:24
tags: Algorithm
---

# Problem1

**During spring break you are planning to make a road trip from Madison to Miami, and want to stop at various tourist locations along the way for sight-seeing. You have a map (in the form of a graph) of all the locations showing the time it takes to go from any one location to another. You have a limited amount of time for the trip, so you want to spend no more than x hours driving. Furthermore, you want to plan your trip in such a way that each location you visit is closer to Miami than the previous one.**

Design a DP-based algorithm that returns a route from Madison to Miami with total driving time at most x hours, and that visits the maximum possible number of locations enroute. Your algorithm should run in time polynomial in the size of the graph (number of vertices and edges), independent of x.



## Solution

Sort all locations into a list by the driving time they need from their location to Miami. Suppose there are n locations in total including Madison and Miami, then Madison is the $1^{th}$ element and Miami is $n^{th}$ element. Then we can construct an array M[n, n] such that M[i, j] stores the driving time from i to j (i < j). Since we want to keep the distance from our car to Miami decreasing during the trip, we cannot visit 1, ...., ${i-1}^{th} $ location if we visit i. Let Opt(n, x) be the maximum number of city we can visit if our destination is the $n^{th}$ city and the duration of the trip is x. Then we can have following recurrence:

$Opt(n, w) = {max(Opt(i, x - t_{i,n}))}_{1 <= i <= n-1} +1$ 

Then we can design our algorithm like following:

```
Opt(n,w){
	C[1... n, 0....x]
	for i = 1 to n:
		for j = 0 to x:
			C[i,j] = max(C[k, j - M[k,i]]) + 1 // 1 ≤ k ≤ i
		EndFor
	EndFor
	Return C[n, w]
}
```

Therefore, we can find the maximum locations that we can visit in $O(n^3)$ operations, which is polynomial time as desired.



# Problem2

**You are given an arithmetic expression containing n integers and n − 1 operators, each either +, −, or ×. Your goal is to perform the operations in an order that maximizes the value of the expression.**

For example:

• For the expression 6 × 3 + 2 × 5, the optimal ordering is to add the middle numbers first,then perform the multiplications: ((6 × (3 + 2)) × 5) = 150.

• For the expression (−3) × 3 + 3, the optimal ordering is (((−3) × 3) + 3) = −6.

• For the expression (−3) × 3 − 3, the optimal ordering is ((−3) × (3 − 3)) = 0.
Give a polynomial-time algorithm to find the maximum possible value of the given expression.

## Solution

Suppose there is an optimal solution Opt(A[n]) where A[n] is an array storing the sequnce of the numbers. Then we can observe the following recurrence 

$Opt(A[1: n]) = {Max(Opt(A[1:i] operation Opt(A[i: n])))}_{1<=i<=n} $

```
Opt(n){
	M[1...n, 1...n]
	for i from 1 to n:
		for j from j to n:
			M[i,j] = Max(M[i,k] operation M[k, j])))// i ≤ k ≤j 
		EndFor
	EndFor
	Return M[1, n]
}
```



# Problem3

**Consider the setting of the weighted interval scheduling problem from class, but with two identical machines rather than a single machine. In order to execute a job, one of the machines needs to be reserved for the entire duration of the job.**

Develop a polynomial-time algorithm to construct an optimal schedule.



## solution

Assume all n tasks are distinct. That is to say, the finishing time of the last task on the first machine is different from the one on the second machine. Then we sort the n tasks in ascending order of their finishing time. <u>Assume v(n) is the largest index of the job that compatible with $n^{th}$ task</u> and Opt(n) is optimal solution on the set of job from 1 to n. Then, here is the reasoning: 

1. If n is not in the optimal solution:

   then $Opt(n) = Opt(n-1)$. We just move on to exam next task.

2. If n is in the optimal solution: 

   Suppose $n^{th}$ task is arranged on the first machine, then the last job on the second one would be the task which finishing time is between the $v(n)^{th}$ job and the $n^{th}$ job.         

   ==> $Opt(n) = {max(Opt(i))}_{v(n) ≤ i ≤ n -1} + 1$

   Combine these two cases together we can get the following recurrence:

   ==> $Opt(n) = max(Opt(n-1), {max(Opt(i))}_{v(n) ≤ i ≤ n -1} + 1)$

```
Opt(n){
	M[1…n, 0…w]  // assume the period start from 0
	for i = 1 to n:
		for j = 0 to w:
			 M(i,j) = max(M(i-1, j), {max(M[k,j]}_{v(n) ≤ k ≤ n -1} + 1)	
		EndFor
	EndFor
	Return M[n,w]			
}
```




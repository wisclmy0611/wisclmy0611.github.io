---
title: Dynamic programming
date: 2017-07-11 01:37:32
tags: Algorithm
---

# Dynamic Programming 动态规划

 	

​	Unfortunally, not all problems can come to an optimal solution by greedy algorithm. Sometimes, there are no natural greedy algorithm works. Compared to divide and conquer, when facing exponential search, we can use a powerful technique, dynamic programming.

​	Dynamic programming can simply described as dividing a problem into a series of subproblems, and then building up correct solutions to larger and larger subproblems (like brute-force search).

​	不是所有问题都能用贪心算法解决，我们可以尝试动态规划。动态规划就是把一个问题分成一系列子问题，然后把解向更高一级子问题增进。（类似穷举法）

## Recursive Procedure : Weighted Interval Scheduling Problem

### A recursive algorithm

1. first do recursive procedure
2. building up solutions to larger and larger subproblems

**Objective**: Maximize the total weight of tasks to be scheduled.

![DP1](https://raw.githubusercontent.com/wisclmy0611/MarkdownPhotos/master/Algorithm/DP1.png)

$u_1, u_3,u_5$: 2 + 4 + 2 = 8

suppose that the tasks are sorted in nondecreasing finish time.

we define $p(j)$ to be the largest index $i < j$  that $i$ is the leftmost interval ends before $j$ begins. If no such request, $p(j) = 0$.

consider an optimal solution $O$. If the last interval n is an element of $O$, then there are no interval between $p(j)$ and $j$ can belong to $O$. Also, $O$ must include an optimal solution of requests {1, …, $p(n)$}, because if didn't, we could replace the choice of requests with a better one.

![DP2](https://raw.githubusercontent.com/wisclmy0611/MarkdownPhotos/master/Algorithm/DP2.png)

If $n$ isn't an element of $O$, then $O$ equals to the optimal solution to the problem {1, …. n-1}.

Thus, for any value of $j$ between 1 and $n$, let $O_j$ denote the optimal solution to the problem {1, …, j}, and let OPT(j) denote the value of the solution. OPT(0) =0.

OPT(j) = max ($v_j$ + OPT(p(j)), OPT(j-1)) —— either n belongs to $O$ or not

​

**Algorithm:**

```
Compute — Opt(j)
	if (j = 0)
		return 0;
	Else
		return max(U_n + Opt(P(N)), Opt(n-1))
End
```

**Proof:**

we can proof its correction by induction.

**Disadvantage**

The algorithm written above will take exponential time to run in the worst case because the tree widens very quickly due to the recursive branching, which is like the Fibonacci numbers.

![DP3](https://raw.githubusercontent.com/wisclmy0611/MarkdownPhotos/master/Algorithm/DP3.png)

##  

### Memorizing the Recursion

To reduce the running time of the algorithm we mentioned above to polynomial time, we could store the value of **Compute-Opt** in a globally accessible place the first time we compute it, and then use it in place of all future recursive calls. The technique is called **memoization**.

suppose there is an array M[0,…, n], and M[j] will start with the value “empty,” but will hold the value of Compute-Opt(j) as soon as it is first determined.

``` 
M-Compute-Opt(j) 
	If j=0 then 
		Return 0
	Else if M[j] is not empty then 
		Return M[j]
	Else
		Define M[j] = max(vj+M-Compute-Opt(p(j)), M-Compute-Opt(j − 1)) 
			Return M[j]
	Endif
```

The running time of **M-Compute-Opt(n)** is $O(n)$ (if the intervals are sorted by finish times)

**Proof**

At first, the number of non-empty M[j] is 0. Each time the procedure invoke the recurrence, issuing two recursicve calls to  **M-Compute-Opt**, the number of non-empty M[j] increases by 1. Since M has only n+1 entries, it follows that there can be at most $O(n)$ calls to  **M-Compute-Opt**, so the running time is $O(n)$ as desired.

### Computing a Solution in Addition to Its Value

We know that $j$ belongs to an optimal solution for the set of intervals {1, . . . , j} if and only if vj + OPT(p(j)) ≥ OPT(j − 1). 

``` 
Find-Solution(j) 
	If j=0 then
        Output nothing
    Else
		If vj+M[p(j)]≥M[j−1] then
			Output j together with the result of Find-Solution(p(j))
		Else
			Output the result of Find-Solution(j − 1)
		Endif 
Endif

```

The complexity is $O(n)$.

## Iterative building up of subproblems

Obviously, the essence of the algorithm above is the array M. We can directly compute the entries in M by an iterative algorithm instead of the memoized recursion. We start with M[0] = 0, and keep increasing $j$.

```
Iterative-Compute-Opt
	M[0]=0
	For j=1,2,...,n
		M[j]= max(vj + M[p(j)], M[j − 1]) 
	Endfor
```

The complexity is $O(n)$. In each iteration, one entry in M will be filled.

![DP4](https://raw.githubusercontent.com/wisclmy0611/MarkdownPhotos/master/Algorithm/DP4.png)

## Principles: Memoization or Iteration over Subproblems

**Situations that DP can be applied:**

1. The number of subproblems is polynomial.

2. The solution of the original problem can be computed from solutions to subproblems.

3. There is a natural ordering of problems from smallest to largest, and there is a easy-to-compute recurrence.	

   ​

## Segmented Least Squares: Multi-way Choices

**Multi-way choices:** at each step, we have a polynomial number of possibilities to consider for the structure of the optimal solution, compared to only 2 in the above question.

### Problem 1: Linear Match of Date

Given a series of points $P_1, P_2… P_n$ with $P_i$ (i from 1 to n) = $(x_i, y_i)$ 

find the best match of line y = ax +b

- Hint: to minimize the error(L, P):

  ![DP5](https://raw.githubusercontent.com/wisclmy0611/MarkdownPhotos/master/Algorithm/DP5c.png)

Skipping the derivation and we can come to the result : the line of minimum error is y = ax + b, where

![DP6](https://raw.githubusercontent.com/wisclmy0611/MarkdownPhotos/master/Algorithm/DP6.png)

If we use two lines, we could achieve quite a small error.

![DP7](https://raw.githubusercontent.com/wisclmy0611/MarkdownPhotos/master/Algorithm/DP7.png)

### Change Detection

Given a sequence of data points, we want to identify a few points in the sequence at which a discrete change occurs. (In this case, a change from one linear approximation to another)










References:

Kleinberg, J. (2005) *Algorithm Design,* Pearson Education, Inc.
---
title: Dynamic programming
date: 2017-07-11 01:37:32
tags: Algorithm
---

# Dynamic Programming 动态规划

 	Unfortunally, not all problems can come to an optimal solution by greedy algorithm. Sometimes, there are no natural greedy algorithm works. Compared to divide and conquer, when facing exponential search, we can use a powerful technique, dynamic programming.

​	Dynamic programming can simply described as dividing a problem into a series of subproblems, and then building up correct solutions to larger and larger subproblems (like brute-force search).

​	不是所有问题都能用贪心算法解决，我们可以尝试动态规划。动态规划就是把一个问题分成一系列子问题，然后把解向更高一级子问题增进。（类似穷举法）

## Recursive Procedure

- **Weighted Interval Scheduling**

  1. first do recursive procedure
  2. building up solutions to larger and larger subproblems

  **Objective**: Maximize the total weight of tasks to be scheduled.

  > 1. ————— $u_1$ = 2
  > 2. ​     ——————— $u_2$ = 4
  > 3. ​                        —————— $u_3$ = 4
  > 4. ​         ———————————————————— $u_4$ = 7
  > 5. ​                                                                   —————————— $u_5$ = 2
  > 6. ​                                                                         ———————————— $u_6$ = 1

  $u_1, u_3,u_5$: 2 + 4 + 2 = 8

  suppose that the tasks are sorted in nondecreasing finish time.

  we define $p(j)$ to be the largest index $i < j$  that $i$ is the leftmost interval ends before $j$ begins. If no such request, $p(j) = 0$.

  consider an optimal solution $O$. If the last interval n is an element of $O$, then there are no interval between $p(j)$ and $j$ can belong to $O$. Also, $O$ must include an optimal solution of requests {1, …, $p(n)$}, because if didn't, we could replace the choice of requests with a better one.

  > 1. ————— $u_1$ = 2                                                                                                               p(1) = 0
  > 2. ​     ——————— $u_2$ = 4                                                                                                  p(2) = 0
  > 3. ​                        —————— $u_3$ = 4                                                                                   p(3) = 1
  > 4. ​         ———————————————————— $u_4$ = 7                                            p(4) = 0
  > 5. ​                                                                   —————————— $u_5$ = 2                        p(5) = 3
  > 6. ​                                                                         ———————————— $u_6$ = 1          p(6) = 3

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



















References:

Kleinberg, J. (2005) *Algorithm Design,* Pearson Education, Inc.
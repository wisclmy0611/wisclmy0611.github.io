---
title: Dynamic_programming
date: 2017-07-11 01:37:32
tags: Algorithm
---

**Dynamic Programming 动态规划**

<<<<<<< HEAD
​        Unfortunally, not all problems can come to an optimal solution by greedy algorithm. Sometimes, there are no natural greedy algorithm works. Compared to divide and conquer, when facing exponential search, we can use a powerful technique, dynamic programming.

​        dynamic programming can simply described as dividing a problem into a series of subproblems, and then building up correct solutions to larger and larger subproblems (like brute-force search).

> 不是所有问题都能用贪心算法解决，我们可以尝试动态规划。动态规划就是把一个问题分成一系列子问题，然后把解向更高一级子问题增进。（类似穷举法）

- **Recursive Procedure**

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

=======
​        Unfortunally, not all problems can come to an optimal solution by greedy algorithm. Sometimes, there are no natural greedy algorithm works. When facing exponential search, we can use a powerful technique, dynamic programming.

​        dynamic programming can simply described as dividing a problem into a series of subproblems, and then building up correct solutions to larger and larger subproblems (like brute-force search).

- **Recursive Procedure**
  - **Weighted Interval Scheduling**

>>>>>>> 2e946464a96d848f427487f5d5f1784d0a87fe34


























References:

Kleinberg, J. (2005) *Algorithm Design,* Pearson Education, Inc.
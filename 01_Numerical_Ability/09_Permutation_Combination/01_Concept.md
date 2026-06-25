---
title: "Permutations & Combinations - Concept Guide"
section: "Numerical Ability"
---

# Permutation & Combination Concept Guide

## 1. Introduction to Counting Principles
### What is this?
Permutation and Combination are mathematical tools used to count the number of ways to arrange or select items from a group without list-writing every possibility.

### Why does TCS ask this?
TCS NQT tests these concepts to evaluate your logical structuring ability and your skill in filtering out invalid cases under pressure, which mimics real-world database queries and algorithm design.

### How do I recognize it?
Look for keywords like: *"arrange"*, *"select"*, *"form numbers"*, *"vowels together"*, *"handshakes"*, *"committee"*, *"ways to distribute"*, or *"grid paths"*.

### What is the fastest way to solve it?
Master the product rule of counting, memorize small factorials ($1!$ to $7!$), and use the cross-out rank shortcut for word dictionary questions.

### What is the most common trap?
Using Permutations ($^nP_r$) when order does not matter, or forgetting to divide by duplicate factorials when identical items are present.

### What does a hard version look like?
Advanced group distribution (Beggar's method with lower and upper limits) or complex circular permutations combined with relative placement constraints.

---

## 2. The Fundamental Principles of Counting

Before using formulas, you must master the two foundational rules that govern all counting:

```
                          How are events connected?
                                     |
               +---------------------+---------------------+
               |                                           |
         Connected by OR?                             Connected by AND?
               |                                           |
          [ADD THE WAYS]                            [MULTIPLY THE WAYS]
     (Addition/Sum Principle)                   (Multiplication/Product)
```

### A. The Sum Rule (Addition Principle)
If event A can occur in $m$ ways and event B can occur in $n$ ways, and they cannot occur simultaneously, then the number of ways event A **OR** event B can occur is:
$$\text{Total Ways} = m + n$$

#### 💡 One-Line Derivation:
Since the events are mutually exclusive, the total sets of outcomes do not overlap, meaning their union size is simply the sum of their individual sizes.

#### Immediate Worked Example 1 (Sum Rule):
A student wants to select a project topic. They can choose from 5 topics in AI or 4 topics in Cybersecurity. In how many ways can they select exactly one topic?

#### Step-by-Step Solution:
1. Identify the relation: The student must choose AI **OR** Cybersecurity (not both).
2. Apply the Sum Rule:
   $$\text{Total Ways} = 5 + 4 = 9\text{ ways}$$

---

### B. The Product Rule (Multiplication Principle)
If event A can occur in $m$ ways and, following this, event B can occur in $n$ ways, then the number of ways both events A **AND** B can occur in sequence is:
$$\text{Total Ways} = m \times n$$

#### 💡 One-Line Derivation:
For each of the $m$ choices of the first event, there are $n$ distinct choices for the second event, resulting in a cartesian grid of size $m \times n$.

#### Immediate Worked Example 2 (Product Rule):
A student wants to choose one AI topic and one Cybersecurity topic. If there are 5 AI topics and 4 Cybersecurity topics, in how many ways can they make this pair selection?

#### Step-by-Step Solution:
1. Identify the relation: The student must choose AI **AND** Cybersecurity.
2. Apply the Product Rule:
   $$\text{Total Ways} = 5 \times 4 = 20\text{ ways}$$

---

## 3. Permutations (Arrangement)
A permutation is an **ordered arrangement** of elements. The order of elements matters completely (e.g., AB is different from BA).

```
                 Permutation = Selection AND Arrangement
                          Order Matters: (A, B) != (B, A)
```

### 💡 Derivation of Permutation Formula:
Suppose we have $n$ distinct items and we want to arrange them in $r$ empty slots.
*   The 1st slot can be filled in $n$ ways.
*   The 2nd slot can be filled in $(n-1)$ ways.
*   The $r$-th slot can be filled in $(n-r+1)$ ways.
By the product rule, the total ways to fill the slots is:
$$^nP_r = n \times (n-1) \times (n-2) \times \dots \times (n-r+1)$$
Multiplying and dividing by $(n-r)!$ yields:
$$^nP_r = \frac{n \times (n-1) \times \dots \times (n-r+1) \times (n-r)!}{(n-r)!} = \frac{n!}{(n-r)!}$$

#### Immediate Worked Example 3 (Permutation):
In how many ways can 3 distinct books be arranged on a shelf if selected from a box of 5 books?

#### Step-by-Step Solution:
1. Identify the problem: We are selecting and arranging 3 books from 5. Order matters.
2. Apply the formula: Here $n = 5$ and $r = 3$.
   $$^5P_3 = \frac{5!}{(5-3)!} = \frac{5!}{2!} = \frac{120}{2} = 60\text{ ways}$$

---

## 4. Combinations (Selection)
A combination is a **selection** of elements where the order does not matter (e.g., selecting A and B is the same as selecting B and A).

```
                        Combination = Selection ONLY
                          Order Does NOT Matter: {A, B} == {B, A}
```

### 💡 Derivation of Combination Formula:
Let the number of ways to select $r$ items from $n$ distinct items be $^nC_r$.
Once we select these $r$ items, we can arrange them among themselves in $r!$ ways.
According to the product rule, selecting and then arranging is equivalent to a permutation:
$$^nC_r \times r! = ^nP_r$$
Substitute the formula for $^nP_r$:
$$^nC_r \times r! = \frac{n!}{(n-r)!} \implies ^nC_r = \frac{n!}{r!(n-r)!}$$

#### Immediate Worked Example 4 (Combination):
A committee of 3 members needs to be selected from a group of 5 employees. In how many ways can this committee be formed?

#### Step-by-Step Solution:
1. Identify the problem: We are selecting 3 people from 5. The order of selection does not change the committee. Order does not matter.
2. Apply the formula: Here $n = 5$ and $r = 3$.
   $$^5C_3 = \frac{5!}{3!(5-3)!} = \frac{5 \times 4 \times 3!}{3! \times 2!} = \frac{20}{2} = 10\text{ ways}$$

---

## 5. Permutation vs Combination Comparison

| Feature | Permutation ($^nP_r$) | Combination ($^nC_r$) |
| :--- | :--- | :--- |
| **Core Concept** | Arrangement | Selection |
| **Order Relevance** | Critical (AB $\neq$ BA) | Irrelevant (\{A, B\} $\equiv$ \{B, A\}) |
| **Key Verbs** | Arrange, Align, Order, Rank | Select, Choose, Group, Combine |
| **Common Scenarios** | Words, numbers, circular tables, lines | Committees, cards, handshakes, team selection |
| **Formula Value** | Always larger ($^nP_r = ^nC_r \times r!$) | Always smaller |

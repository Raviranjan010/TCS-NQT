---
title: "Permutations & Combinations - Formula Sheet"
section: "Numerical Ability"
---

# Permutation & Combination Formulas

## 1. Summary Table of Formulas

| Concept | Scenario | Formula |
| :--- | :--- | :--- |
| **Linear Arrangement** | Arrange $r$ distinct items out of $n$ | $$^nP_r = \frac{n!}{(n-r)!}$$ |
| **Simple Selection** | Select $r$ distinct items out of $n$ | $$^nC_r = \frac{n!}{r!(n-r)!}$$ |
| **Permutation with Repeats** | Arrange $n$ items with duplicate groups of sizes $p, q, r$ | $$\frac{n!}{p! q! r!}$$ |
| **Circular Permutation (Relative)**| Arrange $n$ distinct people around a circular table | $$(n-1)!$$ |
| **Circular Permutation (Flipped)** | Arrange $n$ unique beads on a necklace | $$\frac{(n-1)!}{2}$$ |
| **Handshakes** | Total handshakes between $n$ people | $$^nC_2 = \frac{n(n-1)}{2}$$ |
| **Polygon Diagonals** | Diagonals in an $n$-sided polygon | $$^nC_2 - n = \frac{n(n-3)}{2}$$ |
| **Beggar's Method ($0+$)** | Distribute $N$ identical items to $R$ distinct bins | $$^{N+R-1}C_{R-1}$$ |
| **Beggar's Method ($1+$)** | Distribute $N$ identical items to $R$ distinct bins (each gets $\ge 1$) | $$^{N-1}C_{R-1}$$ |
| **Grid Paths** | Shortest paths from $(0,0)$ to $(R, C)$ moving Right & Up | $$^{R+C}C_R = \frac{(R+C)!}{R! C!}$$ |

---

## 2. Basic Permutation ($^nP_r$)
Arranging $r$ distinct objects selected from $n$ distinct objects.

### 💡 Derivation:
We have $r$ sequential slots to fill. The first slot has $n$ choices, the second $(n-1)$, and the $r$-th slot has $(n-r+1)$ choices. 
$$\text{Product} = n(n-1)\dots(n-r+1) = \frac{n(n-1)\dots(n-r+1) \times (n-r)!}{(n-r)!} = \frac{n!}{(n-r)!}$$

### Worked Example:
How many 3-letter codes can be formed using the letters $\{A, B, C, D, E\}$ without repetition?

#### Solution:
*   $n = 5$ (available letters), $r = 3$ (slots).
*   Calculation:
    $$^5P_3 = \frac{5!}{(5-3)!} = \frac{5!}{2!} = \frac{120}{2} = 60$$

---

## 3. Basic Combination ($^nC_r$)
Selecting $r$ distinct objects from $n$ distinct objects.

### 💡 Derivation:
Selecting $r$ items ($^nC_r$) and then arranging them ($r!$) is equivalent to the permutation of $r$ items from $n$ ($^nP_r$).
$$^nC_r \times r! = ^nP_r \implies ^nC_r = \frac{^nP_r}{r!} = \frac{n!}{r!(n-r)!}$$

### Worked Example:
Select a team of 3 players from a squad of 7.

#### Solution:
*   $n = 7, r = 3$.
*   Calculation:
    $$^7C_3 = \frac{7!}{3!(7-3)!} = \frac{7 \times 6 \times 5 \times 4!}{3 \times 2 \times 1 \times 4!} = \frac{210}{6} = 35$$

---

## 4. Permutations with Identical Objects (Repeats)
Arranging $n$ items when some items are identical.

### 💡 Derivation:
If all $n$ items were distinct, they could be arranged in $n!$ ways. However, if a group of $p$ items are identical, rearranging them among themselves does not change the result, causing a redundancy factor of $p!$. We must divide out this redundancy: $\frac{n!}{p!}$. Similarly for other identical groups of sizes $q, r$.

### Worked Example:
In how many ways can the letters of the word "TATA" be arranged?

#### Solution:
*   Total letters $n = 4$.
*   Duplicates: 'T' repeats 2 times ($p=2$), 'A' repeats 2 times ($q=2$).
*   Calculation:
    $$\text{Ways} = \frac{4!}{2! 2!} = \frac{24}{2 \times 2} = 6$$

---

## 5. Circular Permutations
Arranging $n$ objects in a circle.

### A. Clockwise and Anticlockwise Distinct (e.g., People)
$$P = (n-1)!$$

#### 💡 Derivation:
In a circle, absolute positions do not matter; only relative positions do. To break the symmetry of rotation, we must fix the position of exactly 1 object. The remaining $(n-1)$ objects are then arranged in a line relative to the fixed object in $(n-1)!$ ways.

#### Worked Example:
In how many ways can 6 people sit around a circular table?

#### Solution:
*   $n = 6$.
*   Calculation:
    $$(6-1)! = 5! = 120\text{ ways}$$

### B. Clockwise and Anticlockwise Indistinguishable (e.g., Bead Necklaces)
$$P = \frac{(n-1)!}{2}$$

#### 💡 Derivation:
A necklace can be flipped over. Flipping a circle turns clockwise arrangements into counter-clockwise ones. Since these two views represent the same physical necklace, we divide the circular permutation count by 2.

#### Worked Example:
In how many ways can 6 distinct beads be arranged on a necklace?

#### Solution:
*   $n = 6$.
*   Calculation:
    $$\text{Ways} = \frac{(6-1)!}{2} = \frac{5!}{2} = \frac{120}{2} = 60\text{ ways}$$

---

## 6. Handshakes and Polygons

### A. Handshakes
$$H = ^nC_2 = \frac{n(n-1)}{2}$$

#### 💡 Derivation:
A handshake occurs between exactly 2 people. The total number of handshakes is the number of ways to select a pair of people from a group of $n$ people.

#### Worked Example:
If there are 10 people in a room, how many handshakes occur if everyone shakes hands with everyone else?

#### Solution:
*   $n = 10$.
*   Calculation:
    $$^{10}C_2 = \frac{10 \times 9}{2} = 45\text{ handshakes}$$

### B. Polygon Diagonals
$$D = \frac{n(n-3)}{2}$$

#### 💡 Derivation:
An $n$-sided polygon has $n$ vertices. Connecting any two vertices forms a line. Total lines $= ^nC_2$. Of these lines, $n$ lines form the outer boundary edges. The remaining lines are diagonals.
$$D = ^nC_2 - n = \frac{n(n-1)}{2} - n = \frac{n^2 - n - 2n}{2} = \frac{n(n-3)}{2}$$

#### Worked Example:
How many diagonals are in a hexagon (6-sided polygon)?

#### Solution:
*   $n = 6$.
*   Calculation:
    $$D = \frac{6 \times (6 - 3)}{2} = \frac{6 \times 3}{2} = 9\text{ diagonals}$$

---

## 7. Beggar's Method (Stars & Bars)
Distributing $N$ identical items into $R$ distinct groups.

### A. $0$ or More Items Per Group (No Constraints)
$$\text{Ways} = ^{N+R-1}C_{R-1}$$

#### 💡 Derivation:
Represent the $N$ items as identical stars (`*`) and the boundaries between the $R$ groups as $R-1$ identical bars (`|`). For example, distributing 5 items to 3 groups: `**|*|**` represents Group 1 getting 2, Group 2 getting 1, Group 3 getting 2. The problem reduces to arranging $(N + R - 1)$ total symbols, which consists of selecting positions for the $R-1$ bars: $^{N+R-1}C_{R-1}$.

#### Worked Example:
In how many ways can 5 identical chocolate coins be distributed among 3 children if a child can receive any number of coins (including zero)?

#### Solution:
*   $N = 5$ (identical items), $R = 3$ (distinct bins).
*   Calculation:
    $$^{5+3-1}C_{3-1} = ^7C_2 = \frac{7 \times 6}{2} = 21\text{ ways}$$

### B. At Least 1 Item Per Group (Positive Integer Solutions)
$$\text{Ways} = ^{N-1}C_{R-1}$$

#### 💡 Derivation:
Line up the $N$ identical stars in a row. There are $N-1$ spaces (gaps) between them. To divide them into $R$ groups where each group gets at least 1 star, we place $R-1$ dividers into these $N-1$ gaps. The number of ways to do this is $^{N-1}C_{R-1}$.

#### Worked Example:
In how many ways can 5 identical coins be distributed among 3 children such that each child gets at least one coin?

#### Solution:
*   $N = 5, R = 3$.
*   Calculation:
    $$^{5-1}C_{3-1} = ^4C_2 = \frac{4 \times 3}{2} = 6\text{ ways}$$

---

## 8. Grid Paths
Finding the shortest paths on a grid from $(0,0)$ to $(R, C)$.

### 💡 Derivation:
To travel from $(0,0)$ to $(R, C)$, a robot must make exactly $R$ horizontal moves (Right) and $C$ vertical moves (Up). The total moves required is $R+C$. Since all Right moves are identical and all Up moves are identical, the total distinct paths is the number of ways to choose which $R$ of the $R+C$ steps are Right moves: $^{R+C}C_R$.

### Worked Example:
Find the number of shortest paths for a robot to travel from the bottom-left corner $(0,0)$ to the top-right corner $(4,3)$ of a grid.

#### Solution:
*   Right moves $R = 4$, Up moves $C = 3$.
*   Calculation:
    $$^{4+3}C_4 = ^7C_4 = ^7C_3 = \frac{7 \times 6 \times 5}{3 \times 2 \times 1} = 35\text{ paths}$$

---
title: "Permutations & Combinations - PYQs"
section: "Numerical Ability"
---

# Permutation & Combination Previous Year Questions (PYQs)

---

**PYQ Pattern #1: Constrained Word Arrangement with Repeating Letters**

**Recognition Trigger:** When the question says "letters of the word... arranged such that [vowels/particular letters] are always together" $\implies$ this is a constrained repeating-letter word arrangement problem.

**Question:** In how many ways can the letters of the word "ENGINEERING" be arranged such that all three 'E's always sit together?

**Step 1 — Identify:** This is a string (tie-together) permutation problem with repeating letters.
**Step 2 — Set up:**
*   Letters in "ENGINEERING" (Total = 11).
    *   E repeats 3 times.
    *   N repeats 3 times.
    *   G repeats 2 times.
    *   I repeats 2 times.
    *   R repeats 1 time.
*   Tie the three 'E's into 1 block: `(EEE)`.
*   Count the items to arrange: 8 remaining letters + 1 block $= 9$ items.
*   The duplicates among these 9 items are: 'N' (3 times), 'G' (2 times), 'I' (2 times).
*   Formula for outer arrangement: $\frac{9!}{3! 2! 2!}$.
*   Formula for inner arrangement of `(EEE)` block: $\frac{3!}{3!} = 1$ way (since all E's are identical).

**Step 3 — Calculate:**
$$\text{Outer Ways} = \frac{9 \times 8 \times 7 \times 6 \times 5 \times 4 \times 3!}{3! \times 2 \times 2} = \frac{9 \times 8 \times 7 \times 6 \times 5 \times 4}{4} = 9 \times 8 \times 7 \times 6 \times 5$$
$$\text{Outer Ways} = 72 \times 210 = 15,120$$
$$\text{Total Ways} = 15,120 \times 1 = 15,120$$

**Step 4 — Verify:** Without constraints, total arrangements would be $\frac{11!}{3! 3! 2! 2!} = 277,200$. Since we tied the 'E's together, the count should be significantly smaller. $15,120$ is mathematically consistent.

**Answer:** **15120**

**The Shortcut Version:**
$$\text{Group E's} \implies \text{Arrange } \{ (EEE), N, G, I, N, E, R, I, N, G \} \text{ minus E's} \implies \frac{9!}{3!2!2!} = 15,120$$

**If this question appeared harder:**
If the 'E's had to be *never* together, we would apply the Gap Method: Arrange the other 8 letters first ($\frac{8!}{3!2!2!}$), identify 9 gaps, and choose 3 gaps for the 'E's ($^9C_3$).

**Exam Trap:**
Forgetting to divide by the repeating letters inside the outer arrangement (like dividing by $3!$ for 'N' and $2!$ for 'G'/'I'), which leads to an overcount of $362,880$.

---

**PYQ Pattern #2: Unconstrained Beggar's Method**

**Recognition Trigger:** When the question says "distribute X identical balls/coins to Y distinct people/boxes... each gets any number" $\implies$ this is an unconstrained Beggar's Method problem.

**Question:** In how many ways can 8 identical coins be distributed among 3 children such that each child can receive any number of coins (including zero)?

**Step 1 — Identify:** This is a distribution of identical items to distinct groups with no lower limit ($0+$), matching the Stars & Bars unconstrained model.
**Step 2 — Set up:** Use the formula:
$$\text{Ways} = ^{N+R-1}C_{R-1}$$
where $N = 8$ (coins) and $R = 3$ (children).

**Step 3 — Calculate:**
$$\text{Ways} = ^{8+3-1}C_{3-1} = ^{10}C_2$$
Apply combination shortcut:
$$\text{Ways} = \frac{10 \times 9}{2} = 45$$

**Step 4 — Verify:** Draw a few combinations: $(8, 0, 0) \implies 3$ ways; $(7, 1, 0) \implies 6$ ways, etc. Summing all possibilities confirms 45 total.

**Answer:** **45**

**The Shortcut Version:**
$$N=8, R=3 \implies ^{8+3-1}C_{3-1} = ^{10}C_2 = 45$$

**If this question appeared harder:**
If each child must get at least 1 coin, use the positive integer formula: $^{N-1}C_{R-1} = ^7C_2 = 21$.

**Exam Trap:**
Using $^{N-1}C_{R-1}$ ($^{7}C_2 = 21$) by mistake because the student didn't check if "zero" was allowed. TCS frequently lists both 21 and 45 in the options.

---

**PYQ Pattern #3: Digit formation with parity (The Zero Boundary)**

**Recognition Trigger:** When the question says "form even numbers... digits cannot repeat" and the digit pool contains `0` $\implies$ this is a digit formation problem with a zero-boundary restriction.

**Question:** How many 4-digit even numbers can be formed using the digits $\{0, 1, 2, 3, 4, 5\}$ without repeating digits?

**Step 1 — Identify:** This is an arrangement of digits where the units position has constraints (even: must end in $0, 2, 4$), and the first position cannot be $0$.
**Step 2 — Set up:**
Because $0$ is involved in both the even constraint (units place) and the non-zero leading constraint (thousands place), we must split this into two mutually exclusive cases:
*   **Case 1: The number ends in $0$**
*   **Case 2: The number ends in $2$ or $4$**

**Step 3 — Calculate:**
*   **Case 1 (Ends in 0)**:
    *   Units slot: 1 choice (`0`).
    *   Thousands slot: 5 choices (any remaining digit $\{1,2,3,4,5\}$).
    *   Hundreds slot: 4 choices.
    *   Tens slot: 3 choices.
    *   $$\text{Ways}_1 = 5 \times 4 \times 3 \times 1 = 60$$
*   **Case 2 (Ends in 2 or 4)**:
    *   Units slot: 2 choices (`2` or `4`).
    *   Thousands slot: 4 choices (cannot be `0` and cannot be the digit placed in the units slot).
    *   Hundreds slot: 4 choices (can now include `0`).
    *   Tens slot: 3 choices.
    *   $$\text{Ways}_2 = 4 \times 4 \times 3 \times 2 = 96$$
*   Sum the cases:
    $$\text{Total even numbers} = 60 + 96 = 156$$

**Step 4 — Verify:** Total possible 4-digit numbers from this set is $5 \times 5 \times 4 \times 3 = 300$. Even numbers should be roughly half. $156$ is close to 150. Matches logic.

**Answer:** **156**

**The Shortcut Version:**
$$\text{Ends in 0}: 5 \times 4 \times 3 = 60$$
$$\text{Ends in 2,4}: 4 \times 4 \times 3 \times 2 = 96 \implies 60 + 96 = 156$$

**If this question appeared harder:**
If repetition was allowed: Thousands place has 5 choices, hundreds has 6, tens has 6, units has 3 $\implies 5 \times 6 \times 6 \times 3 = 540$ even numbers.

**Exam Trap:**
Not separating the case of $0$, which leads to calculating $5 \times 4 \times 3 \times 3 = 180$, which counts illegal numbers starting with $0$ (like `0132`).

---

**PYQ Pattern #4: Circular Alternate Seating**

**Recognition Trigger:** When the question says "men and women... sit around a circular table... no two women sit together" $\implies$ this is a circular alternate seating problem.

**Question:** In how many ways can 5 men and 5 women sit around a circular table such that no two women sit together?

**Step 1 — Identify:** This is a circular permutation with mutual exclusion constraints.
**Step 2 — Set up:**
1.  First arrange the unconstrained group (the 5 men) in a circle: $(5-1)!$ ways.
2.  Once the men are seated, they create 5 distinct circular gaps between them.
3.  Since these gaps are now distinct relative to the seated men, we arrange the 5 women in these 5 gaps in $5!$ ways.
4.  Total ways $= (5-1)! \times 5!$.

**Step 3 — Calculate:**
$$\text{Ways} = 4! \times 5!$$
$$\text{Ways} = 24 \times 120 = 2,880$$

**Step 4 — Verify:** Circular arrangement of 10 people without constraints is $9! = 362,880$. The alternating seating constraint significantly limits options, so a result of $2,880$ is reasonable.

**Answer:** **2880**

**The Shortcut Version:**
$$\text{Men circle} \times \text{Women linear gaps} \implies 4! \times 5! = 24 \times 120 = 2,880$$

**If this question appeared harder:**
If there were 5 men and only 3 women: arrange 5 men in circle ($4! = 24$), then select 3 gaps out of the 5 for the women ($^5C_3 \times 3! = 60$). Total $= 24 \times 60 = 1440$ ways.

**Exam Trap:**
Calculating $(5-1)! \times (5-1)! = 24 \times 24 = 576$. Once the first group is seated in the circle, the circular symmetry is broken, so the second group must be arranged linearly ($5!$), not circularly ($(5-1)!$).

---

**PYQ Pattern #5: Dictionary Rank of Word without Repetition**

**Recognition Trigger:** When the question asks for the "rank of word X in a dictionary" $\implies$ this is a lexicographical dictionary rank problem.

**Question:** Find the dictionary rank of the word "ZENITH".

**Step 1 — Identify:** This is a permutations rank problem with all distinct letters.
**Step 2 — Set up:**
1.  Alphabetical order of letters: `E, H, I, N, T, Z` (Positions: E=1, H=2, I=3, N=4, T=5, Z=6).
2.  Write ZENITH and assign factorials right-to-left:
    ```
    Z    E    N    I    T    H
    5!   4!   3!   2!   1!   0!
    ```
3.  Count smaller unused letters to the right of each letter:
    *   **Z**: 5 smaller letters (`E, H, I, N, T`).
    *   **E**: 0 smaller letters to its right.
    *   **N**: 2 smaller letters to its right (`H, I`).
    *   **I**: 1 smaller letter to its right (`H`).
    *   **T**: 1 smaller letter to its right (`H`).
    *   **H**: 0 smaller letters.

**Step 3 — Calculate:**
$$\text{Sum} = (5 \times 5!) + (0 \times 4!) + (2 \times 3!) + (1 \times 2!) + (1 \times 1!) + 0$$
$$\text{Sum} = (5 \times 120) + 0 + (2 \times 6) + 2 + 1 = 600 + 12 + 3 = 615$$
$$\text{Rank} = \text{Sum} + 1 = 615 + 1 = 616$$

**Step 4 — Verify:** Total permutations of "ZENITH" $= 6! = 720$. Since the word starts with 'Z' (the last letter alphabetically), the rank must be very close to 720. $616$ is correct.

**Answer:** **616**

**The Shortcut Version:**
$$5(120) + 0 + 2(6) + 1(2) + 1(1) + 0 = 615 \implies 615 + 1 = 616$$

**If this question appeared harder:**
If letters repeated (e.g. "GOOGLE"), we would divide each term by the factorials of repeating characters to the right of the current letter.

**Exam Trap:**
Forgetting to add $1$ at the final step, leading to the incorrect answer of $615$.

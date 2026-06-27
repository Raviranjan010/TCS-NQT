# Average — Worked Examples

This document contains 5 detailed, step-by-step worked examples representing common average questions in the TCS NQT.

---

## Example 1 — Average Speed (Harmonic Mean Trap)

### Problem Statement
A motorist travels from town A to town B at a speed of 40 km/h and returns to town A at a speed of 60 km/h. What is the average speed of the motorist for the entire journey?

### Step-by-Step Solution

1.  **Identify the Journey Type:**
    *   Since the motorist travels from A to B and returns from B to A, the distance covered in both segments is identical.
    *   Therefore, distance is constant, and we must use the **Harmonic Mean** formula instead of the arithmetic mean.

2.  **Apply the Harmonic Mean Formula:**
    $$v_{\text{avg}} = \frac{2 v_1 v_2}{v_1 + v_2}$$
    where $v_1 = 40$ km/h and $v_2 = 60$ km/h.

3.  **Perform the Calculation:**
    $$v_{\text{avg}} = \frac{2 \times 40 \times 60}{40 + 60}$$
    $$v_{\text{avg}} = \frac{4800}{100}$$
    $$v_{\text{avg}} = 48 \text{ km/h}$$

### Final Answer
The average speed of the motorist for the entire journey is **48 km/h**.

---

## Example 2 — Group Addition using Deviation Method

### Problem Statement
The average weight of 24 students in a class is 35 kg. If the weight of the teacher is included, the average weight increases by 400 grams. Find the weight of the teacher.

### Step-by-Step Solution

1.  **Convert Units to Standard Form:**
    *   Average increase = 400 grams = 0.4 kg.

2.  **Define Variables:**
    *   Initial count ($N$) = 24 students.
    *   Initial average = 35 kg.
    *   New count = 25 people (24 students + 1 teacher).
    *   New average = $35 + 0.4 = 35.4$ kg.

3.  **Apply the Deviation Method Shortcut:**
    $$\text{Teacher's Weight} = \text{New Average} + N \times (\text{Increase in Average})$$
    $$\text{Teacher's Weight} = 35.4 + 24 \times 0.4$$

4.  **Solve:**
    $$\text{Teacher's Weight} = 35.4 + 9.6$$
    $$\text{Teacher's Weight} = 45 \text{ kg}$$

### Final Answer
The weight of the teacher is **45 kg**.

---

## Example 3 — Weighted Average of Combined Sections

### Problem Statement
The average marks of Section A containing 35 students is 60, and Section B containing 45 students is 80. Find the combined average marks of all the students.

### Step-by-Step Solution

1.  **Define the Variables:**
    *   Group 1 ($n_1$) = 35, Average ($A_1$) = 60.
    *   Group 2 ($n_2$) = 45, Average ($A_2$) = 80.

2.  **Apply the Weighted Average Formula:**
    $$A_{\text{weighted}} = \frac{n_1 A_1 + n_2 A_2}{n_1 + n_2}$$

3.  **Simplify Group Counts (Ratios):**
    *   Instead of multiplying by 35 and 45, simplify their ratio:
        $$\text{Ratio } n_1 : n_2 = 35 : 45 = 7 : 9$$
    *   Use $n_1 = 7$ and $n_2 = 9$ to simplify the math:
        $$A_{\text{weighted}} = \frac{7 \times 60 + 9 \times 80}{7 + 9}$$

4.  **Perform the Calculation:**
    $$A_{\text{weighted}} = \frac{420 + 720}{16}$$
    $$A_{\text{weighted}} = \frac{1140}{16} = 71.25$$

### Final Answer
The combined average marks of all students is **71.25**.

---

## Example 4 — Excluded Elements and Average Age

### Problem Statement
The average age of 19 members of a club is 25 years. If one member leaves, the average age decreases by 1 year. Find the age of the member who left.

### Step-by-Step Solution

1.  **Define the Variables:**
    *   Initial count ($N$) = 19.
    *   Initial average = 25 years.
    *   New count = 18.
    *   Decrease in average = 1 year.

2.  **Apply the Exclusion Deviation Shortcut:**
    $$\text{Excluded Value} = \text{Old Average} + (N - 1) \times (\text{Decrease in Average})$$

3.  **Calculate:**
    $$\text{Age of Excluded Member} = 25 + 18 \times 1$$
    $$\text{Age of Excluded Member} = 25 + 18 = 43 \text{ years}$$

### Final Answer
The age of the member who left is **43 years**.

---

## Example 5 — Averages of Consecutive Numbers

### Problem Statement
The average of 7 consecutive numbers is 20. Find the largest of these numbers.

### Step-by-Step Solution

1.  **Understand the Consecutive Average Rule:**
    *   For a consecutive series (difference = 1), the average is the exact middle term.
    *   Since there are 7 terms, the middle term is the 4th term.

2.  **Locate the Terms:**
    *   $$\text{4th Term} = \text{Average} = 20$$
    *   Since the numbers are consecutive:
        *   3rd Term = 19
        *   2nd Term = 18
        *   1st Term = 17
        *   5th Term = 21
        *   6th Term = 22
        *   7th Term (Largest) = 23

3.  **Alternative Verification (Algebraic):**
    Let the numbers be $x, x+1, x+2, x+3, x+4, x+5, x+6$.
    $$\text{Average} = \frac{7x + 21}{7} = x + 3 = 20 \implies x = 17$$
    Largest number = $x + 6 = 17 + 6 = 23$.

### Final Answer
The largest of these consecutive numbers is **23**.

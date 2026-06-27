# Top 50 Reasoning Patterns and Logic Puzzles

## Coding Key Patterns
### Position of Letters (A-Z)
To solve these quickly, memorize the alphabetical positions using the **EJOTY** keyword:
*   **E** = $5$
*   **J** = $10$
*   **O** = $15$
*   **T** = $20$
*   **Y** = $25$

To find the position of other letters, relate them to EJOTY. E.g., to find $G$: $E$ is 5, so $F$ is 6, and $G$ is 7.

### Opposite Letters (Pairs)
Opposite letters are pairs that are equidistant from both ends of the alphabet (e.g., $A$ and $Z$, $B$ and $Y$).
*   **Rule:** The sum of the alphabetical positions of any letter and its opposite letter is always **$27$**.
    *   *Example:* Opposite of $G$ (position 7) is the letter at position $27 - 7 = 20$, which is $T$.

## Blood Key Patterns
### Standard Mappings
*   **Father's side relations:** Paternal relations.
*   **Mother's side relations:** Maternal relations.
*   **Siblings:** Brothers and sisters.
*   **Spouse:** Husband or wife.
*   **Siblings-in-law:**
    *   *Brother-in-law:* Husband's/Wife's brother, or sister's husband.
    *   *Sister-in-law:* Husband's/Wife's sister, or brother's wife.
*   **Niece and Nephew:**
    *   *Nephew:* Brother's or sister's son.
    *   *Niece:* Brother's or sister's daughter.
*   **Cousin:** Child of one's uncle or aunt. (Note: "Cousin brother" or "Cousin sister" are grammatically incorrect and should be treated simply as "Cousin").

---

### A. Pointing / Statement-Based Relations
In these problems, a person points to someone and describes their relationship using a chain of connections.
*   **Rule:** Solve these backwards starting from "my" or "mine".
*   *Example:* Pointing to a photograph, Amit said, "She is the only daughter of my grandfather's only son." How is the woman related to Amit?
    1.  Start with "my grandfather's only son" -> Amit's father (assuming Amit is speaking paternal side).
    2.  Now substitute: "She is the only daughter of [Amit's father]" -> Amit's sister.
    3.  Therefore, the woman is Amit's sister.

## Direction Key Patterns
### Cardinal vs. Intercardinal Directions
There are four intermediate directions located exactly midway ($45^\circ$) between the cardinal directions:
1.  **North-East (NE):** Between North and East.
2.  **North-West (NW):** Between North and West.
3.  **South-East (SE):** Between South and East.
4.  **South-West (SW):** Between South and West.

---

### Worked Example
A person walks $3\text{ km}$ North, turns East and walks $4\text{ km}$. How far is he from the starting point?
1.  The path forms a right-angled triangle with base $= 4\text{ km}$ and height $= 3\text{ km}$.
2.  $\text{Shortest Distance} = \sqrt{3^2 + 4^2} = \sqrt{9 + 16} = \sqrt{25} = 5\text{ km}$.
3.  The direction relative to the start point is North-East.

## Seating Key Patterns
### Single Row
*   **Facing North:** Left of a person is towards the left of the page. Right is towards the right of the page.
    $$\text{[Left]} \leftarrow A - B - C - D - E \rightarrow \text{[Right]}$$
*   **Facing South:** Left of a person is towards the right of the page. Right is towards the left of the page.
    $$\text{[Right]} \leftarrow A - B - C - D - E \rightarrow \text{[Left]}$$

### Double Row (Facing Each Other)
Often involves two rows where people in Row 1 face South and people in Row 2 face North.
*   *TCS Trick:* If $X$ is opposite $Y$ and $X$ is facing North, then $Y$ is facing South. Pay close attention to who is to the "immediate left" of whom, as the left of a South-facing person is opposite to the left of a North-facing person.

---

## Syllogism Key Patterns
### Basic vs. Possible Diagrams
*   **Basic Diagram:** The simplest representation that satisfies the statements without assuming any extra intersections.
*   **Possible Diagrams:** Other valid diagrams that satisfy the statements (e.g., if "Some A are B", it is *possible* that "All A are B").
*   **Rule of Truth:**
    *   A **definite conclusion** is TRUE only if it is true in **all** possible Venn diagrams. If it fails in even one diagram, it is FALSE.
    *   A **possibility conclusion** (e.g., "Some A being B is a possibility") is TRUE if it is true in at least **one** possible Venn diagram.

---

### Conditions for "Either-Or"
All three conditions must be satisfied:
1.  Both conclusions must be **individually false/undetermined** (they cannot be definitely true).
2.  The subject and predicate of both conclusions must be the **same**.
3.  They must form a **complementary pair**:
    *   *Pair 1:* **Some** and **No** (e.g., "Some A are B" and "No A are B").
    *   *Pair 2:* **All** and **Some Not** (e.g., "All A are B" and "Some A are not B").
    *   *Note:* "All" and "No" is NOT a complementary pair.

## Puzzle Key Patterns
### Floor Template
Create a vertical table to represent the building. Always sketch multiple case columns next to it to handle possibilities:

| Floor | Case 1 (Person) | Case 2 (Person) |
| :---: | :---: | :---: |
| 8 | | |
| 7 | | |
| 6 | | |
| 5 | | |
| 4 | | |
| 3 | | |
| 2 | | |
| 1 | | |

### Core Clues & Solving Tricks
*   **Odd/Even Floor:** "A lives on an even-numbered floor" -> Place A in possibilities on floors 2, 4, 6, or 8.
*   **Gap Clues:** "There are three floors between A and B."
    *   If A is on floor 8, B must be on floor $8 - 3 - 1 = 4$.
*   **Above/Below:** "A lives immediately above B" means A and B are adjacent ($A = B + 1$). "A lives above B" means A is on any floor higher than B, not necessarily adjacent.

---

## Series Key Patterns
### Common Number Series Patterns
1.  **Arithmetic Series (Difference-based):** The difference between consecutive terms is constant or forms a sequence.
    *   *Double Difference:* If the first difference is not constant, find the difference of the differences.
2.  **Geometric Series (Ratio-based):** Consecutive terms are multiplied or divided by a constant ratio.
    *   *Clue:* Numbers increase or decrease extremely rapidly.
3.  **Power Series (Squares/Cubes):** Terms are close to squares ($n^2$) or cubes ($n^3$) of consecutive numbers, often with a constant added or subtracted ($n^2 \pm k$, $n^3 \pm n$).
4.  **Prime Number Series:** Terms are consecutive prime numbers (e.g., $2, 3, 5, 7, 11, 13 \dots$).
5.  **Mixed Operations:** Combining multiplication/division with addition/subtraction.
    *   *Patterns:* $x_n = x_{n-1} \times k + c$ or $x_n = x_{n-1} \times n + n$.

### Pattern-Spotting Tricks
*   **Check differences first:** If the series increases slowly, the pattern is almost always addition/subtraction. Calculate differences between terms immediately.
*   **Check ratios if growth is steep:** If the numbers escalate quickly (e.g., $3, 12, 60, 360 \dots$), think multiplication.
*   **Alternate Series:** If a series goes up and down (e.g., $10, 5, 12, 7, 14 \dots$), it is likely two interleaved series. Split them: $(10, 12, 14 \dots)$ and $(5, 7 \dots)$.

---

## Clock Key Patterns
### Angle Between Hands
To find the angle $\theta$ between the hour hand and the minute hand at a given time $H:M$ (where $H$ is the hour value and $M$ is the minute value):

$$\theta = \left| 30H - \frac{11}{2}M \right|$$

*   *Note:* If the calculated angle is greater than $180^\circ$, find the reflex angle by subtracting it from $360^\circ$.
*   *Example:* What is the angle between the hands at 3:40?
    $$\theta = \left| 30(3) - \frac{11}{2}(40) \right| = | 90 - 220 | = | -130 | = 130^\circ$$

### Hand Speeds
*   **Minute Hand:** Moves $360^\circ$ in 60 minutes $\rightarrow 6^\circ/\text{minute}$.
*   **Hour Hand:** Moves $360^\circ$ in 12 hours ($720$ minutes) $\rightarrow 0.5^\circ/\text{minute}$.
*   **Relative Speed:** The minute hand gains $6^\circ - 0.5^\circ = 5.5^\circ$ (or $\frac{11}{2}^\circ$) per minute over the hour hand.


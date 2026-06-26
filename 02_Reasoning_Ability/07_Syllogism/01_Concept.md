# Concept Guide: Syllogism

This guide provides the foundational logic, ASCII Venn diagrams, memory tables, solved questions, and common exam traps for Syllogism in the TCS NQT exam.

---

## 🖼️ 1. ASCII Venn Diagram Representations

Use these standard templates to represent the four fundamental relationships:

### A. All A are B
```
+-----------------------------------+
| B                                 |
|      +---------------------+      |
|      | A                   |      |
|      | (All A is inside B) |      |
|      +---------------------+      |
+-----------------------------------+
```

### B. No A is B
```
+-------------------+       +-------------------+
| A                 |       | B                 |
| (Disjoint from B) |       | (Disjoint from A) |
+-------------------+       +-------------------+
          X <------(No Link)-------> X
```

### C. Some A are B
```
+-------------------+-------------------+
| A                 | B                 |
|             +-----+-----+             |
|             |  Overlap  |             |
|             |   (xxx)   |             |
|             +-----+-----+             |
+-------------------+-------------------+
```

### D. Some A are not B
```
+-------------------+-------------------+
| A                 | B                 |
|  +-------------+  |                   |
|  | Isolated (y)|  |                   |
|  +-------------+  |                   |
+-------------------+-------------------+
(Region 'y' is guaranteed to be outside B)
```

---

## 📊 2. The "ONLY 4 Standard Conclusions" Memory Table

| Premise Type | Premise Statement | Valid Direct Conclusions | Invalid Reverse Traps |
| :--- | :--- | :--- | :--- |
| **All A are B** | Universal Affirmative | - Some A are B<br>- Some B are A | - All B are A *(Invalid)*<br>- No A is B *(Invalid)* |
| **No A is B** | Universal Negative | - No B is A<br>- Some A are not B<br>- Some B are not A | - Some A are B *(Invalid)*<br>- Some B are A *(Invalid)* |
| **Some A are B** | Particular Affirmative | - Some B are A | - All A are B *(Invalid)*<br>- Some A are not B *(Invalid)* |
| **Some A are not B** | Particular Negative | - None (No reverse is possible) | - Some B are not A *(Invalid)*<br>- No A is B *(Invalid)* |

---

## 🛠️ 3. Step-by-Step Method: Draw $\rightarrow$ Check $\rightarrow$ Eliminate

*   **Step 1: Draw the Minimal Venn Diagram.** Draw the circles representing the premises with the *minimum possible overlap* to satisfy the statements.
*   **Step 2: Check Direct Conclusions.** Evaluate the conclusions against the minimal diagram. If a conclusion fails in the minimal diagram, it is **invalid** (except in possibility cases).
*   **Step 3: Test Alternative Diagrams (Eliminate).** For possibility or doubtful conclusions, draw alternative diagrams that still satisfy the premises. If a definite conclusion fails in *any* valid diagram, **eliminate it**.

---

## ✏️ 4. Solved TCS NQT Syllogism Questions

### Question 1: Universal Affirmative & Negative
*   **Premises:**
    1. All Pens are Books.
    2. No Book is a Ruler.
*   **Conclusions:**
    I. No Pen is a Ruler.
    II. Some Books are Pens.
*   **Venn Diagram:**
```
+-------------------------------+
| Books                         |
|   +-----------------------+   |       +-------------------+
|   | Pens                  |   |       | Rulers            |
|   +-----------------------+   |       +-------------------+
+-------------------------------+                 |
                |_____________________(No Link)___|
```
*   **Solution:**
    *   Since all Pens are inside Books, and no Book can touch Rulers, no Pen can ever touch Rulers. Conclusion I is **valid**.
    *   Since Pens is inside Books, the overlapping part of Books and Pens is non-empty. Conclusion II is **valid**.
*   **Answer:** Both Conclusions I and II follow.

---

### Question 2: Particular & Universal Mixed
*   **Premises:**
    1. Some Apples are Bananas.
    2. All Bananas are Cherries.
*   **Conclusions:**
    I. Some Apples are Cherries.
    II. No Cherry is an Apple.
*   **Venn Diagram:**
```
            +-----------------------------------+
            | Cherries                          |
+-----------+-------+                           |
| Apples    | (xxx) | Bananas                   |
|           +-------+                           |
+-----------+-------+---------------------------+
```
*   **Solution:**
    *   Apples overlap with Bananas. Since all Bananas are inside Cherries, the overlap region (xxx) must also be inside Cherries. Thus, some Apples are Cherries. Conclusion I is **valid**.
    *   Since they overlap, Conclusion II (No Cherry is an Apple) is **invalid**.
*   **Answer:** Only Conclusion I follows.

---

### Question 3: "Only a Few" Pattern (TCS Special)
*   **Premises:**
    1. Only a few Cats are Dogs. (Means: Some Cats are Dogs AND Some Cats are NOT Dogs).
    2. All Dogs are Birds.
*   **Conclusions:**
    I. All Cats can never be Dogs.
    II. Some Birds are Cats.
*   **Venn Diagram:**
```
                  +-------------------------------------+
                  | Birds                               |
+-----------------+-------+                             |
| Cats            | (xxx) | Dogs                        |
|  +-----------+  +-------+                             |
|  |  Not Dog  |  |                                     |
|  +-----------+  +-------+-----------------------------+
+-----------------+
```
*   **Solution:**
    *   "Only a few Cats are Dogs" implies that a part of Cats must always remain outside Dogs. Thus, all Cats can never be Dogs. Conclusion I is **valid**.
    *   Since Dogs are inside Birds, and Cats overlap with Dogs (xxx), Cats must also overlap with Birds. Conclusion II is **valid**.
*   **Answer:** Both Conclusions I and II follow.

---

### Question 4: Either-Or Case
*   **Premises:**
    1. Some Pins are Clips.
    2. Some Clips are Hooks.
*   **Conclusions:**
    I. Some Pins are Hooks.
    II. No Pin is a Hook.
*   **Venn Diagram (Minimal):**
```
+-------------+     +-------------+     +-------------+
| Pins        |     | Clips       |     | Hooks       |
|             |     |             |     |             |
+-------------+     +-------------+     +-------------+
       |____(Overlap)____|     |____(Overlap)____|
```
*   **Solution:**
    *   In the minimal diagram, Pins and Hooks do not overlap. So, Conclusion I is false, and II is true.
    *   In an alternative diagram where we merge Pins and Hooks, Conclusion I becomes true, and II becomes false.
    *   Since both cannot be false together, and they form a complementary pair (Some + No with same subject/predicate), it is an "Either-Or" case.
*   **Answer:** Either Conclusion I or II follows.

---

### Question 5: Negative Conclusion with Possibility
*   **Premises:**
    1. All Windows are Doors.
    2. Some Doors are Walls.
*   **Conclusions:**
    I. Some Windows are Walls is a possibility.
    II. No Wall is a Window.
*   **Venn Diagram (Possibility Variant):**
```
+-------------------------------------------------------+
| Doors                                                 |
|   +-------------------+       +-------------------+   |
|   | Windows           |       | Walls             |   |
|   |                   |       |                   |   |
|   +-------------------+       +-------------------+   |
|             |                       |                 |
|             +------(Can Overlap)----+                 |
+-------------------------------------------------------+
```
*   **Solution:**
    *   Since there is no negative constraint prohibiting Windows and Walls from touching, we can draw a valid Venn diagram where they overlap. Conclusion I is **valid**.
    *   Since it is possible for them to overlap, the definite statement "No Wall is a Window" is **invalid**.
*   **Answer:** Only Conclusion I follows.

---

## 🚨 5. The "Some" vs. "All" Trap

> [!WARNING]
> **The Existence Trap:**
> In classical syllogism logic, if **"All A are B"** is true, the conclusion **"Some A are B"** is **ALWAYS VALID**. 
> Do not make the mistake of thinking "Some" means "some but not all". In logic, "Some" is defined as *"at least one"*. If all elements in a set possess a property, any sub-selection of those elements is guaranteed to possess it as well.

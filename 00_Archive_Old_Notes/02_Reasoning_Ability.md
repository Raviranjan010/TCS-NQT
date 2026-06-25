# TCS NQT 2026 — Reasoning Ability
### Complete Preparation Guide · Exam: June 28, 2026

> **Section Stats:** 20 Questions · 25 Minutes · ~75 sec/question · No Negative Marking
> 
> **FIB Strategy:** Type exactly as requested. Check case-sensitivity.

---

## 🗺️ Seating Arrangement Solving Flowchart

```
                 Start Seating Arrangement Clues
                                |
             Identify the FIRST Definite Clue (e.g., "A sits opposite B")
                                |
             Place them on your draft circle/line
                                |
             Find next clue linking to already placed people
                                |
             Fill remaining positions using relative clues
```

---

# BLOCK A — Series & Patterns

---

## 1. Number Series ⭐⭐

### What is this?
Finding the mathematical logic in a sequence of numbers.

### Why does TCS ask this?
Tests pattern recognition speed and handling of algebraic changes (squares/cubes).

### Key Mappings & Shortcuts

* **Trick 1: Difference Table**
  * Draw differences ($D_1 \to D_2$) immediately. A constant second difference indicates a quadratic series.
  * *Worked Example*: Find next term in: 2, 9, 28, 65, ?
    * *Solution*: The series is $n^3 + 1$. Next is $5^3 + 1 = 126$.
  * *Shortcut Demo*: Differences: $7, 19, 37$. Second differences: $12, 18 \implies$ next is $24$. Next term $= 65 + 37 + 24 = 126$.

---

### PYQ-Style Questions

**Q1.** Find the missing term: **2, 9, 28, 65, 126, ?**
* **Pattern ID**: Series-CubeOffset-01
* **Approach**: Identify if terms are close to perfect squares or cubes.
* **Solution**: 
  * $1^3 + 1 = 2$
  * $2^3 + 1 = 9$
  * $3^3 + 1 = 28$
  * $4^3 + 1 = 65$
  * $5^3 + 1 = 126$
  * Next term $= 6^3 + 1 = 217$.
* **Shortcut**: $n^3 + 1$ matches the growth rate. $6^3 = 216 \implies 216 + 1 = 217$.
* **Variation & Trap**: Assuming it is a simple arithmetic series and trying to find a linear difference pattern.

---

## 2. Alphabet Series ⭐⭐

### What is this?
Sequences of characters shifting by positional offsets.

### Shortcuts & EJOTY Mnemonic

* **EJOTY Table**:
  $$\text{E} = 5, \quad \text{J} = 10, \quad \text{O} = 15, \quad \text{T} = 20, \quad \text{Y} = 25$$
  * *Worked Example*: Find position of S.
    * *Solution*: S is right before T(20). So position $= 19$.
  * *Shortcut Demo*: To find the opposite of G(7): Opposite position $= 27 - 7 = 20 \implies$ T.

---

### PYQ-Style Questions

**Q1.** Find the next term: **A, C, F, J, O, ?**
* **Pattern ID**: Alpha-Increment-01
* **Approach**: Convert letters to numbers: $1, 3, 6, 10, 15$.
* **Solution**: 
  * Differences are $+2, +3, +4, +5$.
  * Next difference $= +6 \implies 15 + 6 = 21$.
  * Pos 21 $= $ **U**.
* **Shortcut**: Note spacing directly: A (+1 letter skipped) C (+2 letters skipped) F. Next skips 5 letters after O $\implies$ U.
* **Variation & Trap**: Wrapping errors around Z.

---

# BLOCK B — Logical Deduction

---

## 3. Syllogisms ⭐⭐

### What is this?
Deducing valid conclusions from set statements.

### Venn Representation Rules
* **All A are B**: `[ A ]` is inside `[ B ]`.
* **Some A are B**: `[ A ]` overlaps with `[ B ]`.
* **No A is B**: `[ A ]` and `[ B ]` are completely separate.

---

### PYQ-Style Questions

**Q1.** **Statements**: All cats are dogs. All dogs are birds.  
**Conclusions**: I. All cats are birds. II. Some birds are cats.
* **Pattern ID**: Syll-All-01
* **Approach**: Draw concentric Venn circles. Cats inside Dogs, Dogs inside Birds.
* **Solution**: 
  * Since Cats are completely inside Birds, Conclusion I holds.
  * The Birds circle overlaps with Cats, so Conclusion II holds.
  * **Both I and II follow**.
* **Shortcut**: If statements are "All X are Y" and "All Y are Z", then "All X are Z" and "Some Z are X" are always valid.
* **Variation & Trap**: Assuming "Some birds are not cats" is definitely true. In the maximum overlap case, all birds could be cats.

---

# BLOCK C — Analytical

---

## 4. Clocks & Calendars ⭐⭐

### Key Formulas & Derivations

* **Formula: Angle between hands**
  $$\text{Angle} = \left|30H - \frac{11}{2}M\right|^\circ$$
  * *Derivation*: Hour hand moves at $30^\circ$/hour $+ 0.5^\circ$/minute. Minute hand moves at $6^\circ$/minute. Difference $= |(30H + 0.5M) - 6M| = |30H - 5.5M|^\circ$.
  * *Worked Example*: Angle at 8:20?
    * *Solution*: $|30(8) - 5.5(20)| = |240 - 110| = 130^\circ$.
  * *Shortcut Demo*: At 8:20, hour hand is at 8 (which is $240^\circ$), minute hand is at 4 ($120^\circ$). Adjusted hour hand movement $= 20 \times 0.5 = 10^\circ$. Angle $= 240 + 10 - 120 = 130^\circ$.

---

### Guided Practice Questions

**Q1.** What is the angle between clock hands at 4:10?
* **Hint**: Apply $|30H - 5.5M|^\circ$.
* **Solution**: 
  $$\text{Angle} = |30(4) - 5.5(10)| = |120 - 55| = 65^\circ$$

**Q2.** If today is Friday, what day will it be after 50 days?
* **Hint**: Find odd days using modulo 7.
* **Solution**: 
  $$50 \pmod 7 = 1 \text{ odd day} \implies \text{Friday} + 1 = \text{Saturday}$$

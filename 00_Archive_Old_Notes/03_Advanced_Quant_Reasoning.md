# TCS NQT 2026 — Advanced Quant & Reasoning
### Complete Preparation Guide · Exam: June 28, 2026

> **Section Stats:** 14 Questions · 25 Minutes · ~107 sec/question · No Negative Marking
> 
> **FIB Strategy:** Type exact values only. No `%` or `₹` or symbols.

---

## 🗺️ Cryptarithmetic Solving Flowchart

```
                 Start Cryptarithmetic Puzzle
                              |
             Identify Carry-Overs (usually C = 1 in A + B = CD)
                              |
             Analyze Units Column for repeating digits
                              |
             Set bounds based on maximum/minimum possible sums
                              |
             Solve for digits step-by-step (0 to 9)
```

---

# BLOCK A — Advanced Quantitative

---

## 1. Mixtures & Dilutions ⭐⭐⭐

### What is this?
Finding the concentration of liquid solutions after mixing or repeatedly replacing fractions with another liquid.

### Why does TCS ask this?
Tests compound fractional changes and multi-container scaling.

### Key Formulas & Derivations

* **Formula: Successive Dilution**
  $$\text{Final Volume} = \text{Initial Volume} \times \left(1 - \frac{y}{x}\right)^n$$
  * *Derivation*: Each dilution cycle replaces $y$ litres out of a total capacity $x$, leaving a fraction of $\left(1 - \frac{y}{x}\right)$ of the original liquid. After $n$ independent cycles, the remaining fraction of original liquid is $\left(1 - \frac{y}{x}\right)^n$. Multiplying by initial volume gives the final volume.
  * *Worked Example*: A container has 80L of milk. 8L is replaced by water. The process is repeated twice more. Find final milk.
    * *Solution*: $x = 80, y = 8, n = 3$. Final Milk $= 80 \times \left(1 - \frac{8}{80}\right)^3 = 80 \times 0.9^3 = 58.32\text{L}$.
  * *Shortcut Demo*: Fraction remaining after 1 cycle $= 0.9$. For 3 cycles, multiplier $= 0.9^3 = 0.729$. Final $= 80 \times 0.729 = 58.32\text{L}$.

---

### PYQ-Style Questions

**Q1.** In what ratio should two mixtures of milk and water with ratios $5:2$ and $7:6$ be mixed to get a final ratio of $8:5$?
* **Pattern ID**: Mix-Ratio-01
* **Approach**: Calculate the milk fraction in both mixtures and the final mixture. Apply the alligation cross.
* **Solution**: 
  * Milk in $M_1 = 5/7$, Milk in $M_2 = 7/13$, Milk in Mean $= 8/13$.
  * Diagonals: $\left|\frac{8}{13} - \frac{7}{13}\right| = \frac{1}{13}$ and $\left|\frac{5}{7} - \frac{8}{13}\right| = \frac{9}{91}$.
  * Ratio $= \frac{1}{13} : \frac{9}{91} = 7:9$.
* **Shortcut**: Alligation cross method saves calculating total volumes.
* **Variation & Trap**: Mixing milk fractions directly without converting to equivalent fractional parts of the same base.

---

## 2. Advanced AP/GP ⭐⭐⭐

### What is this?
Sequences with a common difference (AP) or common ratio (GP).

### Key Formulas & Derivations

* **Formula: Sum of Arithmetic Progression (AP)**
  $$S_n = \frac{n}{2} [2a + (n-1)d]$$
  * *Derivation*: Write $S_n = a + (a+d) + \dots + [a+(n-1)d]$. Write it in reverse: $S_n = [a+(n-1)d] + [a+(n-2)d] + \dots + a$. Adding both equations: $2 S_n = n [2a + (n-1)d] \implies S_n = \frac{n}{2}[2a + (n-1)d]$.
  * *Worked Example*: Find sum of first 10 terms of series: 2, 5, 8...
    * *Solution*: $a=2, d=3, n=10$. $S_{10} = 5 \times [4 + 9 \times 3] = 5 \times 31 = 155$.
  * *Shortcut Demo*: Sum $= n \times \text{Average of first and last terms} = 10 \times \frac{2 + 29}{2} = 155$.

---

### PYQ-Style Questions

**Q1.** Find the sum of all 3-digit numbers divisible by 7.
* **Pattern ID**: AP-Divisible-01
* **Approach**: Identify first term $a = 105$, last term $l = 994$, common difference $d = 7$. Find $n$ then calculate sum.
* **Solution**: 
  * $994 = 105 + (n-1)7 \implies 889 = 7(n-1) \implies n-1 = 127 \implies n = 128$.
  * Sum $= \frac{128}{2} [105 + 994] = 64 \times 1099 = 70,336$.
* **Shortcut**: Sum $= 64 \times 1099 = 70,336$.
* **Variation & Trap**: Incorrectly finding the first or last term (e.g. using $100$ or $999$).

---

# BLOCK B — Advanced Reasoning

---

## 3. Cryptarithmetic ⭐⭐⭐

### Rules & Solving Strategy
* **Distinct Digits**: Each letter represents a unique digit (0-9).
* **No Leading Zero**: The leftmost letter of a word cannot be 0.
* **Carry-Over limits**: In addition of two numbers, the maximum carry-over to the next column is always 1.

---

### PYQ-Style Questions

**Q1.** Solve: **SEND + MORE = MONEY**. Find the digit value of **M**.
* **Pattern ID**: Crypt-Standard-01
* **Approach**: Use addition carry-over constraints. Since we add two 4-digit numbers to get a 5-digit number, the carry-over $M$ must be 1.
* **Solution**: 
  * $M = 1$.
  * In the thousands column, $S + M + \text{carry} = O + 10M \implies S + 1 + \text{carry} = O + 10 \implies S + \text{carry} = O + 9$.
  * Since $S$ is a single digit, $S = 8$ or $9$.
  * By analyzing further columns, we find $S = 9, E = 5, N = 6, D = 7, M = 1, O = 0, R = 8, Y = 2$.
  * **M = 1**.
* **Shortcut**: Always assign 1 to the leftmost digit of the sum in addition of equal-length numbers.
* **Variation & Trap**: Assigning same digit to different letters.

---

## 4. Guided Practice Questions

**Q1.** Find the number of trailing zeros in $50!$.
* **Hint**: Count powers of 5: $\lfloor 50/5 \rfloor + \lfloor 50/25 \rfloor$.
* **Solution**: 
  $$\text{Zeros} = 10 + 2 = 12$$

**Q2.** Find the remainder when $3^{200}$ is divided by 11.
* **Hint**: Use Fermat's Little Theorem: $3^{10} \equiv 1 \pmod{11}$.
* **Solution**: 
  $$200 \text{ is a multiple of } 10 \implies 3^{200} \equiv (3^{10})^{20} \equiv 1^{20} \equiv 1 \pmod{11}$$

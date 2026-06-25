# TCS NQT 2026 — Advanced Quant & Reasoning
**Prep Focus: Advanced Section (14 Questions, 25 Minutes)**

The Advanced section contains higher-difficulty questions in mathematics and logical reasoning. This guide focuses on advanced topics like functions, coordinate geometry, and **Cryptarithmetic** (a signature TCS NQT topic).

---

## 🔐 Cryptarithmetic Masterclass

Cryptarithmetic puzzles are mathematical games where digits are replaced by letters. You must find the digit corresponding to each letter.

### 🔑 Core Rules of Cryptarithmetic
1. **Single Digit Mapping**: Each letter represents a unique digit from $0$ to $9$. Two different letters cannot represent the same digit.
2. **First Digit Rule**: The leading letter of a word (e.g., $S$ in $SEND$) cannot be $0$.
3. **Carry-over Rules**:
   * When adding two $n$-digit numbers, the carry-over to the $(n+1)$-th digit can only be **$1$**.
   * *Example*: $SEND + MORE = MONEY$. Here, $M$ (the carry-over) **must be 1**.
   * When adding three $n$-digit numbers, the maximum carry-over is **$2$**.

### ⚡ Steps to Solve Cryptarithmetic Puzzles
1. Identify the carry-over letters (they are usually 1).
2. Look at columns containing the same letters.
3. Solve from the left-most column (highest place value) towards the right.
4. Keep track of even/odd constraints (e.g., if $A + A = B$, then $B$ must be even unless there's a carry-over, in which case $B = 2A + 1 \implies$ odd).

---

## 📐 Advanced Math Formulas

### 1. Progressions (AP, GP, HP)
* **Arithmetic Progression (AP)**:
  * $n$-th term: $T_n = a + (n-1)d$
  * Sum of $n$ terms: $S_n = \frac{n}{2}[2a + (n-1)d]$
* **Geometric Progression (GP)**:
  * $n$-th term: $T_n = a \cdot r^{n-1}$
  * Sum of $n$ terms ($r < 1$): $S_n = \frac{a(1 - r^n)}{1 - r}$
  * Sum of infinite GP ($|r| < 1$): $S_\infty = \frac{a}{1 - r}$
* **Harmonic Progression (HP)**: Reciprocals of terms form an AP.
* **Relations**: $AM \ge GM \ge HM$, where $GM^2 = AM \times HM$ (for positive numbers).

### 2. Quadratic Equations
* Standard form: $ax^2 + bx + c = 0$
* Roots: $\alpha, \beta = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$
* Sum of roots: $\alpha + \beta = -\frac{b}{a}$
* Product of roots: $\alpha\beta = \frac{c}{a}$

### 3. Logarithms
* $\log_b(xy) = \log_b(x) + \log_b(y)$
* $\log_b(x/y) = \log_b(x) - \log_b(y)$
* $\log_b(x^k) = k \cdot \log_b(x)$
* Base change formula: $\log_b(a) = \frac{\log_c(a)}{\log_c(b)}$

---

## 📘 Advanced Solved PYQs

### 1. Cryptarithmetic
> [!TIP]
> **TCS NQT PYQ 1**: Find the value of $Y$ in the following addition cryptarithm:
> ```
>   S E N D
> + M O R E
> ---------
> M O N E Y
> ```
>
> **Solution**:
> 1. Since $M$ is the carry-over from the addition of two 4-digit numbers, **$M = 1$**.
> 2. Replace $M$ with 1:
>    ```
>      S E N D
>    + 1 O R E
>    ---------
>    1 O N E Y
>    ```
> 3. Look at the thousands column: $S + 1 (+ \text{ possible carry-over } c_3) = 10 + O$.
>    * Since $M=1$, $O$ can only be $0$ or $1$. But $M=1$, so **$O = 0$** (because digits must be unique).
>    * Substituting $O = 0$, we get $S + 1 + c_3 = 10 \implies S + c_3 = 9$.
> 4. Look at the hundreds column: $E + 0 (+ c_2) = N$ (with carry-over $c_3$ to thousands column).
>    * Since $E \ne N$, there must be a carry-over $c_2 = 1$, and $c_3 = 0$ (so $S = 9$).
>    * Thus, $E + 1 = N$.
> 5. Look at the tens column: $N + R (+ c_1) = 10 + E$ (since there is a carry-over $c_2 = 1$).
>    * Substitute $N = E + 1$: $(E + 1) + R + c_1 = 10 + E \implies R + 1 + c_1 = 10 \implies R + c_1 = 9$.
>    * Since $S = 9$ and digits are unique, $R$ cannot be 9. Hence, $c_1$ must be 1, making **$R = 8$**.
> 6. Look at the units column: $D + E = 10 + Y$ (since $c_1 = 1$).
>    * The remaining available digits from $\{2, 3, 4, 5, 6, 7\}$ must be assigned to $D, E, Y, N$.
>    * We have $E + 1 = N$. Let's try $E = 5 \implies N = 6$.
>    * Then $D + 5 = 10 + Y \implies D - Y = 5$.
>    * Using remaining digits $\{2, 3, 4, 7\}$, we see $7 - 2 = 5$. So $D = 7$ and $Y = 2$.
>    * This leaves $E=5, N=6, D=7, Y=2, S=9, M=1, O=0, R=8$. All unique!
>  * **Answer**: `2`

---

### 2. Logarithms
> [!TIP]
> **TCS NQT PYQ 2**: Solve for $x$: $\log_2(x) + \log_4(x) + \log_{16}(x) = 7/2$.
> * **Solution**:
>   * Use base change to change all bases to 2.
>   * $\log_4(x) = \frac{\log_2(x)}{\log_2(4)} = \frac{\log_2(x)}{2}$
>   * $\log_{16}(x) = \frac{\log_2(x)}{\log_2(16)} = \frac{\log_2(x)}{4}$
>   * Substitute back: $\log_2(x) + \frac{\log_2(x)}{2} + \frac{\log_2(x)}{4} = 7/2$
>   * $\log_2(x) [ 1 + 1/2 + 1/4 ] = 7/2$
>   * $\log_2(x) [ 7/4 ] = 7/2$
>   * $\log_2(x) = \frac{7}{2} \times \frac{4}{7} = 2$
>   * $x = 2^2 = 4$.
>   * **Answer**: `4`

---

### 3. Quadratic Equations & Roots
> [!TIP]
> **TCS NQT PYQ 3**: If the roots of the equation $x^2 - px + q = 0$ differ by 1, then which of the following is true?
> * **Solution**:
>   * Let the roots be $\alpha$ and $\beta$.
>   * Given $|\alpha - \beta| = 1$.
>   * We know $(\alpha - \beta)^2 = (\alpha + \beta)^2 - 4\alpha\beta$.
>   * Sum of roots $\alpha + \beta = p$.
>   * Product of roots $\alpha\beta = q$.
>   * Substitute: $1^2 = p^2 - 4q \implies p^2 - 4q = 1$.
>   * **Answer**: `p^2 - 4q = 1`

---

### 4. Progressions
> [!TIP]
> **TCS NQT PYQ 4**: Find the sum of the infinite series $1 + \frac{2}{3} + \frac{3}{9} + \frac{4}{27} + \dots$
> * **Solution**:
>   * This is an **Arithmetico-Geometric Progression (AGP)**.
>   * Let $S = 1 + \frac{2}{3} + \frac{3}{9} + \frac{4}{27} + \dots$
>   * Multiply both sides by the common ratio $r = 1/3$:
>     $\frac{1}{3}S = \frac{1}{3} + \frac{2}{9} + \frac{3}{27} + \dots$
>   * Subtract the second equation from the first:
>     $S - \frac{1}{3}S = 1 + (\frac{2}{3} - \frac{1}{3}) + (\frac{3}{9} - \frac{2}{9}) + (\frac{4}{27} - \frac{3}{27}) + \dots$
>     $\frac{2}{3}S = 1 + \frac{1}{3} + \frac{1}{9} + \frac{1}{27} + \dots$
>   * The RHS (excluding the first term or including it) is an infinite GP with $a = 1$ and $r = 1/3$.
>     $\text{Sum of infinite GP} = \frac{a}{1-r} = \frac{1}{1 - 1/3} = \frac{1}{2/3} = \frac{3}{2}$.
>   * Thus, $\frac{2}{3}S = \frac{3}{2} \implies S = \frac{3}{2} \times \frac{3}{2} = \frac{9}{4} = 2.25$.
>   * **Answer**: `9/4` (or `2.25`)

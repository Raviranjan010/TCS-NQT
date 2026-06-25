# TCS NQT 2026: Night-Before Checklist

Read this file the night before your exam to reinforce formulas, translation rules, and your morning routine.

---

## ⚡ One-Line Formula Reference

- **Factors Count**: $N = p^a q^b \implies \text{Factors} = (a+1)(b+1)$
- **Net Percentage**: $\text{Net} = x + y + \frac{xy}{100}$
- **Product Constancy**: Rate $+ a/b \implies$ Consumption $- \frac{a}{a+b}$
- **Profit / Loss**: $\text{Profit \%} = \frac{\text{SP}-\text{CP}}{\text{CP}} \times 100$
- **Dishonest Dealer**: $\frac{\text{SP}}{\text{CP}} = \frac{\text{True Weight}}{\text{False Weight}} \times (1 + \text{stated profit \%})$
- **Simple Interest**: $\text{SI} = \frac{P \cdot R \cdot T}{100}$
- **Compound Amount**: $\text{Amount} = P(1 + \frac{R}{100})^T$
- **2-Yr Difference**: $D_2 = P(\frac{R}{100})^2$
- **3-Yr Difference**: $D_3 = P(\frac{R}{100})^2 \cdot (3 + \frac{R}{100})$
- **Average Speed**: $\text{Avg Speed} = \frac{2 S_1 S_2}{S_1 + S_2}$
- **Relative Speed**: Same direction $= |S_1 - S_2|$, opposite $= S_1 + S_2$
- **Combined Days**: $\text{Combined Time} = \frac{A \cdot B}{A + B}$
- **Work Equivalence**: $\frac{M_1 D_1 H_1}{W_1} = \frac{M_2 D_2 H_2}{W_2}$
- **Clock Hands Angle**: $\theta = |30H - 5.5M|^\circ$
- **AP Sum**: $S_n = \frac{n}{2}[2a + (n-1)d]$
- **GP Sum**: $S_n = \frac{a(r^n - 1)}{r-1}$
- **Infinite GP**: $S_{\infty} = \frac{a}{1-r}$
- **Point-Line Distance**: $d = \frac{|Ax_0 + By_0 + C|}{\sqrt{A^2 + B^2}}$
- **Fermat's Theorem**: $a^{p-1} \equiv 1 \pmod p$
- **1D Array Address**: $\text{Address}(A[i]) = \text{Base} + i \cdot \text{sizeof(Type)}$

---

## 🚀 One-Line Shortcut Reference

- **Article CP/SP**: Profit $\% = \frac{\text{CP count} - \text{SP count}}{\text{SP count}} \times 100$
- **Faulty Weight Profit**: Gain $\% = \frac{\text{Error}}{\text{True Weight} - \text{Error}} \times 100$
- **Odd Sum**: Sum of first $N$ odd integers is $N^2$
- **Clock Hands Coincidence**: Hands overlap every $65 \frac{5}{11}$ minutes
- **Normal Year Shift**: Move forward one ordinary year shifts the weekday by $+1$
- **Leap Year Shift**: Move forward one leap year shifts the weekday by $+2$
- **Array Rotation**: Reverse all, reverse first $K$, reverse remaining $N-K$

---

## 🔍 "If You See This Phrase ➔ Do This" Table

| If the question contains this phrase... | ...Immediately perform this setup / action |
| :--- | :--- |
| "A is $25\%$ more efficient than B..." | Set efficiency ratio $A : B = 125 : 100 = 5 : 4$. |
| "find the remainder when $3^{102}$ is divided by 11..." | Use FLT: $3^{10} \equiv 1 \pmod{11}$. Reduce power: $3^{102} = (3^{10})^{10} \cdot 3^2 \equiv 9 \pmod{11}$. |
| "find the equilibrium index of the array..." | Maintain running left sum; equilibrium check: $\text{LeftSum} = \text{TotalSum} - \text{LeftSum} - A[i]$. |
| "Neither the keys nor the wallet ___ on the table..." | Apply proximity rule: singular "wallet" matches singular verb "is". |
| "how many people in the circle..." | Draw circular diagram and set up relative index offsets using $(N-1)!$. |

---

## 💀 Top 20 Traps to Avoid Tomorrow

1. **Direct successive addition**: Do not add discounts directly; use $d_1 + d_2 - \frac{d_1 d_2}{100}$.
2. **Century leap year**: Divisibility by 4 is not enough for century years; check divisibility by 400.
3. **Array index bounds**: Never write loop limits as `i <= n` in arrays; use `i < n`.
4. **Weighted averages**: Do not average average values directly without group sizes.
5. **Dishonest dealer cost base**: The cost base is the false weight used, not $1000\text{g}$.
6. **Compounding rates**: For half-yearly compounding, remember to divide the rate by 2.
7. **AP vs GP recognition**: Check if consecutive differences are constant (AP) or ratios are constant (GP).
8. **Quadratic negative roots**: Sum of roots is $-B/A$; pay attention to the negative sign.
9. **Circular permutations**: Do not use $N!$; use $(N-1)!$.
10. **Relative speed direction signs**: Subtract same-direction speeds; add opposite-direction speeds.
11. **Average speed on round-trip**: Do not use $\frac{x+y}{2}$; use $\frac{2xy}{x+y}$.
12. **Blood relations names**: Do not infer gender from name alone.
13. **Modulo intermediate overflow**: Apply `% MOD` on every intermediate multiplication step.
14. **Syllogisms partial check**: Check all combinations; do not stop at the first diagram.
15. **Clock hand angle absolute value**: Keep $|30H - 5.5M|$ absolute; negative angles don't exist.
16. **Array size decay**: Do not use `sizeof(arr)` inside helper functions.
17. **Divisibility by 11 odd/even indices**: Double-check alternating sign values.
18. **Logarithm quotient vs fraction division**: Do not mix $\log(a/b)$ with $\log a / \log b$.
19. **Euler totient coprimality**: Confirm base and modulus are coprime before using totient.
20. **FIB answer formatting**: Enter numbers only; do not add symbols, fractions, or text.

---

## 📈 Top 10 Predictions for Tomorrow's Exam

1. **Fermat's Theorem Remainder**: Large power divided by a prime.
2. **Faulty Balance Dealer**: Trade transaction involving incorrect scales.
3. **Average Journey Speed**: Segmented speeds over equal distances.
4. **Clock Hand Angle**: Finding the angle between hands at a specific time.
5. **AP/GP Series Sum**: Finding total cost or terms in a sequence.
6. **Combined Work Rates**: Group productivity alterations.
7. **Maximum Subarray Sum**: Coding problem implementing Kadane's algorithm.
8. **Memory Addressing**: Calculation of row-major element offsets in C++.
9. **Blood Relations Case**: Coding relation puzzle identifying parent-child links.
10. **Subject-Verb Proximity**: Sentence correcting subject-verb matches.

---

## 📋 Recommended Schedule

### Night Before
- **21:00**: Put study materials away.
- **21:30**: Pack documents (Admit Card, ID Proof, Pen).
- **22:00**: Go to sleep. 8 hours of sleep prevents computational mistakes.

### Morning of Exam
- **06:30**: Wake up. Eat a light breakfast.
- **07:30**: Arrive at the test center early to avoid stress.
- **08:30**: Read the morning guide sheet.
- **09:00**: Exam begins. Keep track of your pacing.

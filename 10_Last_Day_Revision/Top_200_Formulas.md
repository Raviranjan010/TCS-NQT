# Top Formulas for TCS NQT (Ranked by TCS Frequency)

## 1. Number System Formulas (🔴 High)
## Percentage Formulas (🔴 High)
*   **Rule:** The quantity that comes after the word "than" or "of" is typically the base value.
*   **Sign Convention:** Use $+A$ or $+B$ for increases, and $-A$ or $-B$ for decreases.
*   **Three Changes:** If there are three successive changes $A\%$, $B\%$, and $C\%$, first find the net change of $A$ and $B$ (say $X$), then find the net change of $X$ and $C$.
*   **Area of a Rectangle:** $\text{Area} = \text{Length} \times \text{Width}$. If length increases by $L\%$ and width increases by $W\%$, the net change in area is:
    $$\text{Net Change in Area} = L + W + \frac{LW}{100}$$

## Ratio & Proportion Formulas (🔴 High)
*   **Properties:**
    *   Multiplying or dividing both terms of a ratio by the same non-zero number does not change its value ($a:b = am:bm$).
    *   To compare ratios, convert them to fractions or express them with a common denominator.
*   **Mean Proportional:** If $a, b, c$ are in continuous proportion ($a:b :: b:c$), then $b$ is the mean proportional between $a$ and $c$:
    $$b^2 = ac \implies b = \sqrt{ac}$$
*   **Third Proportional:** In $a:b :: b:c$, $c$ is the third proportional to $a$ and $b$:
    $$c = \frac{b^2}{a}$$
*   **Fourth Proportional:** If $a:b :: c:d$, then $d$ is the fourth proportional to $a, b, c$:
    $$d = \frac{b \times c}{a}$$

## Profit & Loss Formulas (🔴 High)
*   **Profit (P):** Occurs when $SP > CP$.
    $$P = SP - CP \implies \text{Profit \%} = \frac{SP - CP}{CP} \times 100$$
*   **Loss (L):** Occurs when $CP > SP$.
    $$L = CP - SP \implies \text{Loss \%} = \frac{CP - SP}{CP} \times 100$$
    *Note:* Profit % and Loss % are always calculated with **CP** as the base value (unless stated otherwise in the problem).
*   **Markup:** The amount by which MP exceeds CP.
    $$\text{Markup} = MP - CP \implies \text{Markup \%} = \frac{MP - CP}{CP} \times 100$$
    *Note:* Markup % is calculated with **CP** as the base value.
*   **Formula (Two Discounts):** If successive discounts of $d_1\%$ and $d_2\%$ are given, the single equivalent discount is:
    $$\text{Net Discount \%} = d_1 + d_2 - \frac{d_1 d_2}{100}$$

## Time & Work Formulas (🔴 High)
*   **Work ($W$):** The total task to be completed. We often assume total work to be $1$ unit (fraction method) or the LCM of the days taken (LCM method).
*   **Efficiency ($E$):** Work done per unit time (e.g., work done in 1 day).
*   **Time ($T$):** The duration taken to complete the work.
*   **Step 1:** Find the LCM of the individual times. Assume this is the "Total Units of Work."

## Time, Speed & Distance Formulas (🔴 High)
*   **Average Speed & The Harmonic Mean:** If a round trip covers the same distance at different speeds, do not average the speeds arithmetically. See [Average Notes — Average Speed Section](../01_Quantitative_Ability/04_Average/notes.md#2-average-speed--harmonic-mean-trap) for the Harmonic Mean speed trap.
*   **Speed-Time Inverse Relationship:** Since $\text{Distance} = \text{Speed} \times \text{Time}$, if the distance is kept constant, Speed and Time are inversely proportional ($S_1 T_1 = S_2 T_2$). Refer to [Ratio & Proportion Notes — Direct & Inverse Section](../01_Quantitative_Ability/03_Ratio_Proportion/notes.md#2-direct-and-inverse-proportion) to see speed-time ratio tricks.

## Simple & Compound Interest Formulas (🟡 Medium)
*   **Linear Growth:** SI grows linearly over time (Arithmetic Progression). Each year adds a fixed percentage increase of the *initial* principal.
*   **Exponential Growth:** CI grows exponentially over time (Geometric Progression).
*   **Compounding Intervals:** If interest is not compounded annually, the rate and cycles adjust as follows:
    *   *Half-Yearly (Semi-Annually):* Rate becomes $\frac{R}{2}\%$, cycles become $2n$.
        $$A = P \times \left(1 + \frac{R/2}{100}\right)^{2n}$$
    *   *Quarterly:* Rate becomes $\frac{R}{4}\%$, cycles become $4n$.
        $$A = P \times \left(1 + \frac{R/4}{100}\right)^{4n}$$
*   **For 1 Year:** If compounded annually, the interest for the first year is the same for both SI and CI:
    $$D_1 = \text{CI}_1 - \text{SI}_1 = 0$$

## Permutations & Combinations Formulas (🟡 Medium)
*   **Identical Objects Rule:** If there are $n$ objects where $p$ are of one type, $q$ are of a second type, and $r$ are of a third type, the number of unique arrangements is:
    $$\text{Arrangements} = \frac{n!}{p! \cdot q! \cdot r!}$$
    *Example:* Arranging the letters of the word "APPLE" ($N=5$, 'P' repeats twice):
    $$\text{Arrangements} = \frac{5!}{2!} = \frac{120}{2} = 60$$
*   **Properties of $^nC_r$:**
    *   $^nC_r = ^nC_{n-r}$ (Choosing $r$ objects is identical to choosing the $n-r$ objects to leave behind).
    *   $^nC_0 = ^nC_n = 1$
    *   $^nC_1 = n$
*   **Probability calculations:** Permutations and combinations are the primary tools used to determine the sizes of the event space $N(E)$ and sample space $N(S)$. See [Probability Notes](../01_Quantitative_Ability/10_Probability/notes.md) to see how combinations are used to solve marble, card, and committee probability questions.

## Probability Formulas (🟢 Low)
*   **Colors:** 26 Red (Hearts, Diamonds) and 26 Black (Spades, Clubs).
*   **Face Cards:** 12 cards total (4 Kings, 4 Queens, 4 Jacks).
*   **Number Cards:** 36 cards total (numbers 2 through 10 in each suit).
*   **Aces:** 4 cards total (not considered face cards).


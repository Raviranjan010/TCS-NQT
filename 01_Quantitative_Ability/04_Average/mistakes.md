# Average — Common Candidate Mistakes

This document details the most common traps candidates fall into during average and speed calculations in the TCS NQT exam and how to avoid them.

---

## 1. The Speed Arithmetic Mean Trap
*   **The Mistake:** Averaging speeds arithmetically (e.g., $\frac{v_1 + v_2}{2}$) when segment distances are equal.
*   **The Scenario:** A motorist travels to a place at 40 km/h and returns at 60 km/h. Candidates calculate the average speed as $50$ km/h.
*   **The Fix:** Use the Harmonic Mean formula: $\frac{2 \times 40 \times 60}{40 + 60} = 48$ km/h.

## 2. Weighted Average Group Size Omission
*   **The Mistake:** Finding the simple average of group averages when the group sizes are unequal.
*   **The Scenario:** Combined average marks of Section A (10 students, average 60) and Section B (20 students, average 90) calculated as $\frac{60 + 90}{2} = 75$.
*   **The Fix:** Use the weighted average formula: $\frac{10 \times 60 + 20 \times 90}{10 + 20} = \frac{2400}{30} = 80$.

## 3. Wrong Time Multiplier in Average Speed
*   **The Mistake:** Using wrong segment times when calculating overall speed.
*   **The Scenario:** Given speed in km/h and time in minutes, adding the minutes directly to hours without converting.
*   **The Fix:** Ensure all time variables are converted to hours (or all distance to meters and time to seconds) before applying $\text{Average Speed} = \text{Total Distance} / \text{Total Time}$.

## 4. Deviation Offset Base Error
*   **The Mistake:** Using the old count instead of the new count in the addition deviation formula.
*   **The Scenario:** When a new teacher joins 24 students, the average increases by 1 year. Candidates calculate the new weight using $24$ instead of $25$ as the count.
*   **The Fix:** Remember that the new element is added to the group, so the multiplier is the **new total count** (25).

## 5. Early Intermediate Rounding
*   **The Mistake:** Rounding fractional averages at intermediate steps.
*   **The Scenario:** Dividing a sum by 3 to get $33.3$ and then multiplying by 9 to get $299.7$ instead of the correct integer $300$.
*   **The Fix:** Retain fractions (e.g., $100/3$) throughout all intermediate calculations and only perform division at the final step.

## 6. Overlapping Terms Double Counting
*   **The Mistake:** Adding overlapping segments directly.
*   **The Scenario:** In a set of 11 elements, adding the sum of the first 6 elements and the last 6 elements without subtracting the middle element.
*   **The Fix:** Recognise that the 6th element is included in both segment sums, so: $\text{Overlapping Element} = (\text{Sum}_1 + \text{Sum}_2) - \text{Total Sum}$.

## 7. Consecutive AP Series Offset
*   **The Mistake:** Shifting the middle term in consecutive odd/even number series.
*   **The Scenario:** Given that the average of 5 consecutive odd numbers is 25, setting the series starting from 25 instead of setting 25 as the 3rd (middle) term.
*   **The Fix:** For $N$ consecutive odd/even numbers, the average is the exact middle term. Thus, the series expands symmetrically on both sides of the average.

## 8. Excluded Term Sign Confusion
*   **The Mistake:** Reversing the sign in the exclusion deviation formula.
*   **The Scenario:** When a member leaves and the average drops, candidates add the deviation instead of subtracting it, or vice versa.
*   **The Fix:** Standardise: $\text{Excluded Value} = \text{Old Average} + (\text{New Count}) \times (\text{Average Decrease})$.

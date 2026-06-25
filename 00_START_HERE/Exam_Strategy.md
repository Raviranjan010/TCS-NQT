---
title: "Start Here - Exam Strategy Guide"
section: "Orientation"
---

# TCS NQT Exam Strategy Guide

This guide details the exact tactical rules required to score maximum marks under the strict time locks and sequential constraints of the TCS NQT 2026 system.

---

## 🔒 1. Navigating Sequential Time Locks
The TCS NQT does **not** allow you to skip a question and return to it later. You must answer or submit the current question before the system unlocks the next one.

```
+-------------------------------------------------------------+
| Question N is displayed -> Timer starts ticking            |
+-------------------------------------------------------------+
                               |
                               v
+-------------------------------------------------------------+
| Check MCQ options OR calculate non-MCQ numerical value       |
+-------------------------------------------------------------+
                               |
                               v
+-------------------------------------------------------------+
| MUST SUBMIT ANSWER -> Question is locked -> Move to N+1     |
| (No going back!)                                            |
+-------------------------------------------------------------+
```

Since the sections are sequential (Numerical $\rightarrow$ Reasoning $\rightarrow$ Advanced $\rightarrow$ Verbal $\rightarrow$ Coding), you must adjust your strategy to the current question on the screen.

---

## ⏱️ 2. Time Management & The Skip Threshold
Do not let a single hard question destroy your time budget. Use these target rules:

*   **Numerical & Reasoning**: 75 seconds per question.
*   **Advanced Quant**: 107 seconds per question.
*   **Verbal Sentence Completion**: 25 seconds per question.
*   **The 45-Second Skip Rule**: If you have spent 45 seconds on an aptitude question and have not established a clear path to the solution (e.g. you don't know which formula or shortcut to apply), **stop calculation**. Eliminate obvious wrong options, make a logical guess, submit, and move on.

---

## 📝 3. Non-MCQ (Fill-in-the-Blank) Input Rules
TCS NQT has numerous Fill-in-the-Blank (FIB) questions where you must type the answer.

> [!CAUTION]
> The evaluation compiler is highly literal. Follow these formatting rules strictly:
> *   Enter **whole numbers or exact decimals only** (e.g. type `120` or `12.5`).
> *   Do **NOT** write any units or symbols:
>     *   Wrong: `120 ways`, `45%`, `₹500`, `25 km/hr`.
>     *   Right: `120`, `45`, `500`, `25`.
> *   Do **NOT** include trailing or leading spaces.

---

## 🎯 4. MCQ Option Elimination Hacks
If a question is MCQ, use these mathematical filters to eliminate incorrect options in under 5 seconds:

1.  **Unit Digit Check**: If multiplying $347 \times 899$, the units digit must be $7 \times 9 = 63 \implies 3$. Eliminate any options not ending in `3`.
2.  **Parity (Even/Odd)**: If adding two odd numbers, the result must be even. Check option parity.
3.  **Divisibility Check**: In percentage increase questions (e.g., A is $25\%$ more than B $\implies A = \frac{5}{4}B$), the value of A must be a multiple of 5. Filter options for multiples of 5.
4.  **Range Estimation**: If calculating compound interest on ₹10,000 at $10\%$ for 3 years, the interest must be greater than simple interest (₹3,000). Eliminate options less than ₹3,000.

---

## 🎲 5. Guessing Strategy (No Negative Marking)
TCS NQT has **no negative marking**. Never submit a blank answer. 
*   **For MCQs**: If you must guess, first eliminate at least 2 options using the hacks above, then select from the remaining two.
*   **For FIBs**: 
    *   If it is a Probability question, guess `0`, `1`, `1/2`, or `0.5`.
    *   If it is a P&C word arrangement, guess common factorial divisions like `120`, `24`, or `720`.
    *   If it is a ratio/percentage adjustment, guess `20`, `25`, or `33.33`.

---

## ⚠️ 6. Common Exam-Day Mistakes
*   **The Coding Trap**: Compiling your code but forgetting to click `"Save Code"` or `"Submit Code"`. If you do not click Save/Submit, your screen will evaluate as blank!
*   **SMS language in Emails**: Using short forms (e.g., `pls`, `u`, `r`) in the Verbal email writing section. The grading engine is automated and will deduct marks for grammar.
*   **Over-reading the Passage**: In the Passage Recall section, do not try to read and memorize word-for-word. The text disappears in 30 seconds. Focus on typing the main keywords (names, dates, actions) using simple, grammatically correct sentences.

---

## 🔔 7. The 5-Minute Warning Strategy
In the coding sections (35 mins and 55 mins):
*   When the timer hits **5:00 minutes remaining**, stop writing new algorithms or complex optimizations if your code has compilation errors.
*   Focus on ensuring your code compiles successfully. A compiling code that passes only the 2 public test cases is worth significantly more marks than a partially finished code that does not compile.

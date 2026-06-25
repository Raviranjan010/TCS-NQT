# TCS NQT 2026: Morning Exam-Day Guide

Read this quick-reference guide on the morning of the exam (10 minutes before entering the hall) to align your pacing and tactical strategy.

---

## ⏱️ Section-Wise Time Allocation

| Section | Questions | Total Duration | Target Pacing Per Question |
| :--- | :--- | :--- | :--- |
| **Numerical Ability** | 20 Questions | 25 Minutes | **75 Seconds** |
| **Reasoning Ability** | 20 Questions | 25 Minutes | **75 Seconds** |
| **Verbal Ability** | 25 Questions | 25 Minutes | **60 Seconds** |
| **Advanced Section (Quant + Reasoning)** | 20 Questions | 35 Minutes | **105 Seconds** |
| **Coding Section** | 2 Questions | 45 Minutes | **22.5 Minutes** |

---

## 🧠 Pre-Exam Mental Checklist

Review these five points before entering the exam room:

- [ ] **No Guess Penalty**: TCS NQT does not have negative marking. Do not leave any multiple-choice question unanswered.
- [ ] **Non-MCQ (FIB) Format**: For Fill-in-the-Blank questions, type **only numbers** (e.g., `45` and not `45 kg` or `45%`).
- [ ] **Verify Rough Sheet Layout**: Fold your scratch paper into grid squares to keep calculations organized and prevent line-skipping errors.
- [ ] **Fast I/O Reminder**: When starting the coding section, include the Fast I/O lines immediately in your templates.

---

## ⏳ The "First 2 Minutes" Blueprint

Complete these three tasks during the first 2 minutes of each section:

1. **Dump Formulas onto Scratch Paper**:
   - Write down the clock hands angle formula: $\theta = |30H - 5.5M|$.
   - Write down the SI/CI difference formulas: $D_2 = P(R/100)^2$ and $D_3 = P(R/100)^2 \cdot (3 + R/100)$.
   - Draw the alphabet position reference line (A to Z) with forward indices.
2. **Identify Question Formats**:
   - Scan the first few questions to see how many are MCQ versus FIB.
   - Plan to spend slightly more time on FIB questions, as you cannot check options to help solve them.
3. **Pace Allocation**:
   - Set a checkpoint at the 12-minute mark for Numerical/Reasoning (you should have completed at least 9 questions by this point).

---

## 🚦 The 90-Second Skip Rule

Keep track of your pacing using this decision framework:

```
[Start Solving Question]
        |
        +--> Time spent < 45s: Getting close to equation? -> Continue
        |
        +--> Time spent = 90s: Stinger point reached
                 |
                 v
     [Can you solve in 30s?]
        /             \
     Yes               No
     /                   \
[Finish & Select]     [Select Best Guess -> Mark & Skip]
```

> [!WARNING]
> Do not spend more than 90 seconds on any single question in Numerical or Reasoning. Guess, mark, and move on.

---

## 🚨 Emergency Shortcuts & Pacing Rescue

If time is running out (less than 2 minutes left) and you have unresolved questions:

### 1. Numerical Ability Rescue
- **Multiples Rule**: If solving work or percentage problems, look for options that are multiples of 9, 11, or 7 (matching common prime factorization bases).
- **CP-SP Check**: In profit and loss questions, if you need to guess SP, check which options share small factors with the given CP.
- **Clock angles**: The denominator of fractional answers in hands-coincidence questions is almost always `11` (e.g., $16 \frac{4}{11}$ minutes past $3$).

### 2. Coding Section Rescue
- **Force Brute-Force**: If you have 5 minutes left and your optimal $O(N)$ code is failing to compile or has bugs, replace it with a simple $O(N^2)$ brute-force solution.
- **Partial Marks**: Passing the small sample test cases will secure partial marks, which is much better than submitting an incomplete optimal template that scores 0.

# Exam Strategy — In-Exam Tactics

> This file is for what you do **during the exam**. For preparation strategy, see [Prime_Strategy.md](./00_Getting_Started/Prime_Strategy.md). For time budgeting, see [Time_Management.md](./00_Getting_Started/Time_Management.md).

---

## Before You Touch the First Question

**The first 2 minutes of each section are the most valuable.**  
Do NOT start answering immediately. Use this checklist:

1. **Read the section instructions fully** — confirm question count, time, and any section-specific rules
2. **Note the negative marking rate** — if it's shown (often appears in instructions): adjust your guessing threshold accordingly
3. **Mentally set your time budget** — "I have 40 minutes, 25 questions → ~90 sec per question; reserve 3 min for review"
4. **Identify the section's "cheap wins"** — skim question types; note which look fast vs. time-consuming

This 2-minute investment prevents panic-based mistakes later.

---

## Recommended Section Attempt Order

> ⚠️ You may not be able to freely choose which section to do first — TCS NQT sections are typically served sequentially with their own timers. [VERIFY] However, within each section, you control the order of individual questions.

### Within Foundation sections — Recommended question attempt order:

**Numerical Ability:**
```
Direct formula questions (SI/CI, %, Ratio) → TSD/Time & Work → DI sets → Number System → Hard questions
```

**Verbal Ability:**
```
Fill in the Blanks (fastest) → Synonym/Antonym → Para Jumbles → Sentence Improvement → RC passages last
```
*Why RC last?* Because RC questions are set-based — you get 4–6 Qs per passage with guaranteed returns if you understand the passage. Come to it with remaining time rather than getting trapped early.  
*Alternative (if RC is your strength):* Do RC first to lock in guaranteed correct answers.

**Reasoning Ability:**
```
Coding-Decoding (fastest) → Series → Analogy/Classification → Syllogism → Blood Relations → Direction → Seating/Puzzle last
```
*Seating/Puzzle last* — These are high-time-cost if the setup is complex. Do all faster Qs first; then use remaining time for puzzles where one understood setup = multiple correct answers.

---

## The Two-Pass System (Apply Within Every Section)

### Pass 1 — Sweep (target: spend ~70% of section time)
- Read each question once.
- If you see the approach and it takes under 75 seconds: **solve it now**.
- If you're unsure or it looks complex: **mark it, skip, move on**.
- Do NOT spend more than 90 seconds on any single question in Pass 1.

### Pass 2 — Return (target: spend ~25% of section time)
- Return to skipped questions.
- For each: attempt elimination (2 options gone → guess from remaining 2).
- If elimination fails and you truly have no idea: **leave blank** (negative marking applies).

### Final 3–5 minutes — Review
- Check flagged answers you were unsure about.
- Verify unit of the answer (seconds vs. minutes, rupees vs. thousands, etc.).
- **Do not change answers on gut feeling alone** — only change if you have identified a concrete error.

---

## Time-Per-Question Caps (Hard Limits)

| Section | Easy Q | Medium Q | Hard Q / Skip Threshold |
|---------|--------|---------|------------------------|
| Numerical Ability | 45 sec | 75 sec | 90 sec → skip |
| Verbal (MCQ) | 25 sec | 40 sec | 60 sec → skip |
| RC (entire passage+Qs) | — | 12–15 min per passage | Move on if over 15 min |
| Reasoning (standalone) | 30 sec | 60 sec | 90 sec → skip |
| Reasoning (set-based) | — | 4 min per set | 5 min max → skip entire set |
| Advanced Aptitude | 60 sec | 90 sec | 2 min → skip |
| Coding (problem) | — | 30 min for P1 | 30 min mark → submit P1, start P2 |

---

## Guessing Strategy (When to Guess vs. Skip)

With −1/3 negative marking per wrong MCQ: [VERIFY]

| Your Confidence | Action | Expected Value |
|----------------|--------|---------------|
| 0 options eliminated | **Skip** | 0 (safe) |
| 1 option eliminated (3 remain) | **Skip** (slightly negative EV) | −0.08 per guess |
| 2 options eliminated (2 remain) | **Guess** (positive EV) | +0.17 per guess |
| 3 options eliminated (1 remains) | **Mark it** (certain) | +1.0 |

**Practical rule:** If you can't eliminate at least half the options, do not guess.

---

## Section-Specific In-Exam Tactics

### Numerical Ability — In Exam

1. **Look at the answer options first, then the question** — options often reveal the scale of the answer (integers? decimals? very large/small?) and guide your computation approach.
2. **Use approximation** — In TCS NQT, exact computation is rarely needed. Round to nearest round number and see if your approximation matches one option cleanly.
3. **For DI:** Read axes/legends/units before reading any question. Misreading units (thousands vs. lakhs) is the #1 DI mistake.
4. **For Word Problems:** Circle the key numbers and conditions as you read. Underline what the question is asking. This takes 10 seconds and prevents answering the wrong thing.

### Verbal Ability — In Exam

1. **RC Strategy:** Read the first sentence of each paragraph only → get the gist → then read full paragraph of whichever section a question refers to. This is faster than reading the full passage before seeing the questions.
2. **Fill in the Blanks:** Read the sentence with each option substituted mentally. The correct answer should sound natural AND be grammatically correct AND match the sentence's tone (formal/informal).
3. **Error Detection:** Read the sentence at normal reading speed — your ear will often catch the error before your brain processes it formally.
4. **Para Jumbles:** Find the sentence that is clearly the opening (introduces a topic/person without reference to prior context) and the sentence that is clearly the closing (concludes, gives result/outcome). Then sequence the middle.

### Reasoning Ability — In Exam

1. **Series:** Write out the series on scratch paper. Look for: arithmetic progression, geometric progression, squares/cubes, alternating patterns, differences of differences.
2. **Coding-Decoding:** Table the given code pairs immediately. Identify the shift/operation rule from the example, then apply.
3. **Seating Arrangement / Puzzle:** Draw the setup (circle/line/table) on scratch paper before reading constraints. Add each constraint one by one. Do NOT try to hold it all in your head.
4. **Syllogism:** Use Venn diagrams. Two circles for two premises. Check if conclusion must be true, can be true, or cannot be true from the diagram.

### Coding Section — In Exam

1. **Minute 0–3:** Read the problem statement twice. Identify: input format, output format, constraints (n, value ranges), edge cases mentioned.
2. **Minute 3–6:** Plan your approach in comments. Write function signature. Identify data structures needed.
3. **Minute 6–28:** Implement. Use the language's standard library freely — no need to implement sorting from scratch.
4. **Minute 28–33:** Test with sample input. Test with 3 edge cases: empty, single element, maximum size.
5. **Minute 33–35:** Read for off-by-one errors, null checks, integer overflow (use long instead of int if n can be 10^9+).
6. **Minute 35+:** Submit. Start Problem 2. Even partial brute force is better than no submission.

---

## Last 15 Minutes of Any Section

| Time Remaining | Action |
|---------------|--------|
| 15 min | Finish any current question; do NOT start a new complex one |
| 10 min | Start Pass 2 — go through all skipped/flagged questions |
| 5 min | Final guesses from eliminated options (2-option guesses only) |
| 3 min | Read your most uncertain answers once more — change only with concrete reason |
| 1 min | Verify you haven't accidentally left a question you know the answer to unmarked |

---

## Mental State During the Exam

| Situation | Response |
|-----------|---------|
| Stuck on a question | "This one is worth 1 mark. 30 more marks available. Skip now." |
| Made a mistake you notice | Log it mentally, move on — do not dwell |
| Running low on time | No new hard questions; secure easy ones first |
| Anxiety spike | 3 slow breaths. Look at the time. Make a simple decision: what's the fastest Q I can answer right now? |
| Unsure about section order | Follow the recommended order from this file |
| Ran out of time with 5 Qs left | Mark best-guess for any you've read + partially understood |

---

## Night Before Exam Checklist

- [ ] Documents ready: hall ticket printed, ID card, photograph (if required) [VERIFY]
- [ ] Alarm set for 90 minutes before reporting time
- [ ] Know the route to the exam centre; have a backup transport plan
- [ ] Read [EXAM_STRATEGY.md](./EXAM_STRATEGY.md) one more time (this file)
- [ ] Read [Time_Management.md](./00_Getting_Started/Time_Management.md) one more time
- [ ] Do NOT study new content tonight
- [ ] Eat properly; sleep by 10pm

# Concept Guide: Blood Relations

This guide covers the family tree representations, symbol standards, solved questions, and common gender-bias traps for Blood Relations in the TCS NQT exam.

---

## 🖼️ 1. Symbol Standards & ASCII Family Tree

Use this standardized notation to represent family relationships:

*   **Male:** represented by `[ + ]` or `[ M ]`
*   **Female:** represented by `[ - ]` or `[ F ]`
*   **Spouse (Married):** represented by double horizontal lines `===`
*   **Siblings:** represented by a single horizontal line `---`
*   **Generations (Parent-Child):** represented by vertical lines `|`

### ASCII Family Tree Example:
```
           [ Grandfather (+) ] === [ Grandmother (-) ]
                                |
             +------------------+------------------+
             |                                     |
       [ Father (+) ] === [ Mother (-) ]      [ Uncle (+) ]
                      |
             +--------+--------+
             |                 |
        [ Son (+) ] ------ [ Daughter (-) ]
```

---

## 📊 2. Key Terms & Relationships

| Relation Phrasing | Actual Meaning | Common Shortcut |
| :--- | :--- | :--- |
| *"Only son of my father"* | Myself (if male) or my brother (if female) | Reduce to single entity |
| *"Father-in-law's only child"* | My spouse (wife or husband) | Direct mapping |
| *"Maternal uncle"* | Mother's brother | Skip one generation up |
| *"Paternal grandfather"* | Father's father | Two generations up |

---

## 🛠️ 3. Step-by-Step Method: Code $\rightarrow$ Tree $\rightarrow$ Solve

1.  **Identify Gender & Generation Shifts:** Note all clues that define gender (`+` or `-`) and generation changes.
2.  **Draw Parent-Child Links First:** Establish the vertical backbone of the family tree.
3.  **Draw Siblings & Spouses:** Fill in horizontal links.
4.  **Answer the Question:** Check who is being asked about relative to whom (e.g. "How is A related to B?" vs "How is B related to A?").

---

## ✏️ 4. Solved TCS NQT Questions

### Question 1: Pointing to a Portrait
*   **Question:** Pointing to a photograph of a boy, Suresh said, "He is the son of the only son of my mother." How is Suresh related to that boy?
*   **Family Tree:**
```
     [ Suresh's Mother (-) ]
               |
         [ Suresh (+) ] (Only son)
               |
          [ Boy (+) ] (Son)
```
*   **Solution:**
    *   "Only son of my mother" refers to Suresh himself (since Suresh is male).
    *   "He is the son of [Suresh]" means the boy in the photograph is Suresh's son.
    *   Therefore, Suresh is the father of the boy.
*   **Answer:** Father

---

### Question 2: Coded Blood Relation (NQT Special)
*   **Question:** If $A + B$ means A is the brother of B; $A - B$ means A is the sister of B; and $A \\times B$ means A is the father of B. Which of the following means $P$ is the uncle of $Q$?
    *   A) $P + R - Q$
    *   B) $P + R \\times Q$
    *   C) $P - R \\times Q$
    *   D) $P \\times R + Q$
*   **Family Tree (for Option B):**
```
   [ P (+) ] --- [ R (+) ]
                    |
                 [ Q (?) ]
```
*   **Solution:**
    *   Trace Option B: $P + R \\implies P$ is brother of $R$.
    *   $R \\times Q \\implies R$ is father of $Q$.
    *   Since $P$ is the brother of $Q$'s father, $P$ is the uncle of $Q$.
*   **Answer:** B

---

### Question 3: Multi-Generation Family Setup
*   **Question:** In a family of six people (P, Q, R, S, T, U), there are two married couples. T is a teacher and the father of R. U is the grandfather of R and is a contractor. Q is a housewife and the grandmother of T. How is T related to P? (Wait, let's trace grandfather and father).
*   **Family Tree:**
```
       [ U (+) ] (Contractor) === [ Q (-) ] (Grandmother of R / Housewife)
                               |
                        [ T (+) ] (Teacher/Father) === [ P (-) ]
                               |
                        [ R (?) ]
```
*   **Solution:**
    *   T is the father of R. U is the grandfather of R. Thus, U is the father of T.
    *   Q is the grandmother of R. Since U is grandfather, Q is U's wife.
    *   T is married to P (since there are two couples: U=Q and T=P).
    *   Therefore, T is the husband of P.
*   **Answer:** Husband

---

## 🚨 5. The Gender-Name Trap

> [!WARNING]
> **NEVER Assume Gender from Name:**
> In TCS NQT blood relation questions, **never** assign a gender based on a person's name. For example, if a question says *"Kiran is the child of Amit"*, do not assume Kiran is female or Amit is male. Look only for explicit keywords like *"brother"*, *"mother"*, *"son"*, or pronouns like *"he/she"*. If the gender is not explicitly stated, the relationship cannot be determined.

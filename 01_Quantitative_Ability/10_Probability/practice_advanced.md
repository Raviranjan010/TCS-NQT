# Probability — Practice Advanced (10 Questions)

**Target:** 70%+ | **Time:** 25 minutes

### Q1
A fair coin is tossed 5 times. P(exactly 3 heads)?

#### Standard Method
- P = 5C3 × (1/2)^3 × (1/2)^2 = 10 × 1/8 × 1/4 = 10/32 = **5/16**

#### Alternate
- Directly: 5C3/(2^5) = 10/32 = 5/16

---

### Q2
Two cards drawn from deck without replacement. P(both same suit)?

#### Standard Method
- P(both same suit) = 4 × (13C2) / 52C2 = 4×78/1326 = 312/1326 = **12/51**

#### Alternate
- P(2nd same suit as 1st) = 12/51 (after drawing one, 12 of same suit remain out of 51)

---

### Q3
P(sum of 2 dice ≥ 10)?

#### Standard Method
- Sum 10: (4,6)(5,5)(6,4) = 3
- Sum 11: (5,6)(6,5) = 2
- Sum 12: (6,6) = 1
- Total = 6; P = 6/36 = **1/6**

---

### Q4
A bag has 3 red and 4 black balls. Three balls are drawn without replacement. P(2 red, 1 black)?

#### Standard Method
- Favorable: 3C2 × 4C1 = 3×4 = 12
- Total: 7C3 = 35
- P = 12/35

---

### Q5
P(A) = 0.6, P(B) = 0.5, P(A∪B) = 0.8. Are A and B independent?

#### Solution
- P(A∩B) = P(A)+P(B)-P(A∪B) = 0.6+0.5-0.8 = 0.3
- If independent: P(A∩B) should = 0.6×0.5 = 0.3
- Yes, 0.3 = 0.3 → **A and B ARE independent**

---

### Q6
4 people sit in a row of 4 chairs. P(A and B always sit together)?

#### Standard Method
- Treat A,B as 1 unit: 3! × 2! = 12 favorable
- Total = 4! = 24
- P = 12/24 = **1/2**

---

### Q7
Die rolled 3 times. P(at least one 6)?

#### Standard Method
- P(no 6 in 3 rolls) = (5/6)^3 = 125/216
- P(at least one 6) = 1 - 125/216 = **91/216**

---

### Q8
A problem is given to three students A, B, C. P(solve) = 1/2, 1/3, 1/4. P(problem solved)?

#### Standard Method
- P(not solved) = (1/2)(2/3)(3/4) = 6/24 = 1/4
- P(solved) = 1 - 1/4 = **3/4**

---

### Q9
A bag has 5 white and 3 black balls. Two balls drawn successively without replacement. P(1st white, 2nd black)?

#### Solution
- P = (5/8) × (3/7) = 15/56

---

### Q10
A family has 2 children. Given that one is a boy, P(both boys)?

#### Standard Method
- Sample space: {BB, BG, GB, GG} → At least 1 boy: {BB, BG, GB}
- P(both boys | at least 1 boy) = P(BB)/P(at least 1 boy) = (1/4)/(3/4) = **1/3**

#### Note: Classic conditional probability trap

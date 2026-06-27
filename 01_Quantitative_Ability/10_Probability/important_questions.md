# Probability — Top 20 TCS Questions

### Q1 (High)
Die rolled. P(prime number)?
- Primes: 2,3,5 → P = **3/6 = 1/2**

### Q2 (High)
Card drawn. P(Spade or King)?
- P(Spade) = 13/52, P(King) = 4/52, P(King of Spades) = 1/52
- P = 13+4-1/52 = **16/52 = 4/13**

### Q3 (High)
2 dice. P(sum = 7)?
- **6/36 = 1/6**

### Q4 (High)
Bag: 4R, 5G, 6B. P(not Blue)?
- Not Blue = 9 balls; P = **9/15 = 3/5**

### Q5 (High)
P(at least 1 head in 4 coin tosses)?
- 1 - (1/2)^4 = **15/16**

### Q6 (High)
2 cards from deck. P(both aces)?
- (4/52) × (3/51) = 12/2652 = **1/221**

### Q7 (High)
Cards: P(number between 3 and 7, exclusive)?
- Cards 4,5,6 in 4 suits = 12; P = **12/52 = 3/13**

### Q8 (Medium)
3 coins tossed. P(at least 2 heads)?
- HHH, HHT, HTH, THH = 4; P = **4/8 = 1/2**

### Q9 (High)
P(A) = 0.6, P(B) = 0.7, independent. P(at least one occurs)?
- P(A∪B) = 0.6+0.7-0.42 = **0.88**

### Q10 (Medium)
Dice sum = 5?
- (1,4)(2,3)(3,2)(4,1) = 4; P = **4/36 = 1/9**

### Q11 (High)
From 52 cards, P(J, Q, K, A of same suit)?
- P = 4 × (1/52 × 1/51 × 1/50 × 1/49) ... actually pick 4 specific cards: 4! arrangements / 52P4 or 4!/52C4 × 1 = 4!/(52×51×50×49) is for ordered; for just the 4 cards: 4/52×3/51×2/50×1/49 × 4! ordered or 4C4/(52C4) = 1/270725 × 4 (4 suits) = **4/270725**

### Q12 (High)
Die rolled twice. P(product of numbers = 6)?
- (1,6),(2,3),(3,2),(6,1) = 4; P = **4/36 = 1/9**

### Q13 (Medium)
Bag: 2W, 3R, 4G. Pick 2. P(same color)?
- (2C2 + 3C2 + 4C2)/9C2 = (1+3+6)/36 = **10/36 = 5/18**

### Q14 (High)
3 coins. P(exactly 1 head)?
- HTT, THT, TTH = 3; P = **3/8**

### Q15 (High)
Card: P(not face card)?
- Non-face = 40; P = **40/52 = 10/13**

### Q16 (Medium)
P(A) = 1/4, P(B) = 1/3, mutually exclusive. P(A or B)?
- **1/4 + 1/3 = 7/12**

### Q17 (High)
Dice: P(at least one die shows 6 when 2 dice rolled)?
- 1 - (5/6)^2 = 1 - 25/36 = **11/36**

### Q18 (Medium)
3 people solve a problem with P = 1/2, 1/3, 1/4. P(exactly 1 solves)?
- A only: 1/2 × 2/3 × 3/4 = 1/4
- B only: 1/2 × 1/3 × 3/4 = 1/8
- C only: 1/2 × 2/3 × 1/4 = 1/12
- Total = 3/12+1.5/12+1/12 = 1/4+1/8+1/12 = 6/24+3/24+2/24 = **11/24**

### Q19 (High)
From 10 items (4 defective), 2 chosen randomly. P(both defective)?
- 4C2/10C2 = 6/45 = **2/15**

### Q20 (Medium)
P(A∩B) = 0.2, P(A) = 0.5. Find P(B|A)?
- P(B|A) = 0.2/0.5 = **0.4**

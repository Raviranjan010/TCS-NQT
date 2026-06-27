# Permutation & Combination — Complete Notes

## 1. Fundamental Counting Principle

If task A can be done in m ways and task B in n ways (independently), both can be done in m × n ways.

**Example:** 3 shirts × 4 pants = 12 outfit choices.

---

## 2. Factorial

n! = n × (n-1) × (n-2) × ... × 2 × 1

Key values:
| n | n! |
|---|----|
| 0 | 1  |
| 1 | 1  |
| 2 | 2  |
| 3 | 6  |
| 4 | 24 |
| 5 | 120|
| 6 | 720|
| 7 | 5040|
| 10 | 3628800|

---

## 3. Permutation (Order Matters)

Number of ways to arrange r items from n distinct items:
$$nPr = \frac{n!}{(n-r)!}$$

**When to use P:** Seats, codes, rankings, passwords — ORDER MATTERS.

### Special Cases
- All n items: nPn = n!
- Permutation with repetition: n^r ways to fill r positions from n items.

---

## 4. Combination (Order Does NOT Matter)

Number of ways to SELECT r items from n distinct items:
$$nCr = \frac{n!}{r!(n-r)!} = \frac{nPr}{r!}$$

**When to use C:** Teams, committees, handshakes, groups — ORDER DOESN'T MATTER.

### Key Properties
- nCr = nC(n-r) — choosing r is same as rejecting n-r
- nC0 = nCn = 1
- nC1 = n

---

## 5. P vs C — The Decision Rule

| Question Type | Formula |
|--------------|---------|
| Arrange / Order / Rank / Password | Permutation |
| Select / Choose / Committee / Team | Combination |
| Handshakes between n people | nC2 |
| Triangles from n points | nC3 |

---

## 6. Circular Permutation (TCS Level)

Arranging n distinct objects in a circle:
$$\text{Circular arrangements} = (n-1)!$$

**Why:** In a circle, one position is fixed to remove duplicates from rotation.

If arrangements are also mirror-image distinct (like necklace):
$$= \frac{(n-1)!}{2}$$

---

## 7. Arrangements with Identical Elements

If a word has repeated letters, the arrangements are:
$$= \frac{n!}{p! \cdot q! \cdot r! \cdots}$$

where p, q, r are frequencies of repeated letters.

**Example:** BANANA = 6!/(3!2!1!) = 720/12 = 60 arrangements.

---

## 8. TCS-Specific Patterns

1. **Word arrangements** — letters of a word, vowels together
2. **Committee selection** — choosing m from n with restrictions
3. **Handshake problems** — nC2
4. **Circular seating** — (n-1)! formula

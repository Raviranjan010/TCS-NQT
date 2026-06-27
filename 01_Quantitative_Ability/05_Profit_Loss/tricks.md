# Profit & Loss — Tricks & Traps

This guide focuses on option elimination, ratio check tricks, and avoiding common TCS traps.

---

## 1. Option Elimination & Ratio Verification

### The "Markup vs Profit" Bound
Because a discount is offered on the Marked Price, the profit percentage can never exceed the markup percentage.
*   **The Trick:**
    $$	ext{Profit \%} \le 	ext{Markup \%}$$
*   **Application:** If a dealer marks up his goods by $30\%$, eliminate any options suggesting a profit margin $\ge 30\%$.

### The "Divisibility of CP" Check
Since financial values are usually whole numbers or round decimals, look for multiples.
*   **The Trick:** If a product is sold at a $25\%$ profit ($rac{1}{4}$ gain), the Selling Price must be a multiple of 5 ($SP = CP 	imes rac{5}{4}$).
*   **Application:** Look at the SP options and verify if they are divisible by 5.

---

## 2. TCS-Specific Traps

### Trap 1: The "Two Items Same SP" Trick
A dealer sells two items for the same price, gaining $X\%$ on one and losing $X\%$ on the other.
*   **The Trap:** Candidates think there is "No Profit, No Loss."
*   **The Fix:** There is **always a loss** in this scenario, given by:
    $$	ext{Net Loss \%} = rac{X^2}{100}\%$$
    *   *Example:* If $X = 20\%$, the loss is $rac{400}{100} = 4\%$ loss.

### Trap 2: Discount on CP Error
*   **The Trap:** Applying discount on CP instead of MP.
*   **The Fix:** Discounts are strictly calculated with MP as the base. If a problem states "discount of $10\%$," write $SP = MP 	imes 0.90$, never $CP 	imes 0.90$.\n
# Profit & Loss — Worked Examples

This document contains 5 detailed worked examples representing common profit and loss questions in the TCS NQT.

---

## Example 1 — Successive Discounts

### Problem Statement
An item has a Marked Price of 2,000 Rupees. Find the final Selling Price if the shopkeeper offers three successive discounts of $10\%$, $20\%$, and $5\%$.

### Step-by-Step Solution

1.  **Define the Multipliers:**
    *   First discount = $10\% ightarrow M_1 = 0.90$.
    *   Second discount = $20\% ightarrow M_2 = 0.80$.
    *   Third discount = $5\% ightarrow M_3 = 0.95$.

2.  **Set up the SP Equation:**
    $$SP = MP 	imes M_1 	imes M_2 	imes M_3$$
    $$SP = 2000 	imes 0.90 	imes 0.80 	imes 0.95$$

3.  **Perform the Calculation:**
    $$SP = 2000 	imes 0.72 	imes 0.95$$
    $$SP = 1440 	imes 0.95$$
    $$SP = 1440 	imes \left(1 - 0.05ight)$$
    $$SP = 1440 - 72 = 1368 	ext{ Rupees}$$

### Final Answer
The final Selling Price is **1,368 Rupees**.

---

## Example 2 — The "Same SP" Loss Calculation

### Problem Statement
A dealer sells two television sets for 9,900 Rupees each. On one he gains $10\%$ and on the other he loses $10\%$. Find his total gain or loss percentage.

### Step-by-Step Solution

1.  **Identify the Shortcut Case:**
    *   Two items are sold for the exact same price ($SP_1 = SP_2 = 9900$).
    *   One transaction has a gain of $X\% = 10\%$, the other has a loss of $X\% = 10\%$.

2.  **Apply the Net Loss Formula:**
    $$	ext{Net Loss \%} = rac{X^2}{100}\%$$
    $$	ext{Net Loss \%} = rac{10^2}{100}\% = rac{100}{100}\% = 1\% 	ext{ loss}$$

3.  **Verify via Long Method (Optional):**
    *   $CP_1 = 9900 / 1.1 = 9000$ Rupees.
    *   $CP_2 = 9900 / 0.9 = 11000$ Rupees.
    *   Total CP = $9000 + 11000 = 20000$ Rupees.
    *   Total SP = $9900 	imes 2 = 19800$ Rupees.
    *   Loss = $20000 - 19800 = 200$ Rupees.
    *   Loss % = $rac{200}{20000} 	imes 100 = 1\%$.

### Final Answer
His total loss is **1%**.

---

## Example 3 — Dishonest Dealer (False Weight)

### Problem Statement
A dishonest dealer professes to sell his goods at cost price, but he uses a false weight of 950 grams for a kilogram. Find his gain percentage.

### Step-by-Step Solution

1.  **Identify the Variables:**
    *   True Weight ($W_t$) = 1000 grams.
    *   False Weight ($W_f$) = 950 grams.

2.  **Apply the Dishonest Dealer Formula:**
    $$	ext{Gain \%} = rac{	ext{True Weight} - 	ext{False Weight}}{	ext{False Weight}} 	imes 100$$
    $$	ext{Gain \%} = rac{1000 - 950}{950} 	imes 100$$

3.  **Simplify and Calculate:**
    $$	ext{Gain \%} = rac{50}{950} 	imes 100$$
    $$	ext{Gain \%} = rac{1}{19} 	imes 100 pprox 5.26\%$$

### Final Answer
His gain percentage is **5.26%**.

---

## Example 4 — Finding CP from Profit & Discount

### Problem Statement
By selling an item for 1,170 Rupees, a shopkeeper earns a profit of $30\%$ after offering a discount of $10\%$. Find the Cost Price of the item.

### Step-by-Step Solution

1.  **Recall the CP-MP Ratio Formula:**
    $$rac{MP}{CP} = rac{100 + P}{100 - D}$$
    $$rac{MP}{CP} = rac{100 + 30}{100 - 10} = rac{130}{90} = rac{13}{9}$$

2.  **Calculate Marked Price (MP) from SP:**
    *   Discount is $10\%$ on MP.
    *   $$SP = MP 	imes 0.90 \implies 1170 = MP 	imes 0.90$$
    *   $$MP = rac{1170}{0.90} = 1300 	ext{ Rupees}$$

3.  **Calculate Cost Price (CP):**
    *   Since $rac{MP}{CP} = rac{13}{9}$:
        $$rac{1300}{CP} = rac{13}{9} \implies CP = 900 	ext{ Rupees}$$

### Final Answer
The Cost Price of the item is **900 Rupees**.

---

## Example 5 — Quantity Marked Up

### Problem Statement
A dealer marks up his goods by $40\%$ and then offers a discount of $25\%$. What is his net profit or loss percentage?

### Step-by-Step Solution

1.  **Define Multipliers:**
    *   Markup = $40\% ightarrow M_{	ext{markup}} = 1.40$.
    *   Discount = $25\% ightarrow M_{	ext{discount}} = 0.75$.

2.  **Formulate SP Multiplier:**
    $$SP = CP 	imes M_{	ext{markup}} 	imes M_{	ext{discount}}$$
    $$SP = CP 	imes 1.40 	imes 0.75$$

3.  **Perform Calculation:**
    $$SP = CP 	imes 1.05$$
    *   This multiplier represents a $5\%$ increase over CP.

### Final Answer
His net profit is **5%**.\n
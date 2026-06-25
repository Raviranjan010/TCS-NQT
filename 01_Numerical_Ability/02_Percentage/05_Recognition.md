# Percentage Pattern Recognition Guide

Use this guide to instantly identify the underlying math model based on specific keywords in the TCS NQT question.

---

## 1. The "Remaining" Trap (Salary Partitioning)

```
                     Review Expenditure Wording
                                 |
         +-----------------------+-----------------------+
         |                                               |
     Has "Remaining" keyword?                        No "Remaining" keyword?
  (e.g., "spends 20% on rent and                  (e.g., "spends 20% on rent and
   10% of remaining on food")                      10% on food")
         |                                               |
         v                                               v
   Use Chain Multiplication                        Sum Percentages Directly
  Net Remaining = Total * 0.8 * 0.9              Total Spent = (20 + 10) = 30%
                                                 Remaining = 100 - 30 = 70%
```

### Immediate Worked Example:
A man spends $20\%$ of his monthly income on house rent and $25\%$ of the **remaining** on children's education. If he is left with ₹6,000, what is his total income?

#### Recognition Trigger:
The word **"remaining"** is present. We must use chain multiplication.

#### Mathematical Setup:
$$\text{Income} \times (1 - 0.20) \times (1 - 0.25) = 6000$$
$$\text{Income} \times 0.80 \times 0.75 = 6000$$
$$\text{Income} \times \frac{4}{5} \times \frac{3}{4} = 6000 \implies \text{Income} \times \frac{3}{5} = 6000$$
$$\text{Income} = \frac{6000 \times 5}{3} = ₹10,000$$

---

## 2. The Election Vote Balance Pattern
*   **Trigger Phrasing**: *"An election between two candidates... winner got $W\%$ of total votes and won by a margin of $V$ votes."*
*   **Immediate Strategy**:
    $$\text{Winner's Votes} = W\%$$
    $$\text{Loser's Votes} = (100 - W)\%$$
    $$\text{Vote Margin } (V) = \text{Winner} - \text{Loser} = (2W - 100)\% \text{ of Total Votes}$$

### Immediate Worked Example:
In an election between two candidates, the winning candidate secure $60\%$ of the total votes polled and wins by a margin of 1,600 votes. Find the total number of votes polled.

#### Mathematical Setup:
1.  Winner $= 60\%$
2.  Loser $= 100\% - 60\% = 40\%$
3.  Margin $= 60\% - 40\% = 20\%$
4.  Set up the margin equation:
    $$20\% \text{ of Total Votes} = 1600$$
    $$\frac{1}{5} \times \text{Total} = 1600 \implies \text{Total} = 1600 \times 5 = 8000\text{ votes}$$

---

## 3. Price-Consumption-Expenditure Adjustments
*   **Trigger Phrasing**: *"Price of sugar increases by $P\%$, family increases expenditure by $E\%$. Find the change in consumption."*
*   **Immediate Strategy**: Since $\text{Expenditure} = \text{Price} \times \text{Consumption}$, use Multiplying Factors:
    $$MF_{\text{Expenditure}} = MF_{\text{Price}} \times MF_{\text{Consumption}}$$
    $$MF_{\text{Consumption}} = \frac{MF_{\text{Expenditure}}}{MF_{\text{Price}}}$$

### Immediate Worked Example:
The price of petrol rises by $20\%$. A driver wants to increase their overall expenditure on petrol by only $8\%$. By what percentage must they reduce their consumption?

#### Mathematical Setup:
1.  $MF_{\text{Price}} = 1.20 = \frac{6}{5}$
2.  $MF_{\text{Expenditure}} = 1.08 = \frac{108}{100} = \frac{27}{25}$
3.  Calculate $MF_{\text{Consumption}}$:
    $$MF_{\text{Consumption}} = \frac{27/25}{6/5} = \frac{27}{25} \times \frac{5}{6} = \frac{9}{10} = 0.90$$
4.  Convert back to change:
    $$MF = 0.90 \implies 10\%\text{ decrease in consumption.}$$

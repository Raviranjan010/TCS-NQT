# Profit & Loss — Formulas & Derivations

This document compiles the core formulas and algebraic derivations for Cost Price (CP), Selling Price (SP), Marked Price (MP), Discounts, and Dishonest Dealer scenarios.

---

## 1. Core Equations & Definitions

### Profit and Loss Percentage
$$	ext{Profit \%} = rac{SP - CP}{CP} 	imes 100$$
$$	ext{Loss \%} = rac{CP - SP}{CP} 	imes 100$$
*   **Derivation:** Profit and Loss are relative metrics calculated with **Cost Price (CP)** as the baseline (since CP is the actual initial expenditure).

### Markup Percentage
$$	ext{Markup \%} = rac{MP - CP}{CP} 	imes 100$$
*   **Derivation:** Markup represents the increase in listed price over the cost price. Thus, it is calculated with CP as the base.

### Discount Percentage
$$	ext{Discount \%} = rac{MP - SP}{MP} 	imes 100$$
*   **Derivation:** Discounts are always offered on the **Marked Price (MP)**, which is the listed price. Hence, MP is the base value.

---

## 2. Advanced Relations

### Relation Between CP and MP
$$rac{MP}{CP} = rac{100 + 	ext{Profit \%}}{100 - 	ext{Discount \%}}$$
*   **Derivation:** We know that:
    $$SP = CP 	imes \left(1 + rac{P}{100}ight) \quad 	ext{and} \quad SP = MP 	imes \left(1 - rac{D}{100}ight)$$
    Equating the two expressions for SP:
    $$CP 	imes \left(rac{100 + P}{100}ight) = MP 	imes \left(rac{100 - D}{100}ight) \implies rac{MP}{CP} = rac{100 + P}{100 - D}$$

### Successive Discounts (2 Rates)
$$	ext{Net Discount \%} = d_1 + d_2 - rac{d_1 d_2}{100}$$
*   **Derivation:** Let MP = 100.
    *   After first discount $d_1$: Price = $100 - d_1$.
    *   After second discount $d_2$: Price = $(100 - d_1) 	imes (1 - d_2 / 100) = 100 - d_1 - d_2 + rac{d_1 d_2}{100}$.
    *   Subtract from 100 to get net discount.

### Dishonest Dealer Profit
$$	ext{Profit \%} = rac{	ext{True Weight} - 	ext{False Weight}}{	ext{False Weight}} 	imes 100$$
*   **Derivation:** A dealer sells a quantity at CP but uses a lower weight. The cost incurred by the dealer corresponds to the false weight, while the revenue corresponds to the true weight. Thus, $	ext{Gain} = rac{	ext{True Weight} - 	ext{False Weight}}{	ext{False Weight}} 	imes 100$.

---

## 3. Quick Revision Reference Table

| Formula Name | Algebraic Expression | Standard Application |
| :--- | :--- | :--- |
| Selling Price (Profit) | $SP = CP 	imes rac{100 + P}{100}$ | Standard trade calculations |
| Selling Price (Discount) | $SP = MP 	imes rac{100 - D}{100}$ | Calculating discounted retail price |
| CP-MP Ratio | $rac{MP}{CP} = rac{100 + P}{100 - D}$ | Finding markup or discount bounds |
| Two Successive Discounts | $d_1 + d_2 - rac{d_1 d_2}{100}$ | Sales promotion campaigns |
| Dishonest Dealer Gain | $rac{	ext{Error}}{	ext{False Weight}} 	imes 100$ | False scale cheating problems |\n
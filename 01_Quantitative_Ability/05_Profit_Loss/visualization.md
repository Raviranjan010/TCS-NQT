# Profit & Loss — Visual Diagrams

This file provides visual representations of price flows and dishonest dealer transactions.

---

## 1. Price Flowchart: CP to MP to SP

This flowchart demonstrates the sequence of pricing adjustments, showing where markup and discount are applied.

```mermaid
graph TD
    A[Cost Price: CP] -->|Apply Markup: +M%| B[Marked Price: MP]
    B -->|Apply Discount: -D%| C[Selling Price: SP]
    A -->|Net Profit or Loss| C
```

---

## 2. Dishonest Dealer Balance (Ratio Scaling)

This diagram visualizes how false weight scales the profit multiplier.

```mermaid
graph LR
    CP[CP per unit weight] -->|Markup Multiplier: 1 + M/100| SP[Base SP]
    SP -->|Weight Multiplier: True / False| NetSP[Actual SP received]
    NetSP -->|Compare to CP| Profit[Net Profit %]
```

---

## 3. Decision Rules
1.  **Markup:** Calculated on Cost Price.
2.  **Discount:** Calculated on Marked Price.
3.  **Profit/Loss:** Calculated on Cost Price.
4.  **Transaction Values:** Taxes are applied to the final Selling Price (SP).\n
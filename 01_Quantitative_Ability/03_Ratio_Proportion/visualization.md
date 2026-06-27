# Ratio & Proportion — Visual Diagrams

This file provides visual models of proportion relationships and the alligation cross-method.

---

## 1. Direct vs. Inverse Proportion Models

```mermaid
graph TD
    A[Proportionality Model] --> B[Direct Proportion: Y = kX]
    A --> C[Inverse Proportion: Y = k/X]
    B --> D[Both variables change in the SAME direction]
    B --> E[Example: Men vs. Total Work Done]
    C --> F[Variables change in OPPOSITE directions]
    C --> G[Example: Speed vs. Travel Time]
```

---

## 2. The Alligation Cross-Diagram

This diagram visualizes how the ratio of two ingredients is derived from their individual prices and the target mean price.

```mermaid
graph TD
    A[Cheaper Price: C] -->|Subtract Mean| D["Dearer - Mean: (D - M)"]
    B[Dearer Price: D] -->|Subtract Cheaper| E["Mean - Cheaper: (M - C)"]
    C[Mean Price: M] -->|Alligation Center| A
    C -->|Alligation Center| B
    D -->|Represents| F[Cheaper Quantity Ratio]
    E -->|Represents| G[Dearer Quantity Ratio]
```

---

## 3. Dilution Process (Successive Replacements)

For successive replacements of a pure liquid with water:
1.  **Start:** Pure liquid of volume $V$.
2.  **Step 1:** Remove $x$ liters of mixture, add $x$ liters of water. Concentration drops by factor $(1 - x/V)$.
3.  **Step 2:** Repeat. Concentration drops again by factor $(1 - x/V)$.
4.  **Formula representation:** $\text{Liquid Volume} = V \times (1 - x/V)^n$.

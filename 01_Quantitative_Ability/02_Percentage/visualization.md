# Percentage — Visual Diagrams

This file provides visual representations of percentage workflows and equations.

---

## 1. Successive Percentage Change Flowchart

This flowchart demonstrates the compounding steps of applying consecutive percentage changes to a base value.

```mermaid
graph TD
    A[Initial Value: X] -->|Apply Change: +A%| B[Intermediate Value: Y]
    B -->|Multiplier: 1 + A/100| B
    B -->|Apply Change: -B%| C[Final Value: Z]
    C -->|Multiplier: 1 - B/100| C
    A -->|Net Formula: A - B - AB/100| C
```

---

## 2. Product Constancy Relationship (Balancing Act)

This diagram shows how variables adjust to maintain a constant product (e.g., Price and Consumption).

```mermaid
graph LR
    P[Price increases by 1/x] -->|Must Balance| C[Consumption decreases by 1/x+1]
    C -->|Product Constancy| E[Expenditure remains Constant]
    
    P2[Price decreases by 1/x] -->|Must Balance| C2[Consumption increases by 1/x-1]
    C2 -->|Product Constancy| E
```

---

## 3. Calculation Workflow

To solve any percentage word problem:
1.  **Identify the Base:** Determine the value to which the percentage is applied (comes after "than" or "of").
2.  **Convert to Fraction/Multiplier:** Use fractional equivalents to simplify the math.
3.  **Perform Operation:** Apply the scale factor.
4.  **Verify Integrity:** Check if the final value makes logical sense (e.g., increase leads to a larger number).

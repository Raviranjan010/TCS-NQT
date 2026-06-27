# Time & Work — Visual Diagrams

This file visualizes task allocation, LCM work units, and pipes & cisterns flow systems.

---

## 1. LCM Work Unit Allocation

This diagram illustrates how a total work of 60 units is divided based on individual efficiencies.

```mermaid
graph TD
    A[Total Work: 60 units] -->|Divide by 12 Days| B[A's Efficiency: 5 units/day]
    A -->|Divide by 15 Days| C[B's Efficiency: 4 units/day]
    B -->|Combine| D[Total Efficiency: 9 units/day]
    C -->|Combine| D
    D -->|Divide 60 units| E[Time taken: 6.67 Days]
```

---

## 2. Pipes & Cisterns Flow Dynamics (Inlet vs. Leak)

This diagram visualizes a cistern with an inlet pipe and a leak at the bottom.

```mermaid
graph TD
    Inlet[Inlet Pipe: +R1] --> Tank[Cistern capacity: V]
    Leak[Outlet/Leak: -R2] -->|Outflow| Tank
    Tank -->|Net Flow: R1 - R2| WaterLevel[Water Accumulation]
```

---

## 3. Alternating Days Timeline
For alternating days work (A on Day 1, B on Day 2):
*   **Cycle 1:** Day 1 (A) $ightarrow$ Day 2 (B) $ightarrow$ Total: $E_A + E_B$.
*   **Cycle 2:** Day 3 (A) $ightarrow$ Day 4 (B) $ightarrow$ Total: $E_A + E_B$.
*   **Final Step:** Remaining work divided by the active worker's efficiency.\n
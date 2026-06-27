# Arrays — Visualization

## Diagram 1 — Sliding Window (Fixed Size k=3)

```mermaid
flowchart LR
    subgraph Array
        A0["2"] --- A1["1"] --- A2["5"] --- A3["1"] --- A4["3"] --- A5["2"]
    end

    subgraph Window_1["Window 1 (i=0..2)  Sum=8"]
        W1A["2"] --- W1B["1"] --- W1C["5"]
    end

    subgraph Window_2["Window 2 (i=1..3)  Sum=7\n+1 −2"]
        W2A["1"] --- W2B["5"] --- W2C["1"]
    end

    subgraph Window_3["Window 3 (i=2..4)  Sum=9\n+3 −1"]
        W3A["5"] --- W3B["1"] --- W3C["3"]
    end

    subgraph Window_4["Window 4 (i=3..5)  Sum=6\n+2 −5"]
        W4A["1"] --- W4B["3"] --- W4C["2"]
    end

    Window_1 -->|"slide right"| Window_2
    Window_2 -->|"slide right"| Window_3
    Window_3 -->|"slide right"| Window_4

    style Window_3 fill:#2ecc71,color:#fff
```

**Answer: Maximum window sum = 9 (window 3)**

---

## Diagram 2 — Two Pointer (Find Pair with Sum = 9 in Sorted Array)

```mermaid
flowchart LR
    subgraph Sorted["Sorted Array: [1, 3, 4, 5, 7, 10]"]
        direction LR
        E0["1\nL"] --- E1["3"] --- E2["4"] --- E3["5"] --- E4["7"] --- E5["10\nR"]
    end

    S1["Step 1: L=1, R=10  sum=11 > 9  → R--"]
    S2["Step 2: L=1, R=7   sum=8  < 9  → L++"]
    S3["Step 3: L=3, R=7   sum=10 > 9  → R--"]
    S4["Step 4: L=3, R=5   sum=8  < 9  → L++"]
    S5["Step 5: L=4, R=5   sum=9  == 9 ✓ FOUND"]

    S1 --> S2 --> S3 --> S4 --> S5

    style S5 fill:#2ecc71,color:#fff
```

---

## Diagram 3 — Kadane's Algorithm Trace

```mermaid
flowchart TD
    Start(["Array: [-2, 1, -3, 4, -1, 2, 1, -5, 4]"])
    Start --> I0["i=0: curr=-2, max=-2"]
    I0 --> I1["i=1: curr=max(1, -2+1)=1, max=1"]
    I1 --> I2["i=2: curr=max(-3, 1-3)=-2, max=1"]
    I2 --> I3["i=3: curr=max(4, -2+4)=4, max=4"]
    I3 --> I4["i=4: curr=max(-1, 4-1)=3, max=4"]
    I4 --> I5["i=5: curr=max(2, 3+2)=5, max=5"]
    I5 --> I6["i=6: curr=max(1, 5+1)=6, max=6"]
    I6 --> I7["i=7: curr=max(-5, 6-5)=1, max=6"]
    I7 --> I8["i=8: curr=max(4, 1+4)=5, max=6"]
    I8 --> Result(["Answer: 6  (subarray [4,-1,2,1])"])

    style Result fill:#2ecc71,color:#fff
```

---

## Diagram 4 — Prefix Sum Array Build and Query

```mermaid
flowchart LR
    subgraph Original["nums: [3, 0, 2, 5, 1]"]
        N0["3"] --- N1["0"] --- N2["2"] --- N3["5"] --- N4["1"]
    end

    subgraph Prefix["prefix: [0, 3, 3, 5, 10, 11]"]
        P0["0"] --- P1["3"] --- P2["3"] --- P3["5"] --- P4["10"] --- P5["11"]
    end

    Original -->|"prefix[i+1] = prefix[i] + nums[i]"| Prefix

    Q["Query: sum(1, 3) = prefix[4] - prefix[1] = 10 - 3 = 7"]
    Prefix --> Q
    style Q fill:#3498db,color:#fff
```

---

## Diagram 5 — Dutch National Flag (Sort Colors)

```mermaid
flowchart TD
    Start(["[2,0,2,1,1,0]   low=0  mid=0  high=5"])
    Start --> S1["nums[mid=0]=2 → swap(mid,high) → [0,0,2,1,1,2]  high=4"]
    S1 --> S2["nums[mid=0]=0 → swap(low,mid) → [0,0,2,1,1,2]  low=1  mid=1"]
    S2 --> S3["nums[mid=1]=0 → swap(low,mid) → [0,0,2,1,1,2]  low=2  mid=2"]
    S3 --> S4["nums[mid=2]=2 → swap(mid,high) → [0,0,1,1,2,2]  high=3"]
    S4 --> S5["nums[mid=2]=1 → mid=3"]
    S5 --> S6["nums[mid=3]=1 → mid=4"]
    S6 --> S7["mid=4 > high=3 → DONE"]
    S7 --> End(["Result: [0,0,1,1,2,2] ✓"])

    style End fill:#2ecc71,color:#fff
```

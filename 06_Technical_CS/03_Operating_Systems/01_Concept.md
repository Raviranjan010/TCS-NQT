# Operating Systems (OS) - Concept Guide

This guide covers CPU scheduling, concurrency, deadlocks, and memory management principles tested in the TCS NQT Prime Operating Systems section. It is designed to be mathematically rigorous and fully self-contained.

---

## 1. CPU Scheduling Algorithms

CPU scheduling determines which process in the ready queue is allocated the CPU.

| Algorithm | Preemption | Selection Criteria | Advantage | TCS NQT Trap / Limitation |
| :--- | :--- | :--- | :--- | :--- |
| **FCFS** | Non-Preemptive | Arrival Time | Simple to implement | **Convoy Effect:** Short processes wait behind a long process. |
| **SJF** | Non-Preemptive | Shortest Burst Time | Minimizes average waiting time | **Starvation:** Long processes may never run if short ones keep arriving. |
| **SRTF** | Preemptive | Shortest Remaining Time | Optimal average waiting time | High context-switching overhead; requires estimating future burst times. |
| **Round Robin** | Preemptive | Time Quantum slice | Fair allocation; low response time | Performance depends heavily on the **Time Quantum** size. |
| **Priority** | Both | Priority Value | Supports urgent tasks | **Indefinite Blocking:** Resolved via **Aging** (gradually increasing priority). |

---

### Gantt Chart Simulation (SRTF Example)

Let us simulate the **Shortest Remaining Time First (SRTF)** scheduling algorithm using four processes.

#### Process Dataset
*   **P1:** Arrival = 0 ms, Burst = 8 ms
*   **P2:** Arrival = 1 ms, Burst = 4 ms
*   **P3:** Arrival = 2 ms, Burst = 9 ms
*   **P4:** Arrival = 3 ms, Burst = 5 ms

#### Step-by-Step Execution Sequence
1.  **Time = 0 ms:** Only **P1** has arrived. It begins running. (Remaining Burst: P1 = 8).
2.  **Time = 1 ms:** **P2** arrives with burst 4. P1 has 7 ms remaining. Since $\text{Burst}(P2) < \text{Remaining}(P1)$ ($4 < 7$), **P2** preempts **P1**.
3.  **Time = 2 ms:** **P3** (burst 9) arrives. Remaining burst of P2 is 3. P2 continues running.
4.  **Time = 3 ms:** **P4** (burst 5) arrives. Remaining burst of P2 is 2. P2 continues running.
5.  **Time = 5 ms:** **P2** completes execution. Available processes in queue: P1 (remaining 7), P3 (remaining 9), P4 (remaining 5). **P4** has the shortest remaining time and begins running.
6.  **Time = 10 ms:** **P4** completes execution. Available in queue: P1 (7), P3 (9). **P1** runs next.
7.  **Time = 17 ms:** **P1** completes execution. **P3** runs next.
8.  **Time = 26 ms:** **P3** completes execution.

#### Gantt Chart Visual
```text
+---+----+----+----+-----+-----+
| P1| P2 | P4 | P1 | P3  |
+---+----+----+----+-----+-----+
0   1    5    10   17    26
```

#### Metric Calculations
*   $\text{Turnaround Time (TAT)} = \text{Completion Time} - \text{Arrival Time}$
*   $\text{Waiting Time (WT)} = \text{Turnaround Time} - \text{Initial Burst Time}$

| Process | Arrival Time | Burst Time | Completion Time | Turnaround Time (TAT) | Waiting Time (WT) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **P1** | 0 ms | 8 ms | 17 ms | $17 - 0 = 17\text{ ms}$ | $17 - 8 = 9\text{ ms}$ |
| **P2** | 1 ms | 4 ms | 5 ms | $5 - 1 = 4\text{ ms}$ | $4 - 4 = 0\text{ ms}$ |
| **P3** | 2 ms | 9 ms | 26 ms | $26 - 2 = 24\text{ ms}$ | $24 - 9 = 15\text{ ms}$ |
| **P4** | 3 ms | 5 ms | 10 ms | $10 - 3 = 7\text{ ms}$ | $7 - 5 = 2\text{ ms}$ |

*   **Average Turnaround Time:** $\frac{17 + 4 + 24 + 7}{4} = 13.0\text{ ms}$
*   **Average Waiting Time:** $\frac{9 + 0 + 15 + 2}{4} = 6.5\text{ ms}$

---

## 2. Deadlocks & The Banker's Algorithm

A deadlock is a state where a set of processes are blocked because each process is holding a resource and waiting for another resource held by some other process.

### The 4 Necessary Coffman Conditions
All four must occur simultaneously for a deadlock to exist:
1.  **Mutual Exclusion:** At least one resource must be held in a non-shareable mode (only one process can use it at a time).
2.  **Hold and Wait:** A process must be holding at least one resource and waiting to acquire additional resources that are currently being held by other processes.
3.  **No Preemption:** Resources cannot be preempted; a resource can be released only voluntarily by the process holding it.
4.  **Circular Wait:** A closed chain of processes exists, where each process holds resources needed by the next process in the chain.

---

### Banker's Algorithm Safe State Simulation

The Banker's Algorithm checks if allocating resources will lead to an unsafe state.

#### Input Vectors and Matrices
*   **Total System Resources:** $A = 10, B = 5, C = 7$
*   **Allocation Matrix:**
    ```text
         A  B  C
     P0  0  1  0
     P1  2  0  0
     P2  3  0  2
    ```
    *   $\text{Allocated Total} = A:5, B:1, C:2$
*   **Available Vector:** $A:5, B:4, C:5$ (Total - Allocated Total)
*   **Max Demand Matrix:**
    ```text
         A  B  C
     P0  7  5  3
     P1  3  2  2
     P2  9  0  2
    ```

---

#### Step 1: Compute Need Matrix
$$\text{Need}[i][j] = \text{Max}[i][j] - \text{Allocation}[i][j]$

```text
     Need Matrix:
         A  B  C
     P0  7  4  3
     P1  1  2  2
     P2  6  0  0
```

---

#### Step 2: Safety Verification Sequence
*   **Process P1 Check:**
    *   $\text{Need}(P1) = [1, 2, 2] \le \text{Available} = [5, 4, 5]$ $\rightarrow$ **True**.
    *   Allocate, let P1 complete, and release its resources:
    *   $\text{New Available} = \text{Available} + \text{Allocation}(P1) = [5, 4, 5] + [2, 0, 0] = [7, 4, 5]$.
    *   *Sequence:* `[P1]`

*   **Process P0 Check:**
    *   $\text{Need}(P0) = [7, 4, 3] \le \text{Available} = [7, 4, 5]$ $\rightarrow$ **True**.
    *   Allocate, let P0 complete, and release its resources:
    *   $\text{New Available} = [7, 4, 5] + [0, 1, 0] = [7, 5, 5]$.
    *   *Sequence:* `[P1 -> P0]`

*   **Process P2 Check:**
    *   $\text{Need}(P2) = [6, 0, 0] \le \text{Available} = [7, 5, 5]$ $\rightarrow$ **True**.
    *   Allocate, let P2 complete, and release its resources:
    *   $\text{New Available} = [7, 5, 5] + [3, 0, 2] = [10, 5, 7]$.
    *   *Sequence:* `[P1 -> P0 -> P2]`

*   **Result:** All processes completed. The system is in a **Safe State** with the Safe Sequence: **$\langle P1, P0, P2 \rangle$**.

---

## 3. Memory Management: Paging & Address Translation

Paging is a memory management scheme that eliminates the need for contiguous allocation of physical memory.

```text
    Logical Address: [ Page Number (p) | Offset (d) ]
                           │
                           ▼
                      [Page Table] ───► Maps Page (p) to Frame (f)
                           │
                           ▼
    Physical Address: [ Frame Number (f) | Offset (d) ]
```

### Mathematical Formulation
*   **Logical Address Space:** $2^L$ bytes (represented by $L$ address bits).
*   **Physical Address Space:** $2^P$ bytes (represented by $P$ address bits).
*   **Page Size (equal to Frame Size):** $2^S$ bytes.
    *   Offset bits ($d$) = $S$ (since we need $S$ bits to address every byte inside a page).
    *   Page bits ($p$) = $L - S$.
    *   Frame bits ($f$) = $P - S$.
*   **Address Translation Formula:**
    $$\text{Physical Address} = (\text{Frame Number} \times \text{Page Size}) + \text{Offset}$$

---

### Translation Lookaside Buffer (TLB) Access Math
A TLB is a high-speed cache for page table lookups.
*   **Formula for Effective Access Time (EAT):**
    $$\text{EAT} = H \times (T_{\text{TLB}} + T_{\text{mem}}) + (1 - H) \times (T_{\text{TLB}} + 2 \times T_{\text{mem}})$$
    *   *Where:* $H = \text{Hit Ratio}$, $T_{\text{TLB}} = \text{TLB Lookup Time}$, $T_{\text{mem}} = \text{Main Memory Access Time}$.
*   **Worked Example:**
    *   Given $H = 90\%$, $T_{\text{TLB}} = 10\text{ ns}$, $T_{\text{mem}} = 100\text{ ns}$:
    *   $\text{EAT} = 0.90 \times (10 + 100) + 0.10 \times (10 + 200) = 0.90(110) + 0.10(210) = 99 + 21 = 120\text{ ns}$.

---

### Comparison: Paging vs. Segmentation

| Metric | Paging | Segmentation |
| :--- | :--- | :--- |
| **Block Size** | Fixed-size blocks (pages/frames). | Variable-size blocks (logical segments). |
| **Developer View** | Completely invisible to developer. | Visible to developer (split into code, data, stack). |
| **Fragmentation** | Suffers from **Internal Fragmentation**. | Suffers from **External Fragmentation**. |
| **Table Used** | Page Table (maps page to frame). | Segment Table (maps segment to base and limit). |

---

## 4. Concurrency: Semaphores & Mutexes

A Semaphore is a variable or abstract data type used to control access to a common resource by multiple processes in a concurrent system.

### Wait and Signal Implementations

```c
// Classic wait (P operation)
void wait(Semaphore S) {
    S.value--;
    if (S.value < 0) {
        // Add this process to S.queue
        // Block process
    }
}

// Classic signal (V operation)
void signal(Semaphore S) {
    S.value++;
    if (S.value <= 0) {
        // Remove process P from S.queue
        // Wakeup process P
    }
}
```

### Mutex vs. Binary Semaphore

| Feature | Mutex | Binary Semaphore |
| :--- | :--- | :--- |
| **Ownership** | Key ownership exists. Only the thread that locked the mutex can unlock it. | No ownership. Any process can signal (release) the semaphore. |
| **Use Case** | Mutual exclusion for critical sections. | Process synchronization and signaling. |
| **Interrupt Safety**| Cannot be unlocked from an ISR (Interrupt Service Routine). | Can be signaled from an ISR. |

---

## 5. Top 15 TCS NQT OS MCQ One-Liners

**Q1.** Which scheduling algorithm is optimal for minimizing average waiting time?
*   **A:** Shortest Job First (SJF).

**Q2.** What is the problem of indefinitely blocking low-priority processes called?
*   **A:** Starvation (resolved using Aging).

**Q3.** What is the state of a process waiting for an I/O device to complete operations?
*   **A:** Blocked or Waiting state.

**Q4.** What memory anomaly occurs when allocating more physical frames leads to more page faults?
*   **A:** Belady's Anomaly (seen in FIFO replacement).

**Q5.** Which page replacement algorithm does not suffer from Belady's Anomaly?
*   **A:** LRU (Least Recently Used) and Optimal replacement (Stack-based algorithms).

**Q6.** What does the Banker's Algorithm ensure?
*   **A:** Deadlock avoidance.

**Q7.** What CPU state transition occurs during a context switch?
*   **A:** User mode to Kernel mode and back to User mode.

**Q8.** What causes a page fault?
*   **A:** Accessing a logical page that is not currently loaded into physical memory (indicated by a 0 or invalid bit in the page table).

**Q9.** What is thrashing?
*   **A:** A state where the system spends more time context-switching and paging than executing actual instructions due to insufficient physical memory.

**Q10.** What is the size of the logical address space if the system uses 32-bit addresses?
*   **A:** $2^{32}$ bytes = 4 GB.

**Q11.** Which system call is used in Unix-like systems to create a new process?
*   **A:** `fork()`.

**Q12.** What does a counting semaphore initialized to 5 represent?
*   **A:** 5 processes can access the resource simultaneously before blocking occurs.

**Q13.** What type of fragmentation is prevented by paging?
*   **A:** External fragmentation.

**Q14.** What is the primary function of the Translation Lookaside Buffer (TLB)?
*   **A:** To cache page-to-frame translations and speed up logical-to-physical address translation.

**Q15.** What happens to the child process when the parent process terminates in Unix, leaving the child running?
*   **A:** The child becomes an **Orphan process** (adopted by the `init` process).

---

## 6. Dissecting TCS NQT OS Trap Questions

### Question 1: Round Robin Time Quantum Behavior
What happens to Round Robin scheduling when the time quantum is set to an extremely large value (e.g., larger than any process burst time)?
*   A) It behaves exactly like Shortest Job First (SJF).
*   B) It behaves exactly like First Come First Served (FCFS).
*   C) It results in deadlock.
*   D) It minimizes context switching overhead but causes starvation.
*   **Correct Answer:** **B**
*   **Trap Explanation:** Students often think a large time quantum optimizes scheduling or behaves like SJF because the CPU finishes processes quickly. However, without preemption forcing a switch, processes will simply run to completion in the order they arrived, which is the definition of FCFS.

### Question 2: Fork Process Counting
How many child processes are created by the execution of the following code block?
```c
fork();
fork();
fork();
```
*   A) 3
*   B) 6
*   C) 7
*   D) 8
*   **Correct Answer:** **C**
*   **Trap Explanation:** The total number of processes created is $2^n$, where $n$ is the number of `fork()` calls. For $n=3$, $2^3 = 8$ total processes. The question asks for **child** processes created. Since 1 is the original parent process, the number of child processes is $2^n - 1 = 8 - 1 = 7$.

### Question 3: Semaphores & Negative Values
If a counting semaphore has a current value of -3, what does this negative number represent?
*   A) The system is in an invalid/corrupted state.
*   B) There are 3 processes blocked in the semaphore queue.
*   C) The resource has 3 available units.
*   D) The next 3 wait operations will succeed.
*   **Correct Answer:** **B**
*   **Trap Explanation:** Students often believe semaphores cannot be negative (confusing them with basic counters). Under standard Dijkstra definition, if `value < 0`, the magnitude of the value represents the exact number of processes currently suspended in the wait queue.

### Question 4: Paging Address Space Mapping
A system has 4 KB pages and a 32-bit logical address space. How many entries are present in the page table of a process?
*   A) $2^{12}$ entries
*   B) $2^{20}$ entries
*   C) $2^{32}$ entries
*   D) 1 Million entries
*   **Correct Answer:** **B**
*   **Trap Explanation:** Page size is $4\text{ KB} = 2^{12}$ bytes, which means the offset is 12 bits. The remaining bits represent the page number: $32 - 12 = 20$ bits. Therefore, the page table must hold $2^{20}$ entries (which is 1,048,576, not exactly 1 Million).

### Question 5: Safe State vs. Deadlock
If the Banker's Algorithm determines that a system is in an "Unsafe State", which statement is true?
*   A) The system is currently deadlocked.
*   B) The system will eventually become deadlocked.
*   C) There is a possibility of deadlock, but it is not guaranteed.
*   D) The system must roll back the last transaction immediately.
*   **Correct Answer:** **C**
*   **Trap Explanation:** An unsafe state is NOT synonymous with deadlock. An unsafe state simply means the operating system cannot guarantee that it can avoid a deadlock if all processes simultaneously request their maximum resource claims. If processes do not request their maximum claims, the system can run without deadlocking.
```
         ┌──────────────────────────────────────────────┐
         │                 UNSAFE STATE                 │
         │   ┌──────────────────────────────────────┐   │
         │   │               DEADLOCK               │   │
         │   └──────────────────────────────────────┘   │
         └──────────────────────────────────────────────┘
```

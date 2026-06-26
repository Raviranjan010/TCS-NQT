# Operating Systems - Expected Questions (TCS NQT)

This file contains expected questions on Operating Systems (OS) for the TCS NQT exam.

---

## 1. OS-01: Process vs Thread

*   **Question**: Distinguish between a Process and a Thread.
*   **Comparison Table**:
| Feature | Process | Thread |
| :--- | :--- | :--- |
| **Definition** | An executing program instance (heavyweight). | A path of execution within a process (lightweight). |
| **Address Space** | Has its own independent address space. | Shares the parent process's address space. |
| **Context Switch** | Expensive (involves memory maps updates). | Cheap (only registers and stack swap). |
| **Communication** | IPC (Inter-Process Comm: pipes, sockets). | Shared memory variables (requires synchronization). |

*   **Trap**: Thread sharing. Threads share code, data, and open files, but maintain their own independent **Program Counter (PC)**, registers, and stack.

---

## 2. OS-02: CPU Scheduling

*   **Question**: Given processes with arrival and burst times, find average waiting time using Round Robin or Shortest Job First (SJF).
*   **Burst Time Table Example**:
| Process | Arrival Time | Burst Time |
| :---: | :---: | :---: |
| P1 | 0 | 6 |
| P2 | 1 | 4 |
| P3 | 2 | 2 |

*   **Worked Example (SJF - Non-preemptive)**:
    1.  At $t = 0$, only P1 is in queue. Run P1. P1 finishes at $t = 6$.
    2.  At $t = 6$, both P2 and P3 have arrived. Burst times are P2: 4, P3: 2.
    3.  Select P3 (shortest burst). P3 runs from $t = 6$ to $8$.
    4.  Select P2. P2 runs from $t = 8$ to $12$.
*   **Waiting Time Calculations**:
    *   $\text{Waiting Time} = \text{Turnaround Time} - \text{Burst Time}$
    *   $\text{Turnaround Time} = \text{Completion Time} - \text{Arrival Time}$
    *   P1: Completion = 6, Turnaround = $6 - 0 = 6$, Waiting = $6 - 6 = 0$.
    *   P3: Completion = 8, Turnaround = $8 - 2 = 6$, Waiting = $6 - 2 = 4$.
    *   P2: Completion = 12, Turnaround = $12 - 1 = 11$, Waiting = $11 - 4 = 7$.
    *   Average Waiting Time $= (0 + 4 + 7) / 3 = 3.67$.

---

## 3. OS-03: Deadlocks & Banker's Algorithm

*   **Question**: What are the four necessary conditions for deadlock? Describe the Banker's Safety Algorithm.
*   **Coffman Conditions**:
    1.  **Mutual Exclusion**: Only one process can use a resource at a time.
    2.  **Hold and Wait**: Process holds allocated resources while waiting for additional ones.
    3.  **No Preemption**: Resources cannot be forcibly taken from a process.
    4.  **Circular Wait**: A closed loop of processes exists where each process holds resources needed by the next.
*   **Banker's Safety Algorithm Check**:
    *   Let $\text{Need} = \text{Max} - \text{Allocation}$.
    *   If $\text{Need} \le \text{Available}$, the process can finish. Upon completion, release its allocated resources: $\text{Available} = \text{Available} + \text{Allocation}$.
    *   If all processes can be scheduled in some sequence, the state is **Safe**.

---

## 4. OS-04: LRU Page Replacement

*   **Question**: Given a reference string and $3$ page frames, calculate the number of page faults using Least Recently Used (LRU) algorithm.
*   **Worked Example**: Reference string: `1, 3, 0, 3, 5, 6`, frames = 3.

| Step | Page | Frames State | Hit / Fault | Victim Evicted |
| :---: | :---: | :---: | :---: | :--- |
| 1 | 1 | `[1]` | Fault | — |
| 2 | 3 | `[1, 3]` | Fault | — |
| 3 | 0 | `[1, 3, 0]` | Fault | — |
| 4 | 3 | `[1, 3, 0]` | **Hit** | — |
| 5 | 5 | `[5, 3, 0]` | Fault | `1` (least recently used among 1, 3, 0) |
| 6 | 6 | `[5, 3, 6]` | Fault | `0` (least recently used among 5, 3, 0) |

Total Page Faults $= 5$.

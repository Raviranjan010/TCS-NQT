# Time and Work - Interview Questions

**Q1.** How do you model a "producer-consumer" pipeline using Pipes & Cisterns concepts?
*   **Answer:** Inlets act as producer threads adding items to a queue (capacity), while outlets act as consumer threads removing items. The net growth rate is $\text{Rate}_{producer} - \text{Rate}_{consumer}$. If consumer rate exceeds producer rate, the queue eventually empties.

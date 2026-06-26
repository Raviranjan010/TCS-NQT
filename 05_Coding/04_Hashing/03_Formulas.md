# Hashing Techniques - Formulas & Derivations

This guide details the mathematical foundations of hash tables, including load factors, lookup complexity under collisions, and collision probabilities.

---

## 1. 📐 Load Factor ($\alpha$)

### Formula
$$\alpha = \frac{n}{m}$$
*   **$n$**: Number of keys currently stored in the hash table.
*   **$m$**: Total number of slots (buckets) in the hash table.

### Derivation
By definition, the load factor $\alpha$ represents the average number of elements stored in each slot of the hash table. If the hash function distributes keys uniformly across all $m$ slots, the expected length of each chain (in chaining) is exactly $\alpha$.

### Immediate Worked Example
*   **Scenario**: A hash table contains $n = 150$ elements, and has $m = 200$ slots.
*   **Calculation**:
    $$\alpha = \frac{150}{200} = 0.75$$
*   **Insight**: On average, each bucket contains $0.75$ elements. For chaining, the average lookup requires traversing $1 + \alpha = 1.75$ nodes.

---

## 2. 📐 Expected Probes in Open Addressing (Linear Probing)

Under Uniform Hashing, as the table fills up ($\alpha \to 1$), elements form clusters, which increases the number of probes needed to find an element or an empty slot.

### Formulas
*   **Successful Search / Retrieval**:
    $$S(\alpha) \approx \frac{1}{2} \left(1 + \frac{1}{1 - \alpha}\right)$$
*   **Unsuccessful Search / Insertion**:
    $$U(\alpha) \approx \frac{1}{2} \left(1 + \frac{1}{(1 - \alpha)^2}\right)$$

### Derivation (Intuition)
In linear probing, search probes continue until the target element is found (successful) or an empty slot is encountered (unsuccessful). Due to primary clustering, the probability of hitting a cluster of size $k$ is proportional to $k$. Knuth (1962) derived that the expected probe sequence length depends on the variance of cluster sizes, leading to the quadratic term $(1-\alpha)^2$ in the denominator for unsuccessful searches.

### Immediate Worked Example
*   **Scenario**: A hash table using linear probing is $\alpha = 0.60$ (60% full).
*   **Successful Search probes**:
    $$S(0.60) = \frac{1}{2} \left(1 + \frac{1}{1 - 0.60}\right) = \frac{1}{2} \left(1 + 2.5\right) = 1.75 \text{ probes}$$
*   **Unsuccessful Search / Insertion probes**:
    $$U(0.60) = \frac{1}{2} \left(1 + \frac{1}{(1 - 0.60)^2}\right) = \frac{1}{2} \left(1 + \frac{1}{0.16}\right) = \frac{1}{2} \left(1 + 6.25\right) = 3.625 \text{ probes}$$

---

## 3. 📐 Hash Collision Probability (The Birthday Paradox)

### Formula
$$P(\text{collision}) \approx 1 - e^{-\frac{n^2}{2m}}$$

### Step-by-Step Derivation
We want to find the probability of at least one collision, $P(\text{collision})$, when inserting $n$ keys into a table of size $m$. Let us first find the probability of no collisions, $P(\text{no collision})$:
1. The first key can choose any slot: $\frac{m}{m}$.
2. The second key must choose a different slot: $\frac{m-1}{m}$.
3. The $i$-th key must choose a slot not taken by the first $i-1$ keys: $\frac{m - (i - 1)}{m}$.

Multiplying these independent probabilities:
$$P(\text{no collision}) = \prod_{i=0}^{n-1} \left(1 - \frac{i}{m}\right)$$

Using the Taylor series expansion $e^{-x} = 1 - x + \frac{x^2}{2!} - \dots \approx 1 - x$ (valid for small $x$):
$$1 - \frac{i}{m} \approx e^{-\frac{i}{m}}$$

Substituting this back into the product:
$$P(\text{no collision}) \approx \prod_{i=0}^{n-1} e^{-\frac{i}{m}} = e^{-\sum_{i=0}^{n-1} \frac{i}{m}} = e^{-\frac{n(n-1)}{2m}} \approx e^{-\frac{n^2}{2m}}$$

Therefore:
$$P(\text{collision}) = 1 - P(\text{no collision}) \approx 1 - e^{-\frac{n^2}{2m}}$$

### Immediate Worked Example
*   **Scenario**: We insert $n = 20$ elements into a hash table of size $m = 1000$.
*   **Calculation**:
    $$P(\text{collision}) \approx 1 - e^{-\frac{20^2}{2 \times 1000}} = 1 - e^{-\frac{400}{2000}} = 1 - e^{-0.2}$$
    Since $e^{-0.2} \approx 0.8187$:
    $$P(\text{collision}) \approx 1 - 0.8187 = 0.1813 \text{ or } 18.13\%$$
*   **Exact Value**: $\prod_{i=0}^{19} \left(1 - \frac{i}{1000}\right) \approx 0.824 \implies 17.6\%$. The exponential approximation is highly accurate.

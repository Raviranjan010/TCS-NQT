# Coding — Section Cheatsheet

## Arrays
| Rule | Detail |
|------|--------|
| Kadane's init | `nums[0]`, NOT 0 |
| Prefix long | Use `long long` if sum can exceed 2×10⁹ |
| Sign marking | Always `std::abs(num)-1` |
| Dutch flag | `mid` does NOT advance when case==2 |
| Rotation | `k = k % n` first |
| Subarray=k | Count BEFORE put |

## Strings
| c=='{' || c=='[') st.push(c);
  else {
    if(st.empty()) return false;
    if(c==')' && st.top()!='(') return false;
    if(c=='}' && st.top()!='{') return false;
    if(c==']' && st.top()!='[') return false;
    st.pop();
  }
}

## HashMap
| Rule | Detail |
|------|--------|
| Bracket Check | Do NOT check key using `if(map[key])` -> inserts key. Use `count()`. |
| Custom Keys | Do NOT use `pair` as key in `std::unordered_map` -> compilation error. Use `std::map`. |
| Subarray Base | Always seed prefix sum maps with `[0]=1` or `[0]=-1` before loops. |
| Duplicate Set | Set insertion returns `{iterator, success_bool}`. |
| Map Iteration | Iterate using `for(const auto& pair : map)` -> `.first` is key, `.second` is value. |


## Searching
| Rule | Exact | Bound/Peak |
|------|-------|-----------|
| hi init | `n-1` | `n` (bound) or `n-1` (peak) |
| loop | `lo<=hi` | `lo<hi` |
| on match (bounds) | return | `hi=mid` or `lo=mid+1` |
| mid formula | `lo+(hi-lo)/2` always | same |


## Sorting
| Algorithm | Worst Time | Space | Stable |
|-----------|------------|-------|--------|
| Bubble | O(n²) | O(1) | Yes |
| Selection | O(n²) | O(1) | No |
| Insertion | O(n²) | O(1) | Yes |
| Merge | O(n log n) | O(n) | Yes |
| Quick | O(n²) | O(log n) | No |
| Heap | O(n log n) | O(1) | No |
| std::sort | O(n log n) | O(log n) | No |
| std::stable_sort | O(n log n) | O(n) | Yes |
```


## Math
| Formula / Concept | Code / Math expression | Complexity |
|-------------------|------------------------|------------|
| GCD(a, b) | `gcd(a, b)` | $O(\log(\min(a,b)))$ |
| Prime Check | Loop up to $\sqrt{N}$ | $O(\sqrt{N})$ |
| Exponentiation | Binary Exponentiation | $O(\log N)$ |
| Trailing Zeros | $\sum \lfloor n/5^k \rfloor$ | $O(\log_5 N)$ |
| Missing Number | Sum formula difference | $O(N)$ time, $O(1)$ space |
| Armstrong Check | Digits power sum | $O(\log_{10} N)$ |
| digital root | `1 + (n - 1) % 9` | $O(1)$ |


## Recursion
| Algorithm | Recurrence relation | Time Complexity | Space Complexity |
|-----------|---------------------|-----------------|------------------|
| Factorial | $T(N) = T(N-1) + O(1)$ | $O(N)$ | $O(N)$ (stack) |
| Fibonacci | $T(N) = T(N-1) + T(N-2)$ | $O(2^N)$ | $O(N)$ (stack) |
| Hanoi | $T(N) = 2T(N-1) + O(1)$ | $O(2^N)$ | $O(N)$ (stack) |
| Digit Sum | $T(N) = T(N/10) + O(1)$ | $O(\log_{10} N)$ | $O(\log_{10} N)$ |


## Easy DP
- **Always verify base cases:** `n = 0`, `n = 1` are common crash points.
- **Modulo additions:** Remember `(a + b) % MOD` for large numbers.
- **Space Optimization:** If transition only depends on a fixed window of past steps, optimize the table into variables.

## Stack & Queue
| Container | Operation | Method | Complexity |
|-----------|-----------|--------|------------|
| `std::stack` | Push | `push(x)` | $O(1)$ |
| `std::stack` | Pop | `pop()` | $O(1)$ |
| `std::stack` | Peek | `top()` | $O(1)$ |
| `std::queue` | Enqueue | `push(x)` | $O(1)$ |
| `std::queue` | Dequeue | `pop()` | $O(1)$ |
| `std::queue` | Front | `front()` | $O(1)$ |

## Linked List
| Operation | C++ Code | Complexity |
|-----------|----------|------------|
| Traversal | `curr = curr->next;` | $O(N)$ |
| Reverse List | 3-pointers swap | $O(N)$ time, $O(1)$ space |
| Middle Node | slow/fast pointers | $O(N)$ time, $O(1)$ space |
| Detect Cycle | slow/fast pointers meeting | $O(N)$ time, $O(1)$ space |
| Delete Node | `prev->next = curr->next; delete curr;` | $O(1)$ (with references) |

## Matrix
| Rotation | Steps |
|----------|-------|
| 90 degrees Clockwise | Transpose, then Reverse Rows |
| 90 degrees Counter-Clockwise | Transpose, then Reverse Columns |
| 180 degrees | Reverse Rows, then Reverse Columns |



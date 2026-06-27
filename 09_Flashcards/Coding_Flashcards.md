Q: What is the time complexity of Kadane's algorithm?
A: O(n) time, O(1) space — single pass, constant extra memory.

Q: What is the bug if you initialize `maxSum = 0` in Kadane's and all elements are negative?
A: You return 0 instead of the correct (least-negative) answer. Always initialize with `nums[0]`.

Q: For prefix sum array `pre[]` where `pre[i+1] = pre[i] + nums[i]`, what formula gives the sum of elements from index l to r (0-indexed, inclusive)?
A: `pre[r+1] - pre[l]`

Q: In a sliding window of fixed size k, what single expression updates the window sum when the window moves one step right?
A: `windowSum += nums[i] - nums[i - k]`  (add new right element, remove old left element)

Q: What is the core idea of Boyer-Moore Voting Algorithm?
A: Maintain a candidate and a counter. Increment for a match, decrement for a non-match. When counter hits 0, switch candidate. The majority element (>n/2) always survives.

Q: What must you do BEFORE rotating an array by k positions to handle k ≥ n?
A: Compute `k = k % n`. This is mandatory to prevent out-of-bounds and to avoid no-op rotations.

Q: Why does the Dutch National Flag algorithm NOT increment `mid` when `nums[mid] == 2`?
A: Because the element swapped from position `high` to `mid` has not been examined yet — it could be 0, 1, or 2 and needs to be processed in the next iteration.

Q: What data type should you use for prefix sums in C++ when array values can be up to 10⁹ and n can be up to 10⁵?
A: `long long` — since 10⁹ × 10⁵ = 10¹⁴, which far exceeds `INT_MAX` (~2.14×10⁹).

Q: In the in-place sign-marking technique to find disappeared numbers, why must you use `std::abs(num)` when computing the index?
A: Because previously-visited elements may have been negated. Without `std::abs`, the negative value would give an incorrect (or negative) array index causing out-of-bounds/segmentation fault.

Q: For "Product of Array Except Self", why can't you use the total product divided by each element?
A: Division fails when any element is 0 (division by zero). The left-pass × right-pass method avoids division entirely and handles zeros correctly.

Q: What is the time complexity of `s = s + c;` inside a loop of size N in C++?
A: O(N²) — because the addition operator creates a copy of the entire string each time. Use `s += c;` for O(N).

Q: Why should we pass strings by reference (e.g. `const std::string&`) in function calls?
A: Passing by value copies the entire string in memory taking O(N) time and space. Passing by reference is O(1) time.

Q: In C++, what does the second parameter of `s.substr(pos, len)` represent?
A: It represents the **length** of the substring, not the end position index.

Q: What does `s.find("target")` return if the string `"target"` is not present?
A: It returns `std::string::npos`.

Q: How do you convert a digit character `'5'` to its integer value `5` in C++?
A: Subtract the char `'0'`: `int val = c - '0';`.

Q: How do you count binary substrings with equal consecutive 0s and 1s?
A: Count consecutive block sizes, then sum the minimum of adjacent block counts (e.g., `sum(min(blocks[i], blocks[i-1]))`).

Q: What data structure is used to validate balanced brackets like `{[()]}`?
A: A Stack (`std::stack<char>`).

Q: Why does using signed char as array index (`count[s[i]]`) sometimes crash programs in C++?
A: Extended ASCII chars can evaluate to negative numbers, resulting in negative array indexing (segmentation fault). Cast index to `(unsigned char)s[i]`.

Q: What is the average time complexity of `std::stoi`?
A: O(L) where L is the length of the string.

Q: How does sliding window find the longest unique substring?
A: Maintain two pointers `left` and `right`. Track the last seen index of each char. If `s[right]` was seen inside the window, shift `left` to index after last seen.

Q: What is the average and worst-case lookup complexity of `std::unordered_map`?
A: Average: O(1). Worst-case: O(N) (happens when all elements collide into the same hash bucket).

Q: Why does `std::unordered_map<std::pair<int, int>, int>` fail to compile?
A: C++ standard library does not provide a default hash function for `std::pair`. Use `std::map` instead, which only requires the `<` operator.

Q: What is the side effect of checking key presence using `if (map[key] == 0)`?
A: It implicitly inserts `key` with a default value of 0 into the map if it was absent, consuming extra memory.

Q: What does the `second` boolean value returned by `set.insert(x)` represent?
A: It evaluates to `true` if `x` was successfully inserted (did not exist in the set), and `false` if `x` was already present.

Q: Why do we seed the prefix sum map with `[0] = 1` before solving the Subarray Sum = K problem?
A: To detect subarrays starting at index 0 whose sum is exactly equal to K (e.g. prefixSum − K = 0).

Q: In the "longest subarray sum equals K" pattern, why do we only insert prefix sums if they are not already present in the map?
A: To preserve the leftmost index of the prefix sum, which maximizes the calculated subarray length `i - leftmostIndex`.

Q: What is the underlying data structure of C++ `std::map`?
A: A self-balancing Binary Search Tree (specifically, a Red-Black Tree).

Q: How do you sort a map by its values?
A: Copy map elements into a `std::vector<std::pair<Key, Value>>` and sort the vector using a custom comparator.

Q: What is the worst-case space complexity of a Hash Map containing N elements?
A: O(N) — since it stores N key-value pairs.

Q: How do you find the first non-repeating element in an array in O(N) time?
A: Build a frequency map of elements, then traverse the array from left to right, returning the first element whose frequency in the map is 1.

Q: What is the safe mid formula in binary search?
A: `mid = lo + (hi - lo) / 2` — prevents integer overflow when lo and hi are both large.

Q: For exact-match binary search, what loop condition and hi initialization are correct?
A: `while (lo <= hi)`, `hi = n - 1` (closed interval on both ends).

Q: For lower bound (first i where arr[i] ≥ x), what loop condition and hi initialization are correct?
A: `while (lo < hi)`, `hi = n` (answer can be n if all elements < x).

Q: How do you find the count of element x in a sorted array using binary search?
A: `count = upperBound(arr, x) - lowerBound(arr, x)`. This is O(2 log n) = O(log n).

Q: In `findPeakElement`, when `nums[mid] < nums[mid+1]`, where is the peak?
A: In the right half (including mid+1). Set `lo = mid + 1`.

Q: What is the maximum number of API calls made by First Bad Version binary search for n=10?
A: ⌈log₂(10)⌉ = 4 calls.

Q: In the answer-space binary search template, when `feasible(mid)` returns true, do you set `hi = mid` or `hi = mid - 1`?
A: `hi = mid` — mid itself could be the answer; we must not exclude it.

Q: What do `std::lower_bound` and `std::upper_bound` return in C++?
A: They return iterators. To convert to a 0-based integer index, subtract the beginning iterator: `it - arr.begin()`.

Q: What is the difference between linear search and sentinel linear search?
A: Sentinel eliminates the `i < n` boundary check by placing a copy of target at arr[n]. Reduces number of comparisons per iteration from 2 to 1.

Q: Why does binary search on a rotated sorted array still work in O(log n)?
A: At each mid, one half is always sorted. We can determine in O(1) whether the target is in the sorted half. Eliminating one half per step maintains O(log n).

Q: What algorithm does C++ `std::sort` use?
A: It uses IntroSort — a hybrid algorithm of QuickSort, HeapSort, and InsertionSort. It guarantees O(N log N) worst-case time complexity.

Q: Why does a custom comparator using `<=` crash `std::sort`?
A: It violates the strict weak ordering requirement. When elements are equal, both `a <= b` and `b <= a` return true, causing `std::sort` to loop infinitely or access out-of-bounds memory. Always use `<` or `>`.

Q: What is the worst-case space complexity of Merge Sort?
A: O(N) — because it requires an auxiliary array of size N to merge sorted subarrays.

Q: In what scenario is Insertion Sort highly efficient?
A: When the array is already sorted or nearly sorted. It runs in O(N) time under this condition.

Q: What is the difference between stable and unstable sorting?
A: Stable sorting preserves the relative order of equal elements. Unstable sorting may rearrange them.

Q: How can we find the Kth largest element in O(N) average time without sorting?
A: Use `std::nth_element` (QuickSelect) in C++.

Q: What is the minimum number of swaps required to sort an array of N distinct elements in the worst case?
A: It can be calculated using graph cycles. If cycle sizes are `c_1, c_2, ...`, the minimum swaps is `sum(c_i - 1)`.

Q: When should you use `std::stable_sort` instead of `std::sort`?
A: When you need to preserve the relative order of equal elements (e.g. sorting by last name, then sorting by department).

Q: In the Dutch National Flag algorithm, why is `mid` NOT incremented when `nums[mid] == 2`?
A: The element swapped from `high` to `mid` is unexamined. We must evaluate it in the next loop iteration.

Q: What is the time complexity of Counting Sort?
A: O(N + K) where N is the number of elements and K is the range of values.

Q: What is the time complexity of the standard Euclidean algorithm for GCD?
A: $O(\log(\min(a, b)))$.

Q: How to calculate LCM from GCD?
A: $\text{LCM}(a, b) = \frac{a \times b}{\text{GCD}(a, b)}$.

Q: What is the digital root of 987?
A: $9 + 8 + 7 = 24 \rightarrow 2 + 4 = 6$.

Q: Is 1 considered a prime number?
A: No, prime numbers must be strictly greater than 1.

Q: How many prime factors can a composite number $N$ have at most that are greater than $\sqrt{N}$?
A: At most 1.

Q: What is the number of trailing zeros in $100!$?
A: $\lfloor 100/5 \rfloor + \lfloor 100/25 \rfloor = 20 + 4 = 24$.

Q: Is 28 a perfect number?
A: Yes ($1 + 2 + 4 + 7 + 14 = 28$).

Q: What bitwise check checks if $N$ is odd?
A: `(n & 1) != 0`.

Q: How many digits does $N$ have?
A: $\lfloor \log_{10} N \rfloor + 1$.

Q: What is the complexity of binary exponentiation?
A: $O(\log N)$.

Q: The Sieve of Eratosthenes algorithm has a time complexity of $O(N \log N)$.
A: False (It is $O(N \log \log N)$).

Q: Every Armstrong number must be a 3-digit number.
A: False (e.g. 1634 is a 4-digit Armstrong number).

Q: The modulo operator `%` in C++ returns positive values even for negative numerators.
A: False (e.g. `-5 % 3` returns `-2`).

Q: If $(n \& (n - 1)) == 0$ is true for $n > 0$, then $n$ is a power of 2.
A: True.

Q: What happens if a recursive function lacks a base case?
A: It results in infinite recursion and causes a stack overflow error.

Q: What is the space complexity of a recursive call stack of depth $H$?
A: $O(H)$ due to activation records stored on stack.

Q: What is the count of moves to solve Tower of Hanoi with 4 disks?
A: $2^4 - 1 = 15$ moves.

Q: Can recursion always be converted to iteration?
A: Yes, using an explicit stack data structure to mimic call stack frames.

Q: What is tail recursion?
A: A recursive call that is the very last instruction executed in the function.

Q: What is the time complexity of the recursive Fibonacci function?
A: $O(2^N)$.

Q: What is Binet's Formula used for?
A: To compute the $N$-th Fibonacci term in closed form.

Q: Why does plain recursion fail for large inputs in problems with overlapping subproblems?
A: Because it recalculates duplicate states repeatedly, causing exponential time complexity.

Q: How many parameters are needed to implement a recursive range print?
A: Two (typically `start` and `end`).

Q: What is backtracking?
A: A recursive search technique that reverts choice changes if they do not lead to a valid solution.

Q: A recursive function can only make one self-call within its body.
A: False (e.g. `fib(n-1) + fib(n-2)` makes two calls).

Q: The recursive sum of digits has logarithmic time complexity.
A: True ($O(\log_{10} N)$).

Q: In the Tower of Hanoi, a larger disk can be placed on top of a smaller one.
A: False.

Q: Tail recursion is generally more space-efficient if the compiler optimizes it.
A: True.

Q: What are the two key properties required to apply Dynamic Programming?
A: Overlapping subproblems and optimal substructure.

Q: What is the space complexity of bottom-up Fibonacci when optimized with variables?
A: $O(1)$.

Q: In the House Robber problem, what is the state transition formula?
A: `dp[i] = max(dp[i-1], dp[i-2] + nums[i])`.

Q: What does -1 typically represent in a memoization table?
A: An uncomputed/unvisited state.

Q: How does bottom-up tabulation build solutions?
A: Iteratively, starting from base cases and building up to the target.

Q: What is the time complexity of the space-optimized Climbing Stairs solution?
A: $O(N)$.

Q: Which DP approach is also known as Top-Down?
A: Memoization.

Q: What is the transition formula for Tribonacci?
A: `dp[i] = dp[i-1] + dp[i-2] + dp[i-3]`.

Q: Why is recursion slower than DP for overlapping subproblems?
A: Recursion recalculates overlapping states repeatedly, resulting in exponential runtime.

Q: In a 2D Unique Paths grid, what is the value of `dp[i][j]`?
A: `dp[i-1][j] + dp[i][j-1]`.

Q: Memoization is a bottom-up approach.
A: False (It is top-down).

Q: Tabulation uses loops rather than recursion.
A: True.

Q: If a problem lacks optimal substructure, we can still solve it with DP.
A: False.

Q: Every recursive solution can be optimized to $O(1)$ space using variables.
A: False (only if the transition has a fixed history window).

Q: Which structure is suited to check balanced parentheses?
A: Stack.

Q: What does LIFO stand for?
A: Last In First Out.

Q: What is the amortized cost of popping from a Queue implemented using Stacks?
A: $O(1)$ (because each element is moved at most once between the stacks).

Q: Which structure is typically used to implement BFS?
A: Queue.

Q: How does a double-ended queue (deque) differ from a standard queue?
A: A deque supports $O(1)$ insertions and deletions at both ends.

Q: What is the value of `st.top()` when the stack is empty in C++?
A: Undefined behavior (segmentation fault).

Q: What is a monotonic stack?
A: A stack that maintains its elements in sorted order (increasing or decreasing).

Q: In Unix path simplification, what does `..` represent?
A: Moving up one level (pop from directory stack).

Q: What is print spooling an example of?
A: FIFO queue scheduling.

Q: What is the time complexity of reversing a queue recursively?
A: $O(N)$.

Q: A queue allows random access to elements using indices.
A: False.

Q: Standard BFS requires a stack.
A: False (It requires a queue).

Q: Pushing onto a stack takes $O(N)$ time.
A: False ($O(1)$).

Q: An expression in Postfix form does not require parentheses to show order of evaluation.
A: True.

Q: Can we access elements of a singly linked list in $O(1)$ time by index?
A: No, it requires $O(N)$ sequential traversal.

Q: What does Floyd's Tortoise and Hare algorithm detect?
A: Cycles in a linked list.

Q: If a list has a cycle, will the fast pointer bypass the slow pointer without meeting it?
A: No, they are guaranteed to meet inside the cycle loop.

Q: How many pointer adjustments are needed to insert a node in a singly linked list?
A: Two.

Q: What is the advantage of using a dummy node?
A: It simplifies boundary checks at the head of the list.

Q: In a doubly linked list, what member variable pointers does each node contain?
A: `next` and `prev`.

Q: What is the time complexity of merging two sorted linked lists?
A: $O(N_1 + N_2)$.

Q: What is the space complexity of reversing a linked list iteratively?
A: $O(1)$.

Q: How do you find the node where a cycle begins?
A: Reset the slow pointer to head after detection and advance both slow and fast pointers 1 step at a time until they meet.

Q: Why must we call `delete` in C++ when removing nodes?
A: To prevent heap memory leaks.

Q: A singly linked list can be traversed in both directions.
A: False (only forward).

Q: Finding the length of a linked list requires $O(N)$ time.
A: True.

Q: Inserting a node at the head of a list is an $O(N)$ operation.
A: False ($O(1)$).

Q: Floyd's Cycle detection runs in $O(N)$ time and $O(1)$ space.
A: True.

Q: What is the flat index of `mat[2][3]` in a $5 \times 6$ matrix?
A: $2 \times 6 + 3 = 15$.

Q: What does transposing a matrix do?
A: Swaps row indices with column indices ($A[i][j] \rightarrow A[j][i]$).

Q: What is the complexity of rotating an $N \times N$ matrix in-place?
A: Time $O(N^2)$ and Space $O(1)$.

Q: How do you rotate a matrix by 90 degrees counter-clockwise?
A: Transpose the matrix, then reverse each column.

Q: What is the number of diagonals in an $M \times N$ matrix?
A: $M + N - 1$.

Q: Where does staircase search start in a row/column-wise sorted matrix?
A: Top-right or bottom-left corner.

Q: Which traversal direction is faster: row-wise or column-wise?
A: Row-wise, due to C++ storing matrices in row-major order (cache locality).

Q: What represents the trace of a square matrix?
A: The sum of elements on the main diagonal.

Q: How do you declare a $4 \times 5$ vector of integers initialized to 0?
A: `std::vector<std::vector<int>> mat(4, std::vector<int>(5, 0));`

Q: Is in-place matrix transposition possible for non-square matrices?
A: No, it requires changing the dimensions.

Q: A Toeplitz matrix has identical elements along each descending diagonal.
A: True.

Q: Binary search on a 2D matrix requires copying the elements to a 1D array first.
A: False (index arithmetic does this virtually).

Q: Row-wise sum requires $O(M \times N)$ time.
A: True.

Q: Rotating a matrix by 180 degrees is equivalent to reversing its rows and then reversing its columns.
A: True.

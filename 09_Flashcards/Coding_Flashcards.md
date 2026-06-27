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

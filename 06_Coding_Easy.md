# TCS NQT 2026 — Easy Coding Section
**Prep Focus: Arrays, Strings, & Math (1 Question, 35 Minutes)**

This section requires writing a complete program that compiles and passes all test cases (2 public + 5 private). You **must** read inputs from standard input and write outputs to standard output. 

> [!IMPORTANT]
> **TCS Compiler Rule**: You must click `"Compile Code"` AND `"Save Code"` (or `"Submit Code"`). If you do not click Save/Submit, your code will not be evaluated and you will get 0 marks.

---

## 📘 Top 6 Solved PYQs (Python 3.8 & C++ 4.9.2)

### 1. Second Smallest and Second Largest in an Array
* **Problem**: Given an array of integers, find the second smallest and second largest elements.
* **Complexity**: Time $O(N)$, Space $O(1)$.
* **Edge Case**: If the array size is less than 2, print `-1`.

#### 🐍 Python 3.8 Solution
```python
import sys

def get_elements(arr):
    n = len(arr)
    if n < 2:
        return -1, -1
    
    # Initialize variables
    smallest = float('inf')
    second_smallest = float('inf')
    largest = float('-inf')
    second_largest = float('-inf')
    
    for x in arr:
        # Find second smallest
        if x < smallest:
            second_smallest = smallest
            smallest = x
        elif x < second_smallest and x != smallest:
            second_smallest = x
            
        # Find second largest
        if x > largest:
            second_largest = largest
            largest = x
        elif x > second_largest and x != largest:
            second_largest = x
            
    return second_smallest, second_largest

def main():
    try:
        input_data = sys.stdin.read().split()
        if not input_data:
            return
        # First number is size, next are elements
        n = int(input_data[0])
        arr = [int(x) for x in input_data[1:n+1]]
        
        sec_small, sec_large = get_elements(arr)
        if sec_small == -1:
            print("-1")
        else:
            print(f"Second Smallest: {sec_small}")
            print(f"Second Largest: {sec_large}")
    except Exception as e:
        print("-1")

if __name__ == "__main__":
    main()
```

#### 💻 C++ 4.9.2 Solution
```cpp
#include <iostream>
#include <vector>
#include <climits>

using namespace std;

void getElements(vector<int>& arr) {
    int n = arr.size();
    if (n < 2) {
        cout << -1 << endl;
        return;
    }
    
    int smallest = INT_MAX;
    int second_smallest = INT_MAX;
    int largest = INT_MIN;
    int second_largest = INT_MIN;
    
    for (int i = 0; i < n; i++) {
        if (arr[i] < smallest) {
            second_smallest = smallest;
            smallest = arr[i];
        } else if (arr[i] < second_smallest && arr[i] != smallest) {
            second_smallest = arr[i];
        }
        
        if (arr[i] > largest) {
            second_largest = largest;
            largest = arr[i];
        } else if (arr[i] > second_largest && arr[i] != largest) {
            second_largest = arr[i];
        }
    }
    
    if (second_smallest == INT_MAX || second_largest == INT_MIN) {
        cout << -1 << endl;
    } else {
        cout << "Second Smallest: " << second_smallest << endl;
        cout << "Second Largest: " << second_largest << endl;
    }
}

int main() {
    int n;
    if (!(cin >> n)) return 0;
    vector<int> arr(n);
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }
    getElements(arr);
    return 0;
}
```

---

### 2. Rotate Array Left/Right by K Positions
* **Problem**: Rotate an array of $N$ integers by $K$ steps to the right.
* **Complexity**: Time $O(N)$, Space $O(1)$.

#### 🐍 Python 3.8 Solution
```python
import sys

def reverse(arr, start, end):
    while start < end:
        arr[start], arr[end] = arr[end], arr[start]
        start += 1
        end -= 1

def rotate_right(arr, k):
    n = len(arr)
    if n == 0:
        return
    k = k % n
    # Reverse whole array, then reverse first k, then remaining n-k
    reverse(arr, 0, n - 1)
    reverse(arr, 0, k - 1)
    reverse(arr, k, n - 1)

def main():
    input_data = sys.stdin.read().split()
    if not input_data:
        return
    n = int(input_data[0])
    k = int(input_data[1])
    arr = [int(x) for x in input_data[2:n+2]]
    
    rotate_right(arr, k)
    print(*(arr))

if __name__ == "__main__":
    main()
```

#### 💻 C++ 4.9.2 Solution
```cpp
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void reverseArray(vector<int>& arr, int start, int end) {
    while (start < end) {
        swap(arr[start], arr[end]);
        start++;
        end--;
    }
}

int main() {
    int n, k;
    if (!(cin >> n >> k)) return 0;
    vector<int> arr(n);
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }
    
    k = k % n;
    reverseArray(arr, 0, n - 1);
    reverseArray(arr, 0, k - 1);
    reverseArray(arr, k, n - 1);
    
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
    return 0;
}
```

---

### 3. Check for Anagram Strings
* **Problem**: Check if two strings $S_1$ and $S_2$ are anagrams.
* **Complexity**: Time $O(N)$, Space $O(1)$ (using 26-element array).

#### 🐍 Python 3.8 Solution
```python
import sys

def is_anagram(s1, s2):
    # Remove spaces and convert to lowercase
    s1 = s1.replace(" ", "").lower()
    s2 = s2.replace(" ", "").lower()
    
    if len(s1) != len(s2):
        return False
    
    count = [0] * 26
    for char in s1:
        count[ord(char) - ord('a')] += 1
    for char in s2:
        count[ord(char) - ord('a')] -= 1
        
    for val in count:
        if val != 0:
            return False
    return True

def main():
    lines = sys.stdin.read().splitlines()
    if len(lines) < 2:
        return
    s1 = lines[0]
    s2 = lines[1]
    print("true" if is_anagram(s1, s2) else "false")

if __name__ == "__main__":
    main()
```

---

### 4. Armstrong Number Check
* **Problem**: Determine if a number is an Armstrong number (an $n$-digit number equal to sum of $n$-th powers of its digits).
* *Example*: $153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153$.

#### 🐍 Python 3.8 Solution
```python
import sys

def is_armstrong(num):
    s = str(num)
    n = len(s)
    sum_pow = sum(int(digit) ** n for digit in s)
    return sum_pow == num

def main():
    input_data = sys.stdin.read().split()
    if not input_data:
        return
    num = int(input_data[0])
    print("true" if is_armstrong(num) else "false")

if __name__ == "__main__":
    main()
```

#### 💻 C++ 4.9.2 Solution
```cpp
#include <iostream>
#include <cmath>
#include <string>

using namespace std;

bool isArmstrong(int num) {
    string s = to_string(num);
    int n = s.length();
    int temp = num;
    int sum = 0;
    while (temp > 0) {
        int digit = temp % 10;
        sum += pow(digit, n);
        temp /= 10;
    }
    return sum == num;
}

int main() {
    int num;
    if (cin >> num) {
        if (isArmstrong(num)) {
            cout << "true" << endl;
        } else {
            cout << "false" << endl;
        }
    }
    return 0;
}
```

---

### 5. Strong Number Check
* **Problem**: Check if a number is a Strong number (sum of factorials of digits equals the number).
* *Example*: $145 = 1! + 4! + 5! = 1 + 24 + 120 = 145$.

#### 🐍 Python 3.8 Solution
```python
import sys

# Precompute factorials for 0-9
FACT = [1] * 10
for i in range(1, 10):
    FACT[i] = FACT[i-1] * i

def is_strong(num):
    temp = num
    total = 0
    while temp > 0:
        digit = temp % 10
        total += FACT[digit]
        temp //= 10
    return total == num

def main():
    input_data = sys.stdin.read().split()
    if not input_data:
        return
    num = int(input_data[0])
    print("true" if is_strong(num) else "false")

if __name__ == "__main__":
    main()
```

---

### 6. Equilibrium Index of an Array
* **Problem**: Find the index where sum of elements to the left is equal to sum of elements to the right. Return first index if multiple exist, else `-1`.
* **Complexity**: Time $O(N)$, Space $O(1)$.

#### 🐍 Python 3.8 Solution
```python
import sys

def find_equilibrium(arr):
    total_sum = sum(arr)
    left_sum = 0
    for idx, val in enumerate(arr):
        # right_sum is total_sum - left_sum - val
        if left_sum == (total_sum - left_sum - val):
            return idx
        left_sum += val
    return -1

def main():
    input_data = sys.stdin.read().split()
    if not input_data:
        return
    n = int(input_data[0])
    arr = [int(x) for x in input_data[1:n+1]]
    print(find_equilibrium(arr))

if __name__ == "__main__":
    main()
```

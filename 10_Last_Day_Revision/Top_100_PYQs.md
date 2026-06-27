# Top PYQ-Style Questions (Ranked by Frequency)

## Quantitative Ability - Number System (🔴 High)
---

### PYQ1 — Digit Sum & Divisibility
**Difficulty:** Easy | **Time:** 60s | **TCS Frequency:** High
Find the value of $P$ for which $78P39$ is divisible by 9.
**Answer:** Sum of digits $= 7 + 8 + P + 3 + 9 = 27 + P$.
For $27 + P$ to be divisible by 9, $P$ must be $0$ or $9$. (Usually only one option is provided in the choices).

---

### PYQ2 — Remainder Problem
**Difficulty:** Medium | **Time:** 75s | **TCS Frequency:** High
Find the remainder when $2^{31}$ is divided by 5.
**Answer:**
- $2^1 \equiv 2, 2^2 \equiv 4, 2^3 \equiv 3, 2^4 \equiv 1 \pmod 5$ (cyclicity of 4).
- $31 \bmod 4 = 3$.
- Remainder is $2^3 \bmod 5 = 3$.

---

### PYQ3 — Trailing Zeros
**Difficulty:** Easy | **Time:** 45s | **TCS Frequency:** High
Find trailing zeros in $125!$.
**Answer:** $\lfloor 125/5 \rfloor + \lfloor 125/25 \rfloor + \lfloor 125/125 \rfloor = 25 + 5 + 1 = 31$ zeros.

---

### PYQ4 — Octal to Hexadecimal conversion
**Difficulty:** Medium | **Time:** 75s | **TCS Frequency:** Medium
Convert octal $237_8$ to hexadecimal.
**Answer:**
1. Octal to Binary: $2 \rightarrow 010$, $3 \rightarrow 011$, $7 \rightarrow 111 \rightarrow 010011111_2$.
2. Group into 4-bit nibbles from right:
   - `1111` $\rightarrow$ F
   - `1001` $\rightarrow$ 9
   - `0000` $\rightarrow$ 0
3. Hexadecimal value is $9\text{F}_{16}$.

---

### PYQ5 — LCM of fractions word problem
**Difficulty:** Medium | **Time:** 90s | **TCS Frequency:** High
Three bells toll at intervals of $\frac{2}{3}$ min, $\frac{3}{5}$ min, and $\frac{4}{7}$ min respectively. If they toll together now, after what time interval will they toll together next?
**Answer:**
LCM of fractions:
$$\text{LCM} = \frac{\text{LCM}(2, 3, 4)}{\text{HCF}(3, 5, 7)} = \frac{12}{1} = 12 \text{ minutes}$$
They will toll together next after 12 minutes.

## Coding - Arrays PYQ (🔴 High)
> Tagged by difficulty, with solution in C++.
> No duplicates with practice or important_questions files.

---

### PYQ1
**TCS NQT Style | Difficulty:** Easy | **Time:** 60s | **TCS Frequency:** High

**Problem:** An array `arr[]` contains n integers. Write a program to find the sum of elements present at even positions (0-indexed: 0, 2, 4, ...) and odd positions separately.

Input: `arr = [5, 3, 8, 1, 9, 4]`  
Output: Even-index sum = 22, Odd-index sum = 8

**C++ Solution:**
```cpp
#include <iostream>
#include <vector>

void printSums(const std::vector<int>& arr) {
    int evenSum = 0, oddSum = 0;
    for (size_t i = 0; i < arr.size(); ++i) {
        if (i % 2 == 0) evenSum += arr[i];
        else            oddSum  += arr[i];
    }
    std::cout << "Even-index sum = " << evenSum << ", Odd-index sum = " << oddSum << "\n";
}
```

---

### PYQ2
**TCS NQT Style | Difficulty:** Easy | **Time:** 60s | **TCS Frequency:** High

**Problem:** Given an integer array, find the number of elements greater than their next element (i.e., arr[i] > arr[i+1]).

Input: `arr = [4, 2, 7, 3, 8, 5]`  
Output: 3

**C++ Solution:**
```cpp
#include <vector>

int countGreaterPairs(const std::vector<int>& arr) {
    int count = 0;
    for (size_t i = 0; i < arr.size() - 1; ++i) {
        if (arr[i] > arr[i + 1]) count++;
    }
    return count;
}
```

---

### PYQ3
**TCS NQT Style | Difficulty:** Medium | **Time:** 120s | **TCS Frequency:** High

**Problem:** Given an array of 0s and 1s only, find the position of 0 that when replaced by 1 gives the longest run of 1s.

Input: `arr = [1,1,0,1,1,1,0,0,1,1]`  
Output: Position 2, new max run = 6

**C++ Solution:**
```cpp
#include <vector>
#include <algorithm>

int findZeroToFlip(const std::vector<int>& arr) {
    int left = 0, maxLen = 0, lastZeroPos = -1, bestZeroIndex = -1;
    for (int right = 0; right < arr.size(); ++right) {
        if (arr[right] == 0) {
            left = lastZeroPos + 1;
            lastZeroPos = right;
        }
        if (right - left + 1 > maxLen) {
            maxLen = right - left + 1;
            bestZeroIndex = lastZeroPos;
        }
    }
    return bestZeroIndex;
}
```

---

### PYQ4
**TCS NQT Style | Difficulty:** Medium | **Time:** 150s | **TCS Frequency:** High

**Problem:** You are given `n` numbers. You need to rearrange them such that the sum of `|arr[i] - arr[i-1]|` is maximized.

Input: `arr = [1, 2, 4, 8]`  
Output: 10

**C++ Solution:**
```cpp
#include <vector>
#include <algorithm>
#include <cmath>

int maxDiffSum(std::vector<int>& arr) {
    int n = arr.size();
    std::sort(arr.begin(), arr.end());
    std::vector<int> res(n);
    int l = 0, r = n - 1;
    for (int i = 0; i < n; ++i) {
        if (i % 2 == 0) res[i] = arr[l++];
        else            res[i] = arr[r--];
    }
    int sum = 0;
    for (int i = 1; i < n; ++i) {
        sum += std::abs(res[i] - res[i-1]);
    }
    return sum;
}
```

---

### PYQ5
**TCS NQT Style | Difficulty:** Medium | **Time:** 120s | **TCS Frequency:** High

**Problem:** Given an array, rotate it left by d positions.

Input: `arr = [1,2,3,4,5,6,7]`, d=2  
Output: `[3,4,5,6,7,1,2]`

**C++ Solution:**
```cpp
#include <vector>
#include <algorithm>

void rotateLeft(std::vector<int>& arr, int d) {
    int n = arr.size();
    d = d % n;
    std::reverse(arr.begin(), arr.begin() + d);
    std::reverse(arr.begin() + d, arr.end());
    std::reverse(arr.begin(), arr.end());
}
```

---

### PYQ6
**TCS NQT Style | Difficulty:** Medium | **Time:** 120s | **TCS Frequency:** High

**Problem:** Given an array of integers (possibly negative), find the maximum sum you can get by selecting at most one contiguous subarray or an empty subarray (sum = 0).

Input: `arr = [-3, -1, -2]`  
Output: 0

**C++ Solution:**
```cpp
#include <vector>
#include <algorithm>

int maxSubarraySumWithEmpty(const std::vector<int>& arr) {
    int maxSum = 0, currSum = 0;
    for (int num : arr) {
        currSum = std::max(0, currSum + num);
        maxSum = std::max(maxSum, currSum);
    }
    return maxSum;
}
```

---

### PYQ7
**TCS NQT Style | Difficulty:** Hard | **Time:** 200s | **TCS Frequency:** Medium

**Problem:** Given two sorted arrays A and B, find the k-th element of their merged sorted array without actually merging them.

Input: `A = [2,3,6,7,9]`, `B = [1,4,8,10]`, k=5  
Output: 6

**C++ Solution (O(log k)):**
```cpp
#include <vector>
#include <algorithm>

int findKth(const std::vector<int>& A, int aStart, const std::vector<int>& B, int bStart, int k) {
    if (aStart >= A.size()) return B[bStart + k - 1];
    if (bStart >= B.size()) return A[aStart + k - 1];
    if (k == 1) return std::min(A[aStart], B[bStart]);
    
    int aMid = aStart + k/2 - 1 < A.size() ? A[aStart + k/2 - 1] : 2e9;
    int bMid = bStart + k/2 - 1 < B.size() ? B[bStart + k/2 - 1] : 2e9;
    
    if (aMid < bMid) {
        return findKth(A, aStart + k/2, B, bStart, k - k/2);
    } else {
        return findKth(A, aStart, B, bStart + k/2, k - k/2);
    }
}
```

---

### PYQ8
**TCS NQT Style | Difficulty:** Medium | **Time:** 150s | **TCS Frequency:** High

**Problem:** Find the length of the longest subarray with equal number of 0s and 1s.

Input: `arr = [0,1,0,1,1,1,0]`  
Output: 4

**C++ Solution (Prefix Sum + Hash Map):**
```cpp
#include <vector>
#include <unordered_map>
#include <algorithm>

int findMaxLength(const std::vector<int>& arr) {
    std::unordered_map<int, int> map;
    map[0] = -1;
    int sum = 0, maxLen = 0;
    for (int i = 0; i < arr.size(); ++i) {
        sum += (arr[i] == 0) ? -1 : 1;
        if (map.count(sum)) {
            maxLen = std::max(maxLen, i - map[sum]);
        } else {
            map[sum] = i;
        }
    }
    return maxLen;
}
```

---

### PYQ9
**TCS NQT Style | Difficulty:** Easy | **Time:** 60s | **TCS Frequency:** Medium

**Problem:** Given an array, find the maximum absolute difference between any two elements.

Input: `arr = [2, 7, 3, -1, 9]`  
Output: 10

**C++ Solution:**
```cpp
#include <vector>
#include <algorithm>

int maxAbsDiff(const std::vector<int>& arr) {
    if (arr.empty()) return 0;
    auto p = std::minmax_element(arr.begin(), arr.end());
    return *p.second - *p.first;
}
```

---

### PYQ10
**TCS NQT Style | Difficulty:** Hard | **Time:** 240s | **TCS Frequency:** Low

**Problem:** Given array `arr` of positive integers and integer k, determine if there exists a contiguous subarray of length at least 2 whose elements sum to a multiple of k.

Input: `arr = [23,2,4,6,7]`, k=6  
Output: True (subarray [2,4] or [23,2,4,6,7])

**C++ Solution (Prefix Sum Modulo):**
```cpp
#include <vector>
#include <unordered_map>

bool checkSubarraySum(const std::vector<int>& arr, int k) {
    std::unordered_map<int, int> map;
    map[0] = -1;
    int sum = 0;
    for (int i = 0; i < arr.size(); ++i) {
        sum += arr[i];
        int rem = sum % k;
        if (map.count(rem)) {
            if (i - map[rem] >= 2) return true;
        } else {
            map[rem] = i;
        }
    }
    return false;
}
```

## Coding - Strings PYQ (🔴 High)
---

### PYQ1 — Word Reverse
**Difficulty:** Medium | **Time:** 90s | **TCS Frequency:** High

**Problem:** Reverse each word in a given sentence while keeping the relative order of the words the same.

Input: `s = "Hello World"`  
Output: "olleH dlroW"

**C++ Solution:**
```cpp
#include <iostream>
#include <string>
#include <sstream>
#include <algorithm>

std::string reverseEachWord(const std::string& s) {
    std::stringstream ss(s);
    std::string word, result = "";
    while (ss >> word) {
        std::reverse(word.begin(), word.end());
        result += word + " ";
    }
    if (!result.empty()) result.pop_back(); // remove trailing space
    return result;
}
```

---

### PYQ2 — Run Length Encoding (RLE)
**Difficulty:** Easy | **Time:** 60s | **TCS Frequency:** High

**Problem:** Compress a string by replacing consecutive repeating characters with the character followed by its count.

Input: `"aabbbcccc"`  
Output: "a2b3c4"

**C++ Solution:**
```cpp
#include <string>

std::string compress(const std::string& s) {
    if (s.empty()) return "";
    std::string res = "";
    int count = 1;
    for (size_t i = 1; i <= s.length(); ++i) {
        if (i < s.length() && s[i] == s[i-1]) {
            count++;
        } else {
            res += s[i-1];
            res += std::to_string(count);
            count = 1;
        }
    }
    return res;
}
```

---

### PYQ3 — Remove Vowels
**Difficulty:** Easy | **Time:** 45s | **TCS Frequency:** High

**Problem:** Remove all vowels from a given string.

Input: `"TCS NQT"`  
Output: "TCS NQT"

**C++ Solution:**
```cpp
#include <string>

bool isVowel(char c) {
    c = tolower(c);
    return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
}

std::string removeVowels(const std::string& s) {
    std::string res = "";
    for (char c : s) {
        if (!isVowel(c)) res += c;
    }
    return res;
}
```

---

### PYQ4 — Count Vowels, Consonants, Spaces, and Digits
**Difficulty:** Easy | **Time:** 60s | **TCS Frequency:** High

**Problem:** Count the occurrences of vowels, consonants, spaces, and digits in a string.

**C++ Solution:**
```cpp
#include <string>
#include <cctype>

struct Counts {
    int vowels = 0;
    int consonants = 0;
    int spaces = 0;
    int digits = 0;
};

Counts countAll(const std::string& s) {
    Counts counts;
    for (char c : s) {
        if (std::isdigit(c)) {
            counts.digits++;
        } else if (std::isspace(c)) {
            counts.spaces++;
        } else if (std::isalpha(c)) {
            char lower = std::tolower(c);
            if (lower == 'a' || lower == 'e' || lower == 'i' || lower == 'o' || lower == 'u') {
                counts.vowels++;
            } else {
                counts.consonants++;
            }
        }
    }
    return counts;
}
```
**Complexity:** Time O(N) | Space O(1)

---

### PYQ5 — Non-Repeating Character
**Difficulty:** Medium | **Time:** 90s | **TCS Frequency:** High

**Problem:** Find the first non-repeating character in a string.

Input: `"apple"`  
Output: 'a'

**C++ Solution:**
```cpp
#include <string>

char firstNonRepeating(const std::string& s) {
    int freq[256] = {0};
    for (char c : s) {
        freq[(unsigned char)c]++;
    }
    for (char c : s) {
        if (freq[(unsigned char)c] == 1) {
            return c;
        }
    }
    return '\0';
}
```
**Complexity:** Time O(N) | Space O(1) (fixed 256 size array)
```

## Coding - HashMap PYQ (🔴 High)
---

### PYQ1 — Find Pairs with Given Sum
**Difficulty:** Medium | **Time:** 90s | **TCS Frequency:** High

**Problem:** Find all pairs in an array that sum to a given number.

Input: `arr = [1, 5, 7, -1, 5]`, `sum = 6`  
Output: 3 pairs (1,5), (7,-1), (1,5)

**C++ Solution:**
```cpp
#include <vector>
#include <unordered_map>

int countPairsWithSum(const std::vector<int>& arr, int target) {
    std::unordered_map<int, int> seen;
    int count = 0;
    for (int num : arr) {
        int complement = target - num;
        if (seen.count(complement)) {
            count += seen[complement];
        }
        seen[num]++;
    }
    return count;
}
```

---

### PYQ2 — Find Elements with Frequency K
**Difficulty:** Easy | **Time:** 60s | **TCS Frequency:** High

**Problem:** Find all elements in an array that appear exactly k times.

Input: `arr = [1, 2, 1, 3, 4, 2]`, `k = 2`  
Output: `[1, 2]`

**C++ Solution:**
```cpp
#include <vector>
#include <unordered_map>

std::vector<int> findFreqK(const std::vector<int>& arr, int k) {
    std::unordered_map<int, int> freq;
    for (int num : arr) freq[num]++;
    
    std::vector<int> result;
    for (const auto& pair : freq) {
        if (pair.second == k) {
            result.push_back(pair.first);
        }
    }
    return result;
}
```
**Complexity:** Time O(N) | Space O(N)

---

### PYQ3 — Non-Overlapping Elements Sum
**Difficulty:** Easy | **Time:** 60s | **TCS Frequency:** Medium

**Problem:** Find the sum of all elements that are unique in two arrays combined (excluding elements present in both).

Input: `A = [5, 4, 9, 2]`, `B = [5, 1, 9, 3]`  
Output: 10 (4 + 2 + 1 + 3)

**C++ Solution:**
```cpp
#include <vector>
#include <unordered_set>

int nonOverlappingSum(const std::vector<int>& A, const std::vector<int>& B) {
    std::unordered_set<int> setA(A.begin(), A.end());
    std::unordered_set<int> setB(B.begin(), B.end());
    
    int sum = 0;
    for (int num : A) {
        if (!setB.count(num)) sum += num;
    }
    for (int num : B) {
        if (!setA.count(num)) sum += num;
    }
    return sum;
}
```
**Complexity:** Time O(N + M) | Space O(N + M)

---

### PYQ4 — Count Subarrays with Sum = 0
**Difficulty:** Medium | **Time:** 90s | **TCS Frequency:** High

**Problem:** Count total contiguous subarrays whose sum equals 0.

Input: `arr = [1, -1, 2, -2]`  
Output: 3 (subarrays `[1,-1]`, `[2,-2]`, `[1,-1,2,-2]`)

**C++ Solution:**
```cpp
#include <vector>
#include <unordered_map>

int countSubarraysWithSumZero(const std::vector<int>& arr) {
    std::unordered_map<int, int> prefix;
    prefix[0] = 1;
    int sum = 0, count = 0;
    for (int num : arr) {
        sum += num;
        if (prefix.count(sum)) {
            count += prefix[sum];
        }
        prefix[sum]++;
    }
    return count;
}
```
**Complexity:** Time O(N) | Space O(N)

---

### PYQ5 — Distinct Element in Windows
**Difficulty:** Hard | **Time:** 180s | **TCS Frequency:** Medium

**Problem:** Find count of distinct elements in every sliding window of size k.

Input: `arr = [1, 2, 1, 3, 4, 2, 3]`, `k = 4`  
Output: `[3, 4, 4, 3]`

**C++ Solution:**
```cpp
#include <vector>
#include <unordered_map>

std::vector<int> countDistinct(const std::vector<int>& arr, int k) {
    std::unordered_map<int, int> map;
    std::vector<int> result;
    for (int i = 0; i < k; ++i) map[arr[i]]++;
    result.push_back(map.size());
    
    for (size_t i = k; i < arr.size(); ++i) {
        map[arr[i]]++;
        if (--map[arr[i - k]] == 0) map.erase(arr[i - k]);
        result.push_back(map.size());
    }
    return result;
}
```
```

## Coding - Searching PYQ (🔴 High)
---

### PYQ1 — Binary Search Return Value
**Difficulty:** Easy | **Time:** 30s | **Frequency:** High

What does Java's `Arrays.binarySearch(arr, x)` return if x is not found in the sorted array `arr = [1,3,5,7]` and x=4?

**Answer:** `-(insertionPoint) - 1`. InsertionPoint for 4 = 2 (between 3 and 5). Return = -(2)-1 = **-3**.
**Faster method:** Directly apply the formula: `-(lb) - 1` where lb = lowerBound(arr, x).

---

### PYQ2 — Count Elements in Range
**Difficulty:** Medium | **Time:** 90s | **Frequency:** High

`arr = [2,3,3,5,7,7,7,8,9]`. How many elements are in range [3, 7] (inclusive)?

**Answer:** 6 (elements: 3,3,5,7,7,7). upper_bound(7) - lower_bound(3) = 7 - 1 = 6.
**Faster method:** One linear scan O(n) or two binary searches O(log n). Use binary search.

---

### PYQ3 — First and Last Occurrence
**Difficulty:** Medium | **Time:** 120s | **Frequency:** High

`arr = [5,7,7,8,8,10]`, target=8. Find first and last occurrence.

**Answer:** First=3, Last=4.
- First: lo=0,hi=5,mid=2(7)<8→lo=3; mid=4(8)==8, result=4,hi=3; mid=3(8)==8, result=3,hi=2; lo>hi→first=3.
- Last: similar but move lo=mid+1 on match. Result=4.

---

### PYQ4 — Search in Rotated Array
**Difficulty:** Medium | **Time:** 120s | **Frequency:** High

`arr = [6,7,8,1,2,3,4,5]`, target=3. Which index?

**Answer:** Index 5.
Trace: lo=0,hi=7,mid=3(1). Right half [1..5] sorted. target=3 in [1,5]→lo=4. lo=4,hi=7,mid=5(3)==3. **return 5**.

---

### PYQ5 — Binary Search Complexity
**Difficulty:** Easy | **Time:** 15s | **Frequency:** Medium

For binary search on 1000 elements, worst case comparisons?

**Answer:** ⌈log₂(1000)⌉ = 10 comparisons (since 2¹⁰=1024 > 1000).

---

### PYQ6 — Lower Bound Application
**Difficulty:** Medium | **Time:** 90s | **Frequency:** High

`arr = [1,2,4,4,4,7,8]`. How many elements are strictly less than 4?

**Answer:** 2 (elements 1, 2). This equals `lowerBound(arr, 4) = 2`.

---

### PYQ7 — Find Peak in Bitonic Array
**Difficulty:** Medium | **Time:** 120s | **Frequency:** Medium

`arr = [1,4,8,5,3]`. Find the peak element.

**Answer:** Index 2 (value 8). Binary search: mid=2(8). nums[2]=8 > nums[3]=5 → hi=2. lo=2==hi=2 → return 2.

---

### PYQ8 — When Does Binary Search Fail?
**Difficulty:** Easy | **Time:** 20s | **Frequency:** Medium

Give two conditions under which binary search gives wrong results.

**Answer:**
1. Array is NOT sorted — binary search assumes sorted order.
2. Integer overflow: `(lo + hi) / 2` overflows when both are near MAX_VALUE. Fix: `lo + (hi-lo)/2`.

---

### PYQ9 — Minimum in Rotated Sorted Array With Duplicates
**Difficulty:** Hard | **Time:** 180s | **Frequency:** Medium

`arr = [3,3,1,3]`. Find minimum.

**Answer:** 1.
Modified binary search: if nums[mid] == nums[hi], hi-- (can't determine which side). If nums[mid] > nums[hi]: lo=mid+1. Else hi=mid.
lo=0,hi=3,mid=1(3)==nums[3](3)→hi=2. lo=0,hi=2,mid=1(3)>nums[2](1)→lo=2. lo==hi=2, nums[2]=1.

---

### PYQ10 — Count 1s in Binary Sorted Array
**Difficulty:** Easy | **Time:** 45s | **Frequency:** High

`arr = [0,0,0,0,1,1,1]`. Count 1s using binary search.

**Answer:** 3. Lower bound of 1 = 4. Count = 7 - 4 = 3.
**Python:** `n - bisect.bisect_left(arr, 1)`

## Coding - Sorting PYQ (🔴 High)
---

### PYQ1 — Minimum Platforms
**Difficulty:** Hard | **Time:** 180s | **TCS Frequency:** High

**Problem:** Given arrival and departure times of trains, find the minimum number of platforms needed at the station so that no train has to wait.

Input: `arr = [900, 940, 950, 1100, 1500, 1800]`, `dep = [910, 1200, 1120, 1130, 1900, 2000]`  
Output: 3

**C++ Solution:**
```cpp
#include <vector>
#include <algorithm>

int findPlatform(std::vector<int>& arr, std::vector<int>& dep) {
    std::sort(arr.begin(), arr.end());
    std::sort(dep.begin(), dep.end());
    
    int plat_needed = 1, result = 1;
    int i = 1, j = 0;
    
    while (i < arr.size() && j < dep.size()) {
        if (arr[i] <= dep[j]) {
            plat_needed++;
            i++;
        } else {
            plat_needed--;
            j++;
        }
        result = std::max(result, plat_needed);
    }
    return result;
}
```

---

### PYQ2 — Sort Array of 0s, 1s, and 2s
**Difficulty:** Easy | **Time:** 60s | **TCS Frequency:** High

**Problem:** Given an array containing only 0s, 1s, and 2s, sort it in O(N) time and O(1) space.

**C++ Solution:**
```cpp
#include <vector>
#include <algorithm>

void sort012(std::vector<int>& arr) {
    int low = 0, mid = 0, high = arr.size() - 1;
    while (mid <= high) {
        if (arr[mid] == 0) {
            std::swap(arr[low++], arr[mid++]);
        } else if (arr[mid] == 1) {
            mid++;
        } else {
            std::swap(arr[mid], arr[high--]);
        }
    }
}
```

---

### PYQ3 — Largest Number Formed from Array
**Difficulty:** Medium | **Time:** 120s | **TCS Frequency:** High

**Problem:** Arrange the given numbers to form the largest possible number.

Input: `[3, 30, 34, 5, 9]`  
Output: "9534330"

**C++ Solution:**
```cpp
#include <vector>
#include <string>
#include <algorithm>

std::string largestNumber(std::vector<int>& nums) {
    std::vector<std::string> strs;
    for (int num : nums) strs.push_back(std::to_string(num));
    
    std::sort(strs.begin(), strs.end(), [](const std::string& a, const std::string& b) {
        return a + b > b + a;
    });
    if (strs[0] == "0") return "0";
    std::string res = "";
    for (const auto& s : strs) res += s;
    return res;
}
```

---

### PYQ4 — Count Inversions
**Difficulty:** Hard | **Time:** 240s | **TCS Frequency:** Medium

**Problem:** Find the inversion count of an array.

Input: `arr = [2, 4, 1, 3, 5]`  
Output: 3

**C++ Solution:** Use the modified merge sort technique.

---

### PYQ5 — Minimum Swaps to Sort
**Difficulty:** Medium | **Time:** 120s | **TCS Frequency:** High

**Problem:** Find the minimum swaps needed to sort an unsorted array of distinct elements.

Input: `[4, 3, 2, 1]`  
Output: 2

**C++ Solution:** Use cycle decomposition on graph index positions.
```


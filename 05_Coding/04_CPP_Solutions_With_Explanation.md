# C++ Solutions With Explanation

This file gives concise, exam-ready solutions. Every solution uses standard C++.

## Q1. Sum Of Digits

Idea: Extract last digit using `% 10`, then remove it using `/ 10`.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    long long n;
    cin >> n;
    n = llabs(n);
    int sum = 0;
    while (n > 0) {
        sum += n % 10;
        n /= 10;
    }
    cout << sum;
    return 0;
}
```

Complexity: O(number of digits), space O(1).

## Q2. Palindrome Number

Idea: Reverse the number and compare with original.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    long long n;
    cin >> n;
    long long original = n, rev = 0;
    while (n > 0) {
        rev = rev * 10 + n % 10;
        n /= 10;
    }
    cout << (original == rev ? "YES" : "NO");
    return 0;
}
```

Complexity: O(digits), space O(1).

## Q3. Prime Number

Idea: Check divisors only till square root.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    long long n;
    cin >> n;
    if (n < 2) {
        cout << "NO";
        return 0;
    }
    for (long long i = 2; i * i <= n; i++) {
        if (n % i == 0) {
            cout << "NO";
            return 0;
        }
    }
    cout << "YES";
    return 0;
}
```

Complexity: O(sqrt N), space O(1).

## Q4. GCD And LCM

Idea: Use Euclid's algorithm. Compute LCM safely as `a / gcd * b`.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    long long a, b;
    cin >> a >> b;
    long long g = gcd(a, b);
    long long l = a / g * b;
    cout << g << " " << l;
    return 0;
}
```

Complexity: O(log min(a,b)), space O(1).

## Q5. Armstrong Number

Idea: For each digit, add digit raised to number of digits.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    string s = to_string(n);
    int power = s.size();
    int sum = 0;
    for (char ch : s) {
        int d = ch - '0';
        sum += pow(d, power);
    }
    cout << (sum == n ? "YES" : "NO");
    return 0;
}
```

Complexity: O(digits), space O(1).

## Q6. Second Largest Distinct Element

Idea: Track largest and second largest in one scan.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;

    int first = INT_MIN, second = INT_MIN;
    for (int x : a) {
        if (x > first) {
            second = first;
            first = x;
        } else if (x < first && x > second) {
            second = x;
        }
    }
    cout << (second == INT_MIN ? -1 : second);
    return 0;
}
```

Complexity: O(N), space O(1).

## Q7. Reverse Array

Idea: Print elements from the last index to the first index.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;

    for (int i = n - 1; i >= 0; i--) cout << a[i] << " ";
    return 0;
}
```

Complexity: O(N), space O(N).

## Q8. Rotate Array Left By K

Idea: Reverse first `k`, reverse remaining part, then reverse full array.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n, k;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;
    cin >> k;

    k %= n;
    reverse(a.begin(), a.begin() + k);
    reverse(a.begin() + k, a.end());
    reverse(a.begin(), a.end());

    for (int x : a) cout << x << " ";
    return 0;
}
```

Complexity: O(N), space O(1).

## Q9. Missing Number From 1 To N

Idea: Expected sum minus actual sum.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    long long n;
    cin >> n;
    long long expected = n * (n + 1) / 2;
    long long actual = 0;
    for (int i = 0; i < n - 1; i++) {
        long long x;
        cin >> x;
        actual += x;
    }
    cout << expected - actual;
    return 0;
}
```

Complexity: O(N), space O(1).

## Q10. Maximum Subarray Sum

Idea: Kadane's algorithm. Either extend current subarray or start new.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;

    long long best = a[0], curr = a[0];
    for (int i = 1; i < n; i++) {
        curr = max((long long)a[i], curr + a[i]);
        best = max(best, curr);
    }
    cout << best;
    return 0;
}
```

Complexity: O(N), space O(1).

## Q11. Palindrome String

Idea: Compare characters from both ends.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    string s;
    cin >> s;
    int l = 0, r = s.size() - 1;
    while (l < r) {
        if (s[l] != s[r]) {
            cout << "NO";
            return 0;
        }
        l++;
        r--;
    }
    cout << "YES";
    return 0;
}
```

Complexity: O(N), space O(1).

## Q12. Count Vowels And Consonants

Idea: Check only alphabet characters. Count vowels separately.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    string s;
    getline(cin, s);
    int vowels = 0, consonants = 0;

    for (char ch : s) {
        if (!isalpha(ch)) continue;
        ch = tolower(ch);
        if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') vowels++;
        else consonants++;
    }

    cout << vowels << " " << consonants;
    return 0;
}
```

Complexity: O(N), space O(1).

## Q13. First Non-Repeating Character

Idea: Count frequency, then scan again in original order.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    string s;
    cin >> s;
    vector<int> freq(26, 0);
    for (char ch : s) freq[ch - 'a']++;

    for (char ch : s) {
        if (freq[ch - 'a'] == 1) {
            cout << ch;
            return 0;
        }
    }
    cout << -1;
    return 0;
}
```

Complexity: O(N), space O(1).

## Q14. Check Anagram

Idea: Two strings are anagrams if their character frequencies match.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    string a, b;
    cin >> a >> b;
    if (a.size() != b.size()) {
        cout << "NO";
        return 0;
    }
    vector<int> freq(26, 0);
    for (char ch : a) freq[ch - 'a']++;
    for (char ch : b) freq[ch - 'a']--;
    for (int x : freq) {
        if (x != 0) {
            cout << "NO";
            return 0;
        }
    }
    cout << "YES";
    return 0;
}
```

Complexity: O(N), space O(1).

## Q15. Reverse Words In A Sentence

Idea: Split sentence into words, reverse the word list, then print.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    string s, word;
    getline(cin, s);
    stringstream ss(s);
    vector<string> words;

    while (ss >> word) words.push_back(word);
    reverse(words.begin(), words.end());

    for (int i = 0; i < (int)words.size(); i++) {
        if (i) cout << " ";
        cout << words[i];
    }
    return 0;
}
```

Complexity: O(N), space O(N).

## Q16. Sort 0s, 1s And 2s

Idea: Dutch National Flag algorithm.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;

    int low = 0, mid = 0, high = n - 1;
    while (mid <= high) {
        if (a[mid] == 0) swap(a[low++], a[mid++]);
        else if (a[mid] == 1) mid++;
        else swap(a[mid], a[high--]);
    }

    for (int x : a) cout << x << " ";
    return 0;
}
```

Complexity: O(N), space O(1).

## Q17. Frequency Of Each Element

Idea: Use `map` so output comes in increasing order of element.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    map<int, int> freq;
    for (int i = 0; i < n; i++) {
        int x;
        cin >> x;
        freq[x]++;
    }

    for (auto [value, count] : freq) {
        cout << value << " " << count << "\n";
    }
    return 0;
}
```

Complexity: O(N log N), space O(N).

## Q18. Majority Element

Idea: Boyer-Moore voting finds candidate, then verify.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;

    int candidate = 0, votes = 0;
    for (int x : a) {
        if (votes == 0) candidate = x;
        votes += (x == candidate ? 1 : -1);
    }

    int cnt = 0;
    for (int x : a) if (x == candidate) cnt++;
    cout << (cnt > n / 2 ? candidate : -1);
    return 0;
}
```

Complexity: O(N), space O(1).

## Q19. Kth Largest Element

Idea: Sort ascending. The kth largest is at index `n - k`.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n, k;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;
    cin >> k;

    sort(a.begin(), a.end());
    cout << a[n - k];
    return 0;
}
```

Complexity: O(N log N), space O(1) extra.

## Q20. Pair Sum Exists

Idea: Store seen values. For each `x`, check whether `target - x` was seen.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n, target;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;
    cin >> target;

    unordered_set<int> seen;
    for (int x : a) {
        if (seen.count(target - x)) {
            cout << "YES";
            return 0;
        }
        seen.insert(x);
    }
    cout << "NO";
    return 0;
}
```

Complexity: O(N), space O(N).

## Q21. Equilibrium Index

Idea: If `total - left - a[i] == left`, index `i` is equilibrium.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a(n);
    long long total = 0;
    for (int &x : a) {
        cin >> x;
        total += x;
    }

    long long left = 0;
    for (int i = 0; i < n; i++) {
        long long right = total - left - a[i];
        if (left == right) {
            cout << i;
            return 0;
        }
        left += a[i];
    }
    cout << -1;
    return 0;
}
```

Complexity: O(N), space O(1).

## Q22. Maximum Sum Subarray Of Size K

Idea: Maintain a fixed-size sliding window.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n, k;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;
    cin >> k;

    long long window = 0;
    for (int i = 0; i < k; i++) window += a[i];
    long long ans = window;

    for (int i = k; i < n; i++) {
        window += a[i] - a[i - k];
        ans = max(ans, window);
    }
    cout << ans;
    return 0;
}
```

Complexity: O(N), space O(1).

## Q23. Longest Substring Without Repeating Characters

Idea: Sliding window with last seen index.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    string s;
    cin >> s;
    vector<int> last(256, -1);
    int left = 0, ans = 0;

    for (int right = 0; right < (int)s.size(); right++) {
        if (last[s[right]] >= left) {
            left = last[s[right]] + 1;
        }
        last[s[right]] = right;
        ans = max(ans, right - left + 1);
    }
    cout << ans;
    return 0;
}
```

Complexity: O(N), space O(1).

## Q24. Remove Duplicates From Sorted Array

Idea: Use write pointer for unique values.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;

    int write = 0;
    for (int read = 0; read < n; read++) {
        if (read == 0 || a[read] != a[read - 1]) {
            a[write++] = a[read];
        }
    }

    for (int i = 0; i < write; i++) cout << a[i] << " ";
    return 0;
}
```

Complexity: O(N), space O(1).

## Q25. Move Zeroes To End

Idea: Write all non-zero values first, then fill the remaining positions with zero.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;

    int write = 0;
    for (int read = 0; read < n; read++) {
        if (a[read] != 0) a[write++] = a[read];
    }
    while (write < n) a[write++] = 0;

    for (int x : a) cout << x << " ";
    return 0;
}
```

Complexity: O(N), space O(1).

## Q26. Diagonal Sum

Idea: Add primary and secondary diagonal. For odd `n`, subtract center once.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<vector<int>> mat(n, vector<int>(n));
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) cin >> mat[i][j];
    }

    long long sum = 0;
    for (int i = 0; i < n; i++) {
        sum += mat[i][i];
        sum += mat[i][n - 1 - i];
    }
    if (n % 2 == 1) sum -= mat[n / 2][n / 2];
    cout << sum;
    return 0;
}
```

Complexity: O(N), space O(N^2) for input storage.

## Q27. Transpose Matrix

Idea: Print column-wise instead of row-wise.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int r, c;
    cin >> r >> c;
    vector<vector<int>> a(r, vector<int>(c));
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) cin >> a[i][j];
    }

    for (int j = 0; j < c; j++) {
        for (int i = 0; i < r; i++) {
            cout << a[i][j] << " ";
        }
        cout << "\n";
    }
    return 0;
}
```

Complexity: O(R*C), space O(R*C).

## Q28. Spiral Traversal

Idea: Keep four boundaries and shrink after each direction.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int r, c;
    cin >> r >> c;
    vector<vector<int>> a(r, vector<int>(c));
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) cin >> a[i][j];
    }

    int top = 0, bottom = r - 1, left = 0, right = c - 1;
    while (top <= bottom && left <= right) {
        for (int j = left; j <= right; j++) cout << a[top][j] << " ";
        top++;

        for (int i = top; i <= bottom; i++) cout << a[i][right] << " ";
        right--;

        if (top <= bottom) {
            for (int j = right; j >= left; j--) cout << a[bottom][j] << " ";
            bottom--;
        }

        if (left <= right) {
            for (int i = bottom; i >= top; i--) cout << a[i][left] << " ";
            left++;to 
        }
    }
    return 0;
}
```

Complexity: O(R*C), space O(R*C).

## Q29. Minimum Coins

Idea: Always take the largest possible denomination first.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int amount;
    cin >> amount;
    vector<int> den = {2000, 500, 200, 100, 50, 20, 10, 5, 2, 1};
    int count = 0;

    for (int coin : den) {
        count += amount / coin;
        amount %= coin;
    }

    cout << count;
    return 0;
}
```

Complexity: O(1), space O(1).

## Q30. Balanced Parentheses

Idea: Push opening brackets. On closing bracket, top must match.

```cpp
#include <bits/stdc++.h>
using namespace std;

bool match(char open, char close) {
    return (open == '(' && close == ')') ||
           (open == '[' && close == ']') ||
           (open == '{' && close == '}');
}

int main() {
    string s;
    cin >> s;
    stack<char> st;

    for (char ch : s) {
        if (ch == '(' || ch == '[' || ch == '{') {
            st.push(ch);
        } else {
            if (st.empty() || !match(st.top(), ch)) {
                cout << "NO";
                return 0;
            }
            st.pop();
        }
    }

    cout << (st.empty() ? "YES" : "NO");
    return 0;
}
```

Complexity: O(N), space O(N).

## Q31. Stock Buy And Sell Once

Idea: Keep minimum price so far and update best profit.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> price(n);
    for (int &x : price) cin >> x;

    int minPrice = price[0], best = 0;
    for (int i = 1; i < n; i++) {
        best = max(best, price[i] - minPrice);
        minPrice = min(minPrice, price[i]);
    }
    cout << best;
    return 0;
}
```

Complexity: O(N), space O(1).

## Q32. Activity Selection

Idea: Sort by finish time. Always pick the activity that finishes earliest.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<pair<int, int>> act(n);
    for (int i = 0; i < n; i++) {
        cin >> act[i].first >> act[i].second;
    }

    sort(act.begin(), act.end(), [](auto &a, auto &b) {
        return a.second < b.second;
    });

    int count = 0, lastFinish = INT_MIN;
    for (auto [start, finish] : act) {
        if (start >= lastFinish) {
            count++;
            lastFinish = finish;
        }
    }

    cout << count;
    return 0;
}
```

Complexity: O(N log N), space O(1) extra.

## Q33. Product Except Self

Idea: Use prefix product from left and suffix product from right.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<long long> a(n), ans(n, 1);
    for (long long &x : a) cin >> x;

    long long pref = 1;
    for (int i = 0; i < n; i++) {
        ans[i] = pref;
        pref *= a[i];
    }

    long long suff = 1;
    for (int i = n - 1; i >= 0; i--) {
        ans[i] *= suff;
        suff *= a[i];
    }

    for (long long x : ans) cout << x << " ";
    return 0;
}
```

Complexity: O(N), space O(1) extra apart from output.

## Q34. Compress String

Idea: Count consecutive same characters and append character plus count.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    string s;
    cin >> s;
    string ans;

    for (int i = 0; i < (int)s.size();) {
        int j = i;
        while (j < (int)s.size() && s[j] == s[i]) j++;
        ans += s[i];
        ans += to_string(j - i);
        i = j;
    }

    cout << ans;
    return 0;
}
```

Complexity: O(N), space O(N).

## Q35. Leaders In Array

Idea: Scan from right and keep maximum seen so far.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a(n), leaders;
    for (int &x : a) cin >> x;

    int maxRight = INT_MIN;
    for (int i = n - 1; i >= 0; i--) {
        if (a[i] > maxRight) {
            leaders.push_back(a[i]);
            maxRight = a[i];
        }
    }

    reverse(leaders.begin(), leaders.end());
    for (int x : leaders) cout << x << " ";
    return 0;
}
```

Complexity: O(N), space O(N).

## Q36. Subarray Sum Equals K

Idea: If current prefix sum is `sum`, then previous prefix `sum - k` forms a valid subarray.

```cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    int n, k;
    cin >> n;
    vector<int> a(n);
    for (int &x : a) cin >> x;
    cin >> k;

    unordered_map<long long, int> freq;
    freq[0] = 1;
    long long sum = 0;
    int count = 0;

    for (int x : a) {
        sum += x;
        count += freq[sum - k];
        freq[sum]++;
    }

    cout << count;
    return 0;
}
```

Complexity: O(N), space O(N).

All 36 question-bank problems now have direct C++ answers in this file.

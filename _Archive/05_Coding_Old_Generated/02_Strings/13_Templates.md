# Coding Templates: Strings

Use these C++14 templates to speed up input/output and string transformations during the exam.

---

## ⚡ 1. Fast I/O & Template Boilerplate
```cpp
#include <iostream>
#include <string>
#include <vector>
#include <sstream>
#include <algorithm>

using namespace std;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    // Code starts here
    return 0;
}
```

---

## ⚡ 2. String Tokenization (Split by space/comma)
```cpp
vector<string> split(const string& s, char delimiter = ' ') {
    vector<string> tokens;
    string token;
    stringstream ss(s);
    while (getline(ss, token, delimiter)) {
        tokens.push_back(token);
    }
    return tokens;
}
```

---

## ⚡ 3. Sliding Window String template
```cpp
int slidingWindowTemplate(const string& s) {
    int n = s.length();
    int left = 0, max_len = 0;
    int freq[256] = {0};
    
    for (int right = 0; right < n; right++) {
        freq[(unsigned char)s[right]]++;
        
        // Shrink window if constraint is broken
        while (/* constraint broken */ false) {
            freq[(unsigned char)s[left]]--;
            left++;
        }
        
        max_len = max(max_len, right - left + 1);
    }
    return max_len;
}
```

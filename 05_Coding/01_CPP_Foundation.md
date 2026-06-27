# C++ Foundation For TCS NQT

## Must-Know Syntax

### Fast Input Output

```cpp
ios::sync_with_stdio(false);
cin.tie(nullptr);
```

Use this in every program.

### Read Array

```cpp
int n;
cin >> n;
vector<int> a(n);
for (int i = 0; i < n; i++) cin >> a[i];
```

### Read Full Line

```cpp
string s;
cin.ignore();
getline(cin, s);
```

Use `getline` when the string contains spaces.

## Important STL

| Need | Use |
|---|---|
| Dynamic array | `vector<int>` |
| Frequency count | `unordered_map<int,int>` |
| Unique sorted values | `set<int>` |
| Sort | `sort(v.begin(), v.end())` |
| Reverse | `reverse(v.begin(), v.end())` |
| Max/min | `max_element`, `min_element` |
| Stack | `stack<int>` |
| Queue | `queue<int>` |

## C++ Functions To Remember

```cpp
sort(v.begin(), v.end());
reverse(v.begin(), v.end());
accumulate(v.begin(), v.end(), 0LL);
count(v.begin(), v.end(), x);
find(v.begin(), v.end(), x);
```

## Safe Integer Rule

Use `long long` when:

- Multiplying two integers
- Summing many array elements
- Working with factorial, LCM, powers
- Constraints contain values near `10^9`

Example:

```cpp
long long sum = 0;
for (int x : a) sum += x;
```

## Common Input Patterns

### Single Test Case

```cpp
int n;
cin >> n;
vector<int> a(n);
for (int i = 0; i < n; i++) cin >> a[i];
```

### Multiple Test Cases

```cpp
int t;
cin >> t;
while (t--) {
    int n;
    cin >> n;
    // solve one case
}
```

### Matrix

```cpp
int r, c;
cin >> r >> c;
vector<vector<int>> mat(r, vector<int>(c));
for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
        cin >> mat[i][j];
    }
}
```

## Programming Logic MCQ Traps

| Trap | Remember |
|---|---|
| `i++` vs `++i` | Post increment uses old value, pre increment uses new value |
| Integer division | `5 / 2` gives `2`, not `2.5` |
| Modulo | `a % b` gives remainder |
| Array index | Starts from `0` |
| C++ string compare | Use `==`, works for `string` objects |
| Char digit to int | `s[i] - '0'` |
| ASCII | `'A' = 65`, `'a' = 97`, `'0' = 48` |

## Debugging Checklist

- Did you initialize variables?
- Did loop start and end correctly?
- Did you print exactly what is asked?
- Did you handle `n = 1`?
- Did you use `long long` where needed?
- Did you clear map/vector inside each test case?

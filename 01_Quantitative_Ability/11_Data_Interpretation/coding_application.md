# Data Interpretation — Coding Applications

## 1. Parsing Tabular Data in Python

```python
import csv
from collections import defaultdict

def analyze_sales_data(filename):
    """Read and analyze tabular DI data."""
    data = defaultdict(list)
    with open(filename, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            for key, val in row.items():
                if key != 'Month':
                    data[key].append(int(val))
    
    results = {}
    for region, values in data.items():
        results[region] = {
            'total': sum(values),
            'average': sum(values) / len(values),
            'max': max(values),
            'min': min(values)
        }
    return results
```

## 2. Percentage Change Calculator

```python
def percentage_change(old, new):
    """Calculate percentage change between two values."""
    if old == 0:
        return float('inf') if new > 0 else 0
    return ((new - old) / old) * 100

# Example: production change
print(f"{percentage_change(1300, 1600):.2f}%")  # 23.08%
```

## 3. Pie Chart Generator

```python
import matplotlib.pyplot as plt

def create_pie_chart(labels, sizes, title):
    """Generate a pie chart for DI data."""
    plt.figure(figsize=(8, 8))
    plt.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=140)
    plt.title(title)
    plt.show()

labels = ['Engineering', 'Commerce', 'Arts', 'Science', 'Others']
sizes = [35, 25, 20, 15, 5]
create_pie_chart(labels, sizes, 'Student Distribution')
```

## 4. LeetCode Style DI Problems
- Process large datasets and compute statistics
- **LeetCode 1929 — Concatenation of Array**
- **LeetCode 2344 — Minimum Deletions to Make Array Divisible**

# Time, Speed & Distance — Coding Applications

## 1. Rate Limiting / Bandwidth Throttling

Speed-distance-time concepts apply directly to network throughput and data transfer:
- Bandwidth = Data / Time (Speed = Distance / Time)
- Optimize data transfer rates with rate limiters

```python
def transfer_time(file_size_mb, bandwidth_mbps):
    """Calculate transfer time in seconds."""
    return (file_size_mb * 8) / bandwidth_mbps  # Convert MB to Mb

# Example
print(transfer_time(100, 10))  # 100MB at 10 Mbps = 80 seconds
```

## 2. Relative Motion — Collision Detection in Games

```python
def time_to_collision(pos1, vel1, pos2, vel2):
    """Detect when two objects moving linearly will collide.
    Returns -1 if no collision (same direction, obj1 slower).
    """
    relative_vel = vel1 - vel2
    if relative_vel == 0:
        return -1  # Parallel, same speed
    gap = pos2 - pos1
    time = gap / relative_vel
    return time if time > 0 else -1

# Example: Two trains
print(time_to_collision(0, 20, 100, 10))  # 10 seconds to catch up
```

## 3. LeetCode: Meeting Point
- **LeetCode 1 — Two Sum** (using rate-time-distance encoding)
- **LeetCode 875 — Koko Eating Bananas** (binary search on rate)

## 4. Graph BFS — Shortest Path (Speed as Edge Weight)
```python
import heapq

def dijkstra_fastest_path(graph, start, end):
    """
    graph[node] = [(neighbor, distance, speed)]
    Find path that minimizes total time (distance/speed).
    """
    heap = [(0, start)]  # (time, node)
    dist = {start: 0}
    while heap:
        time, node = heapq.heappop(heap)
        if node == end:
            return time
        for neighbor, distance, speed in graph.get(node, []):
            travel_time = distance / speed
            new_time = time + travel_time
            if new_time < dist.get(neighbor, float('inf')):
                dist[neighbor] = new_time
                heapq.heappush(heap, (new_time, neighbor))
    return -1
```

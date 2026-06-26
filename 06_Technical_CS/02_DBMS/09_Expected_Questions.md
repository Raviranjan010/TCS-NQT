# DBMS - Expected Questions (TCS NQT)

This file contains expected questions on Database Management Systems (DBMS) for the TCS NQT exam.

---

## 1. DBMS-01: SQL JOIN operations

*   **Question**: Explain different types of SQL JOINs and write the corresponding query examples.
*   **Concepts**: Inner Join, Left Join, Right Join, Full Outer Join.
*   **Comparison Table**:
| JOIN Type | Result Set |
| :--- | :--- |
| **INNER JOIN** | Returns records that have matching values in both tables. |
| **LEFT JOIN** | Returns all records from left table, and matching records from right. |
| **RIGHT JOIN** | Returns all records from right table, and matching records from left. |
| **FULL JOIN** | Returns all records when there is a match in either left or right table. |

*   **Example SQL Query**:
```sql
-- Select employee name and department name
SELECT Employees.emp_name, Departments.dept_name
FROM Employees
INNER JOIN Departments ON Employees.dept_id = Departments.dept_id;
```

---

## 2. DBMS-02: Normalization (1NF to BCNF)

*   **Question**: Outline normal forms (1NF, 2NF, 3NF, BCNF) and their rules.
*   **Rules Table**:
| Normal Form | Rule constraint |
| :--- | :--- |
| **1NF** | Single-valued (atomic) attributes. No repeating groups. |
| **2NF** | In 1NF + No partial dependencies (every non-prime attribute is fully dependent on the primary key). |
| **3NF** | In 2NF + No transitive dependencies ($A \rightarrow B$ and $B \rightarrow C$ is forbidden if $C$ is non-prime). |
| **BCNF** | For every dependency $X \rightarrow Y$, $X$ must be a super key. |

*   **Worked Example (BCNF violation)**:
    *   Relation `StudentCourse(StudentID, CourseID, Instructor)` where `StudentID, CourseID` is candidate key.
    *   If `Instructor` teaches only one `Course`, we have: `Instructor -> CourseID`.
    *   This is in 3NF, but violates BCNF because `Instructor` is not a super key. Solution: Decompose into `StudentInstructor(StudentID, Instructor)` and `InstructorCourse(Instructor, CourseID)`.

---

## 3. DBMS-03: Finding Candidate Keys

*   **Question**: Write an algorithm/procedure to determine Candidate Keys from a set of Functional Dependencies (FDs).
*   **Derivation Heuristic**:
    1.  Compute closure of attributes.
    2.  Find attributes that never appear on the right side of any functional dependency. These *must* be part of any candidate key.
    3.  Compute the closure of this starting set. If it yields all attributes, it is the Candidate Key.
    4.  If not, add other attributes to form combinations and test closures.

*   **Worked Example**:
    *   Relation $R(A, B, C, D)$, FDs: $\{A \rightarrow B, B \rightarrow C, C \rightarrow D\}$
    *   Attribute $A$ never appears on the right side.
    *   Compute closure of $A$:
        *   $A^+ = \{A\}$
        *   Using $A \rightarrow B \implies A^+ = \{A, B\}$
        *   Using $B \rightarrow C \implies A^+ = \{A, B, C\}$
        *   Using $C \rightarrow D \implies A^+ = \{A, B, C, D\}$
    *   Since $A^+$ contains all attributes, $A$ is the unique Candidate Key.

---

## 4. DBMS-04: ACID Properties

*   **Question**: Detail the ACID properties in database transaction management.
*   **ACID Definitions**:
    *   **Atomicity**: "All or nothing". Either the entire transaction succeeds, or it is completely rolled back.
    *   **Consistency**: A transaction must transform the database from one valid state to another, preserving all integrity constraints.
    *   **Isolation**: Transactions execute concurrently without interfering with one another. Intermediate states are invisible to other transactions.
    *   **Durability**: Once a transaction is committed, its changes are permanently written to non-volatile storage, surviving subsequent system failures.
*   **Trap**: Isolation levels (Read Uncommitted, Read Committed, Repeatable Read, Serializable) determine the trade-offs between speed and consistency, resolving concurrency anomalies (Dirty Read, Non-repeatable Read, Phantom Read).

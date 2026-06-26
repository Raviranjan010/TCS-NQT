# Database Management Systems (DBMS) - Concept Guide

This guide covers the core DBMS principles, structures, and SQL concepts tested in the TCS NQT Prime technical sections. It is structured to build concrete mental models and eliminate common errors.

---

## 1. Normalization Matrix (1NF to BCNF)

Normalization is the process of organizing data in a database to reduce redundancy and eliminate anomalies (Insertion, Update, Deletion).

| Normal Form | Definition | Violation Scenario | Fix / Resolution |
| :--- | :--- | :--- | :--- |
| **1NF** | • All attributes must contain atomic (indivisible) values.<br>• No repeating groups or multi-valued attributes. | **Table:** `Employee`<br>• Columns: `EmpID`, `Project`<br>• Row: `101 \| ProjectA, ProjectB` <br>*(Project contains multiple values)* | Split the multi-valued attribute into separate rows:<br>• Row 1: `101 \| ProjectA`<br>• Row 2: `101 \| ProjectB` |
| **2NF** | • Must be in **1NF**.<br>• No **Partial Dependency** (no non-prime attribute should depend on a subset of a composite candidate key). | **Table:** `Enrollment`<br>• PK: `(StudentID, CourseID)`<br>• Row: `S1, C1, CourseFee`<br>*Here, CourseFee depends only on CourseID, which is a part of the primary key.* | Decompose the table into:<br>1. `StudentEnrollment(StudentID, CourseID)`\n2. `CourseDetails(CourseID, CourseFee)` |
| **3NF** | • Must be in **2NF**.<br>• No **Transitive Dependency** (no non-prime attribute should depend on another non-prime attribute). | **Table:** `Employee`<br>• PK: `EmpID`<br>• Row: `101, DeptID, DeptName`<br>*Here, DeptName depends on DeptID, which in turn depends on EmpID.* | Decompose the table into:<br>1. `Employee(EmpID, DeptID)`\n2. `Department(DeptID, DeptName)` |
| **BCNF** | • Must be in **3NF**.<br>• For every functional dependency $X \rightarrow Y$, $X$ must be a **Super Key**. | **Table:** `StudentSubject`<br>• Key: `(StudentID, Subject)`<br>• Row: `S1, Math, Prof_Sharma`<br>*Prof_Sharma teaches Math (Prof $\rightarrow$ Subject). But Prof is not a super key.* | Decompose the table into:<br>1. `StudentTeacher(StudentID, Teacher)`\n2. `TeacherSubject(Teacher, Subject)` |

---

## 2. Key Systems in Relational Databases

Keys enforce referential integrity and identify records uniquely.

```
       ┌────────────────────────────────────────────────────────┐
       │                       SUPER KEYS                       │
       │   ┌────────────────────────────────────────────────┐   │
       │   │                 CANDIDATE KEYS                 │   │
       │   │   ┌──────────────┐                             │   │
       │   │   │ PRIMARY KEY  │   (Minimal Super Keys)      │   │
       │   │   └──────────────┘                             │   │
       │   └────────────────────────────────────────────────┘   │
       └────────────────────────────────────────────────────────┘
```

| Key Type | Definition | Worked Example |
| :--- | :--- | :--- |
| **Super Key** | Any set of one or more attributes that collectively identify unique rows in a table. | In a table `Employee(EmpID, Email, Name)`, the super keys are: `{EmpID}`, `{Email}`, `{EmpID, Name}`, `{Email, Name}`, `{EmpID, Email, Name}`. |
| **Candidate Key** | A minimal super key (a super key from which you cannot remove any attribute without losing the uniqueness property). | In the `Employee` table above, the candidate keys are `{EmpID}` and `{Email}` because both are individually unique and minimal. |
| **Primary Key** | The specific candidate key chosen by the database designer to uniquely identify rows. Cannot contain NULL values. | `{EmpID}` is selected as the primary key. |
| **Foreign Key** | An attribute or collection of attributes in one table that uniquely identifies a row of another table (creates a link). | In table `Project(ProjID, LeaderEmpID)`, the attribute `LeaderEmpID` is a Foreign Key referencing `EmpID` in the `Employee` table. |
| **Composite Key** | A primary key consisting of two or more attributes, used when a single attribute cannot guarantee uniqueness. | In table `ExecutionLog(ServerID, Timestamp, Status)`, the primary key is the composite key `{ServerID, Timestamp}`. |

---

## 3. SQL Joins - Visual Representation & Output Tables

Joins combine rows from two or more tables based on a related column.

### Sample Input Tables
*   **Users Table (`U`)**
    ```
    +--------+---------+
    | UserID | Name    |
    +--------+---------+
    | 1      | Alice   |
    | 2      | Bob     |
    | 3      | Charlie |
    +--------+---------+
    ```
*   **Orders Table (`O`)**
    ```
    +---------+--------+---------+
    | OrderID | UserID | Product |
    +---------+--------+---------+
    | 101     | 1      | Laptop  |
    | 102     | 2      | Mouse   |
    | 103     | 4      | Router  |
    +---------+--------+---------+
    ```

---

### Inner Join
*   **Concept:** Returns records that have matching values in both tables.
*   **ASCII Diagram:**
    ```
      (  Users  ( Match )  Orders  )
                 ^^^^^^^
    ```
*   **SQL Query:**
    ```sql
    SELECT U.UserID, U.Name, O.OrderID, O.Product
    FROM Users U INNER JOIN Orders O ON U.UserID = O.UserID;
    ```
*   **Output Table:**
    ```
    +--------+-------+---------+---------+
    | UserID | Name  | OrderID | Product |
    +--------+-------+---------+---------+
    | 1      | Alice | 101     | Laptop  |
    | 2      | Bob   | 102     | Mouse   |
    +--------+-------+---------+---------+
    ```

---

### Left Join (Left Outer Join)
*   **Concept:** Returns all records from the left table, and matching records from the right table. Fill unmatched right values with `NULL`.
*   **ASCII Diagram:**
    ```
      (  Users ( Match ) ) Orders
       ^^^^^^^^^^^^^^^^
    ```
*   **SQL Query:**
    ```sql
    SELECT U.UserID, U.Name, O.OrderID, O.Product
    FROM Users U LEFT JOIN Orders O ON U.UserID = O.UserID;
    ```
*   **Output Table:**
    ```
    +--------+---------+---------+---------+
    | UserID | Name    | OrderID | Product |
    +--------+---------+---------+---------+
    | 1      | Alice   | 101     | Laptop  |
    | 2      | Bob     | 102     | Mouse   |
    | 3      | Charlie | NULL    | NULL    |
    +--------+---------+---------+---------+
    ```

---

### Right Join (Right Outer Join)
*   **Concept:** Returns all records from the right table, and matching records from the left table. Fill unmatched left values with `NULL`.
*   **ASCII Diagram:**
    ```
         Users ( Match ) Orders )
               ^^^^^^^^^^^^^^^^^
    ```
*   **SQL Query:**
    ```sql
    SELECT U.UserID, U.Name, O.OrderID, O.Product
    FROM Users U RIGHT JOIN Orders O ON U.UserID = O.UserID;
    ```
*   **Output Table:**
    ```
    +--------+-------+---------+---------+
    | UserID | Name  | OrderID | Product |
    +--------+-------+---------+---------+
    | 1      | Alice | 101     | Laptop  |
    | 2      | Bob   | 102     | Mouse   |
    | NULL   | NULL  | 103     | Router  |
    +--------+-------+---------+---------+
    ```

---

### Full Outer Join
*   **Concept:** Returns all records when there is a match in either left or right table. Unmatched values on either side are filled with `NULL`.
*   **ASCII Diagram:**
    ```
      (  Users ( Match ) Orders  )
       ^^^^^^^^^^^^^^^^^^^^^^^^^
    ```
*   **SQL Query:**
    ```sql
    SELECT U.UserID, U.Name, O.OrderID, O.Product
    FROM Users U FULL OUTER JOIN Orders O ON U.UserID = O.UserID;
    ```
*   **Output Table:**
    ```
    +--------+---------+---------+---------+
    | UserID | Name    | OrderID | Product |
    +--------+---------+---------+---------+
    | 1      | Alice   | 101     | Laptop  |
    | 2      | Bob     | 102     | Mouse   |
    | 3      | Charlie | NULL    | NULL    |
    | NULL   | NULL    | 103     | Router  |
    +--------+---------+---------+---------+
    ```

---

## 4. ACID Properties & Real-World Analogies

Transactions are units of work. The ACID properties guarantee database reliability.

*   **Atomicity ("All or Nothing")**
    *   *Definition:* A transaction must be completed in its entirety. If any part fails, the entire transaction is rolled back.
    *   *Real-world Analogy:* **ATM Cash Withdrawal**. The ATM must debit your bank account AND dispense the cash. If the machine runs out of cash mid-transaction, your bank account debit is rolled back.
*   **Consistency ("Invalid States Prevented")**
    *   *Definition:* A transaction must transition the database from one valid state to another, maintaining all schema constraints.
    *   *Real-world Analogy:* **Unique ID Validation**. If a system requires every customer to have a unique email address, the system will block a new transaction that attempts to register a duplicate email, maintaining database integrity.
*   **Isolation ("Independent Executions")**
    *   *Definition:* Concurrent execution of transactions must leave the database in the same state as if they were executed sequentially.
    *   *Real-world Analogy:* **Flight Seat Booking**. Two users, Alice and Bob, select the same seat (14A) simultaneously. The system processes Alice's transaction in isolation, locking the seat. Bob's transaction is blocked and receives a "Seat Unavailable" notification.
*   **Durability ("Permanent Commits")**
    *   *Definition:* Once a transaction is committed, its effects are permanently saved in non-volatile storage, even during a system crash.
    *   *Real-world Analogy:* **Bank Ledger Logging**. After the bank prints a physical deposit receipt and logs the transaction to disk, a power outage in the bank does not wipe out your deposit.

---

## 5. Transaction Isolation Levels & Anomalies

Isolation levels trade off database performance against data consistency.

### Definitions of Anomaly Types
1.  **Dirty Read:** Transaction $T_1$ reads data modified by Transaction $T_2$ that has not yet been committed. If $T_2$ rolls back, $T_1$ is left with incorrect data.
2.  **Non-Repeatable Read:** Transaction $T_1$ reads a row. Transaction $T_2$ modifies that row and commits. When $T_1$ reads the same row again, it finds different values.
3.  **Phantom Read:** Transaction $T_1$ reads a set of rows matching a condition. Transaction $T_2$ inserts a new row matching that condition and commits. When $T_1$ executes the query again, a new "phantom" row appears.

### Isolation Levels Matrix

| Isolation Level | Dirty Read Anomaly | Non-Repeatable Read | Phantom Read Anomaly |
| :--- | :--- | :--- | :--- |
| **READ UNCOMMITTED** | Allowed | Allowed | Allowed |
| **READ COMMITTED** | **Prevented** | Allowed | Allowed |
| **REPEATABLE READ** | **Prevented** | **Prevented** | Allowed |
| **SERIALIZABLE** | **Prevented** | **Prevented** | **Prevented** |

---

## 6. ER Diagram Symbols and Cardinality

Entity-Relationship (ER) diagrams model database structure.

*   **Rectangle:** Strong Entity (independent existence, e.g., `Employee`).
*   **Double Rectangle:** Weak Entity (existence depends on a strong owner entity, e.g., `Dependent`).
*   **Oval:** Attribute (property of an entity, e.g., `Salary`).
*   **Oval with Underlined Text:** Key Attribute (uniquely identifies an entity, e.g., `<u>EmpID</u>`).
*   **Double Oval:** Multi-valued Attribute (can have multiple values, e.g., `{PhoneNumbers}`).
*   **Dashed Oval:** Derived Attribute (computed from other attributes, e.g., `Age` from `DateOfBirth`).
*   **Diamond:** Relationship (association between entities, e.g., `Works_In`).
*   **Double Diamond:** Identifying Relationship (connects a weak entity to a strong entity).
*   **Cardinality Ratios:**
    *   `1:1` (One-to-One): One employee manages one department.
    *   `1:N` (One-to-Many): One department has many employees.
    *   `N:M` (Many-to-Many): Many students enroll in many courses.

---

## 7. Top 15 TCS NQT MCQ One-Liners

**Q1.** What is the default isolation level in MySQL InnoDB?
*   **A:** REPEATABLE READ.

**Q2.** Which anomaly is prevented by the 2-Phase Locking (2PL) protocol?
*   **A:** Serializability violations (ensures conflict serializability).

**Q3.** What SQL constraint implements referential integrity?
*   **A:** FOREIGN KEY.

**Q4.** What normal form is violated if a non-prime attribute transitively depends on the primary key?
*   **A:** 3NF (Third Normal Form).

**Q5.** In which phase of 2-Phase Locking (2PL) are locks acquired?
*   **A:** The Growing Phase (locks are only acquired, none are released).

**Q6.** Which database system component restores the database to a consistent state after a crash?
*   **A:** The Recovery Manager (using log files).

**Q7.** What does a double-bordered rectangle represent in an ER diagram?
*   **A:** A weak entity.

**Q8.** What operation is equivalent to a Cartesian product followed by a selection?
*   **A:** Theta Join (or Inner Join).

**Q9.** Can a candidate key contain a NULL value?
*   **A:** Yes, unlike a primary key, candidate keys can theoretically contain NULL values unless explicitly declared `NOT NULL`.

**Q10.** What is the minimum number of tables required to represent a Many-to-Many relationship in a relational schema?
*   **A:** Three tables (two entity tables and one bridge/junction table).

**Q11.** What relational algebra operation removes duplicate rows automatically?
*   **A:** Projection (and Union/Set Difference).

**Q12.** What is the difference between a Clustered and a Non-Clustered index?
*   **A:** A clustered index determines the physical order of data rows on disk (only 1 per table); a non-clustered index uses a separate structure to store pointers to the data rows.

**Q13.** Which property of ACID ensures that concurrent transactions do not interfere with each other?
*   **A:** Isolation.

**Q14.** What division operation is represented by $\div$ in relational algebra?
*   **A:** Division (used for queries containing "for all" or "every" constraints).

**Q15.** What normal form requires that the left-hand side of every functional dependency is a super key?
*   **A:** Boyce-Codd Normal Form (BCNF).

---

## 8. Dissecting TCS NQT Trap Questions

### Question 1: Lossless Join Decomposition
Decompose table $R(A, B, C)$ with FD $A \rightarrow B$ into $R_1(A, B)$ and $R_2(B, C)$. Is this decomposition lossless?
*   A) Yes, because $B$ is the common attribute.
*   B) No, because $B$ is not a candidate key in either table.
*   C) Yes, because the intersection $R_1 \cap R_2 = \{B\}$ is a key of $R_1$.
*   D) No, because $R_1 \cap R_2$ must be a super key in at least one of the decomposed tables.
*   **Correct Answer:** **D**
*   **Trap Explanation:** A common mistake is selecting A because $B$ is present in both tables. However, for a join to be lossless, the common attribute ($B$) must be a super key in at least one of the decomposed schemas. Since we only have $A \rightarrow B$, the common attribute $B$ is not a super key of either $R_1$ or $R_2$, making the join lossy.

### Question 2: Group By & Select Constraints
Analyze the following SQL query:
```sql
SELECT DeptID, Name, AVG(Salary)
FROM Employee
GROUP BY DeptID;
```
*   A) Runs successfully and returns the department averages.
*   B) Fails because of aggregate functions in the SELECT clause.
*   C) Fails because `Name` is not part of the GROUP BY clause or an aggregate function.
*   D) Runs successfully but returns only the first employee's name for each department.
*   **Correct Answer:** **C**
*   **Trap Explanation:** Option D is a common misconception. In standard SQL, every column in the SELECT clause that is not part of an aggregate function (like `AVG`) MUST be included in the GROUP BY clause. Since `Name` is omitted from the GROUP BY clause, this query throws a syntax error.

### Question 3: 3NF vs. BCNF Relationships
Which statement is correct regarding 3NF and BCNF?
*   A) Every table in BCNF is also in 3NF.
*   B) Every table in 3NF is also in BCNF.
*   C) BCNF permits transitive dependencies under certain conditions.
*   D) 3NF is stricter than BCNF.
*   **Correct Answer:** **A**
*   **Trap Explanation:** Candidates often swap these two. BCNF is a stricter form of 3NF. Thus, BCNF implies 3NF (every BCNF table is in 3NF), but a 3NF table is not necessarily in BCNF.

### Question 4: Count(*) vs. Count(ColName)
Given a table `Users` with 5 rows, where the `Email` column has values: `['a@x.com', 'b@x.com', NULL, 'd@x.com', NULL]`.
What do `COUNT(*)` and `COUNT(Email)` return?
*   A) Both return 3.
*   B) Both return 5.
*   C) `COUNT(*)` returns 5, `COUNT(Email)` returns 3.
*   D) `COUNT(*)` returns 3, `COUNT(Email)` returns 5.
*   **Correct Answer:** **C**
*   **Trap Explanation:** Option B is selected by those who forget that aggregate functions exclude NULL values. `COUNT(*)` counts every row regardless of content, returning 5. `COUNT(Email)` excludes the two NULL values and counts only the 3 valid strings.

### Question 5: Natural Join Attribute Match
If table $R(A, B, C)$ has 10 rows and table $S(C, D)$ has 5 rows, and there are no matching values in column $C$ between the two tables, how many rows will $R \bowtie S$ (Natural Join) return?
*   A) 50
*   B) 15
*   C) 10
*   D) 0
*   **Correct Answer:** **D**
*   **Trap Explanation:** Students sometimes confuse Natural Join with a Cross Join (Cartesian Product) and multiply the rows ($10 \times 5 = 50$, Option A). A Natural Join requires matching values in the common column ($C$). Since there are no matching values, it behaves like an inner join with zero matches, returning 0 rows.

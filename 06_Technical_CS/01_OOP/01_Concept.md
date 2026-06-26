# Concept Guide: Object-Oriented Programming (OOP)

This file contains the exam-ready concepts, memory tricks, traps, and patterns for the Object-Oriented Programming section of the TCS NQT (Prime, 9 LPA target).

---

## 🎯 1. What TCS Actually Tests (Exam Focus)

*   **Virtual Functions & Binding:** Run-time polymorphism mechanics, including virtual tables (vtables) and virtual pointers (vptrs).
*   **Design Compliance:** Identifying violations of SOLID design principles in code snippets.
*   **Access Scoping:** Precise visibility rules under inheritance for `private`, `protected`, and `public` members.

---

## 📐 2. Key Concepts & TCS MCQs

| Term | Definition | Example | TCS Trick |
| :--- | :--- | :--- | :--- |
| **Encapsulation** | Bundling data (variables) and methods into a single unit (class) while restricting direct access. | Declaring fields `private` and exposing them via `public` getter/setter methods. | TCS tests accessing private variables of a parent class directly inside a child subclass (causes Compile Error). |
| **Polymorphism** | The ability of a message or function to be displayed in more than one form. | Method Overloading (compile-time) and Method Overriding (run-time). | Static and private methods cannot be overridden; they are bound at compile-time (Method Hiding). |
| **Abstraction** | Hiding internal implementation details and showing only the essential features. | Abstract classes and interfaces containing method declarations without definitions. | Abstract classes can have constructors and concrete methods; interfaces (in traditional OOP) only have abstract declarations. |
| **Inheritance** | A mechanism where a new class inherits properties and behaviors of an existing class. | A class `Car` inheriting from a class `Vehicle`. | Multiple class inheritance is disallowed in Java/C# due to the **Diamond Problem**; interfaces must be used instead. |
| **SOLID** | A set of 5 design principles for writing clean, maintainable, and decoupled code. | Single Responsibility (S), Open/Closed (O), Liskov (L), Interface Segregation (I), Dependency Inversion (D). | TCS asks you to identify which SOLID principle is violated when a subclass breaks parent class behavior (Liskov Substitution). |

---

## 🖼️ 3. Visual Memory Diagram: Abstract Class vs. Interface

```
                  OOP Abstraction Framework
                              |
       +----------------------+----------------------+
       |                                             |
[Abstract Class]                                 [Interface]
  - Partial abstraction (0-100%)                   - Full abstraction (100%)
  - Can have instance variables                    - Variables are implicitly public static final
  - Supports constructors                          - No constructors allowed
  - Single inheritance only                        - Multiple implementation supported
```

---

## 💡 4. Top 15 MCQ Topics & 1-Line Key Answers

1.  **Class:** A user-defined blueprint or prototype from which objects are created.
2.  **Object:** An instance of a class that possesses state and behavior.
3.  **Constructor:** A special member function invoked automatically when an object is created to initialize it.
4.  **Destructor:** A function called automatically when an object goes out of scope to release system resources.
5.  **Virtual Function:** A member function in a base class that you expect to redefine in derived classes to enable run-time polymorphism.
6.  **Friend Function:** A function defined outside a class that has permission to access the class's private and protected members.
7.  **Operator Overloading:** Giving special meaning to an operator (like `+`, `*`) relative to user-defined data types.
8.  **Multiple Inheritance:** A feature where a class can inherit from more than one parent class (causes diamond problem).
9.  **Diamond Problem:** Ambiguity that arises when a class inherits from two classes that both inherit from a single common superclass.
10. **Liskov Substitution:** Derived classes must be completely substitutable for their base classes without breaking functionality.
11. **Interface Segregation:** Clients should not be forced to depend on interfaces they do not use (prefer small, focused interfaces).
12. **Dependency Inversion:** High-level modules should depend on abstractions (interfaces) rather than concrete implementations.
13. **Method Overloading:** Multiple methods in the same class sharing the same name but possessing different parameter lists.
14. **Method Overriding:** A subclass redefining a method present in the superclass with the identical signature.
15. **Virtual Destructor:** Used in base classes to ensure that derived class destructors are called correctly during deletion via a base class pointer.

---

## ⚠️ 5. Common Trap Questions (Where Students Lose Marks)

### Trap 1: Modifying Variables in Interfaces
*   **Code Pattern:** A class implements an interface and tries to increment a variable declared in the interface (e.g., `interface_var++`).
*   **The Trap:** Interface variables are implicitly `public static final` (constants).
*   **Correct Resolution:** Compilation fails with "cannot assign a value to final variable".

### Trap 2: Method Overriding with Static Binding
*   **Code Pattern:** Base class has `public static void show()`, derived class defines `public static void show()`. Object instantiated as `Base b = new Derived(); b.show();`.
*   **The Trap:** Students expect the derived class `show()` to be called.
*   **Correct Resolution:** Base class `show()` is called. Static methods cannot be overridden; they are bound at compile time based on reference type (Method Hiding).

### Trap 3: Constructor Chaining order
*   **Code Pattern:** Class B inherits from Class A. Class B's constructor initializes variables before calling `super()`.
*   **The Trap:** Compilation fails.
*   **Correct Resolution:** The call to `super()` or `this()` must be the absolute first statement in a constructor.

### Trap 4: Default Access Modifier under Inheritance
*   **Code Pattern:** Base class has default package-private visibility method, and derived class in a different package attempts to override it.
*   **The Trap:** Students expect polymorphism to work.
*   **Correct Resolution:** Package-private methods are not inherited outside their package, so overriding does not occur.

### Trap 5: Friend Class access limits
*   **Code Pattern:** Class A declares Class B as a `friend`. Class B tries to access Class A's private members. Then Class A tries to access Class B's private members.
*   **The Trap:** Friend relationship is symmetric (both can access).
*   **Correct Resolution:** Friendship is one-directional. Class B can access Class A, but Class A cannot access Class B unless explicitly declared.

---

## 🧠 6. Mnemonics & Memory Tricks

*   **Pillars of OOP (A Piece of PIE):**
    *   **A** - Abstraction
    *   **P** - Polymorphism
    *   **I** - Inheritance
    *   **E** - Encapsulation
*   **SOLID Principles (Decoupled Design):**
    *   **S**ingle Responsibility (One job)
    *   **O**pen/Closed (Open for extension, closed for modification)
    *   **L**iskov Substitution (Subclasses don't break parent expectations)
    *   **I**nterface Segregation (Keep interfaces thin)
    *   **D**ependency Inversion (Depend on abstractions, not concretions)

---

## 🚦 7. "Spot the Concept" in 5 Seconds

*   If the question code contains `virtual void func() = 0;` $\rightarrow$ **Abstract Class / Pure Virtual Function**.
*   If the question code contains `class Derived : public Base1, public Base2` $\rightarrow$ Check for **Diamond Problem** / Ambiguity.
*   If the question has a reference assignment like `Base* ptr = new Derived();` followed by a function call $\rightarrow$ Check if the base class function is marked `virtual`. If yes $\rightarrow$ **Derived class function runs** (dynamic binding). If no $\rightarrow$ **Base class function runs** (static binding).

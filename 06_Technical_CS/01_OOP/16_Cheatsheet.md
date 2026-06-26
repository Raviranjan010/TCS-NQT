# Cheatsheet: Object-Oriented Programming (OOP)

High-density exam review sheet for OOP concepts in the TCS NQT.

---

## 🔑 1. The 5 Golden Rules (Solve 80% of MCQs)

1.  **Check for Virtual Binding:** If a parent class pointer calls an overridden method, look for the `virtual` keyword in the parent. If present $\rightarrow$ Run-time binding (Derived method runs); if absent $\rightarrow$ Compile-time binding (Base method runs).
2.  **No Override for Static/Private:** Static, private, and final methods are always bound statically. They **cannot** be overridden; trying to redefine them in a subclass results in Method Hiding or a Compile Error.
3.  **Interface Constraints:** All variables in an interface are implicitly `public static final` (constants). They must be initialized at declaration and cannot be changed.
4.  **Liskov Substitution Principle (LSP):** A subclass must be substitutable for its parent. If a child class method throws an exception that the parent class method doesn't throw, it violates LSP.
5.  **Constructor Execution Order:** Parent constructors are always executed **before** child constructors. The call `super()` must be the very first statement inside a child's constructor.

---

## 📊 2. Member Access Scopes

| Modifier | Within Class | Within Package | Subclass (Inherited) | Outside Package |
| :--- | :--- | :--- | :--- | :--- |
| **private** | Yes | No | No | No |
| **default** | Yes | Yes | No | No |
| **protected** | Yes | Yes | Yes | No |
| **public** | Yes | Yes | Yes | Yes |

---

## 🎯 3. Recognition Triggers: Question Pattern $\rightarrow$ Method

| Pattern Seen | Underlying Concept | Method to Use |
| :--- | :--- | :--- |
| `class B : public A` + identical signature method | Run-time Polymorphism | Check for `virtual` keyword in parent. |
| Interface variable assignment modification | Constants in Interfaces | Spot modification (e.g. `val++`) $\rightarrow$ Output: **Compile Error**. |
| `Derived d;` output trace | Constructor Chaining | Trace output: **Parent Constructor** runs first, then **Child Constructor**. |
| Multiple class inheritance | Diamond Problem | Spot syntax error (classes cannot extend multiple classes; only interfaces support this). |

---

## ⚡ 4. Speed Tricks & Shortcuts

*   **The Virtual Destructor Rule:** If you delete a derived class object through a base class pointer and the base destructor is **not** virtual, only the base destructor runs $\rightarrow$ **Memory Leak**. Base destructor must be `virtual`.
*   **The Overload Check:** Overloaded methods must have **different parameter lists** (signatures). Changing only the return type does not overload the method and causes a compilation error.

---

## ⚠️ 5. Common Mistakes: Never vs. Always

*   **NEVER** assume static methods exhibit polymorphic behavior. They are bound to the class type, not the instance.
*   **ALWAYS** verify that the overridden method does not restrict the access modifier visibility of the parent method (e.g., overriding a `public` parent method as `private` causes a Compile Error).
*   **NEVER** instantiate an abstract class or interface using the `new` keyword directly (e.g., `new Vehicle()`).
*   **ALWAYS** put `super()` as the first line of the child constructor when customizing initialization.

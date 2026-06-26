# OOP - Expected Questions (TCS NQT)

This file contains expected questions on Object-Oriented Programming (OOP) for the TCS NQT exam.

---

## 1. OOP-01: Diamond Problem & Virtual Inheritance

*   **Question**: Explain the Diamond Problem in multiple inheritance and how C++ solves it using Virtual Inheritance.
*   **Concepts**: Multiple Inheritance, Diamond Problem, Virtual Base Class.
*   **C++14 Example**:
```cpp
#include <iostream>

class A {
public:
    void show() { std::cout << "Class A\n"; }
};

// Virtual inheritance avoids duplicate subobjects of A in D
class B : virtual public A {};
class C : virtual public A {};

class D : public B, public C {};

int main() {
    D obj;
    obj.show(); // Compiles cleanly, no ambiguity!
    return 0;
}
```

### Analysis
*   **The Diamond Problem**: When class `D` inherits from both `B` and `C`, and both `B` and `C` inherit from `A`. If `A` has a member function `show()`, then `D` inherits two copies of `show()` (one via `B` and one via `C`). Calling `obj.show()` triggers a compiler error due to ambiguity.
*   **Resolution**: Declaring `B` and `C` to inherit `virtual`ly from `A` ensures that only one instance of the base class `A` is shared by both `B` and `C`.
*   **Trap**: Forgetting to use `virtual` in intermediate classes. If class `B` is virtual but `C` is not, ambiguity still occurs.

---

## 2. OOP-02: Compile-Time vs Run-Time Polymorphism

*   **Question**: Distinguish between compile-time polymorphism (function overloading) and run-time polymorphism (virtual functions).
*   **Comparison**:
| Feature | Compile-Time Polymorphism | Run-Time Polymorphism |
| :--- | :--- | :--- |
| **Mechanism** | Function Overloading, Operator Overloading | Method Overriding (Virtual Functions) |
| **Binding** | Early Binding (Static Binding) | Late Binding (Dynamic Binding) |
| **Execution Speed** | Faster (resolved during compilation) | Slower (requires vptr/vtable dereference) |

*   **C++14 Example**:
```cpp
#include <iostream>

class Base {
public:
    virtual void display() { std::cout << "Base Display\n"; }
};

class Derived : public Base {
public:
    void display() override { std::cout << "Derived Display\n"; }
};

int main() {
    Base* ptr = new Derived();
    ptr->display(); // Output: "Derived Display" (Run-Time Polymorphism)
    delete ptr;
    return 0;
}
```

*   **Shortcut**: If the function has the keyword `virtual`, it is resolved at run-time using the VTABLE pointer. Otherwise, it is static binding.

---

## 3. OOP-03: Abstract Classes & Pure Virtual Functions

*   **Question**: What is an Abstract Class? How do you create an interface in C++?
*   **Explanation**:
    *   An **Abstract Class** is a class containing at least one **pure virtual function** (a function declared with `= 0`).
    *   You cannot instantiate an abstract class. It serves as a blueprint for derived classes.
    *   An **Interface** is a class where *all* member functions are pure virtual, containing no implementation or state.

*   **C++14 Example**:
```cpp
#include <iostream>

class Shape {
public:
    // Pure Virtual Function
    virtual double getArea() = 0;
};

class Rectangle : public Shape {
private:
    double width, height;
public:
    Rectangle(double w, double h) : width(w), height(h) {}
    double getArea() override { return width * height; }
};
```

---

## 4. OOP-04: Constructor/Destructor Call Order & Virtual Destructors

*   **Question**: In what order are constructors and destructors called in inheritance? Why do we need virtual destructors?
*   **Key Rules**:
    *   **Constructor Order**: Base first, then Derived.
    *   **Destructor Order**: Derived first, then Base (reverse order of constructor calls).
    *   **Virtual Destructors**: If a Base class pointer points to a Derived class object, deleting the pointer without a virtual destructor only calls the Base class destructor, causing a memory leak (Derived class resources are not freed).

*   **C++14 Example**:
```cpp
#include <iostream>

class Base {
public:
    Base() { std::cout << "Base Constructor\n"; }
    virtual ~Base() { std::cout << "Base Destructor\n"; } // Virtual destructor
};

class Derived : public Base {
public:
    Derived() { std::cout << "Derived Constructor\n"; }
    ~Derived() override { std::cout << "Derived Destructor\n"; }
};

int main() {
    Base* ptr = new Derived();
    delete ptr; // Calls Derived Destructor first, then Base Destructor
    return 0;
}
```

# Flashcards: Object-Oriented Programming (OOP)

## Card 1:
**FRONT:** Are private members of a parent class inherited by a child subclass?
**BACK:** No, private members are only accessible within the declaring class itself.
**Difficulty:** Easy

---

## Card 2:
**FRONT:** What is the implicit access modifier and attributes of interface variables?
**BACK:** They are implicitly `public static final` (constants).
**Difficulty:** Medium

---

## Card 3:
**FRONT:** What compile error occurs when trying to inherit from two class parents?
**BACK:** The compiler rejects multiple inheritance due to the Diamond Problem.
**Difficulty:** Easy

---

## Card 4:
**FRONT:** How does a virtual function resolve method binding at run-time?
**BACK:** By using a virtual pointer (vptr) to look up the correct address in the virtual table (vtable).
**Difficulty:** Hard

---

## Card 5:
**FRONT:** Can you override a static method?
**BACK:** No, redefining a static method in a subclass is Method Hiding, not overriding.
**Difficulty:** Medium

---

## Card 6:
**FRONT:** What is Liskov Substitution Principle (LSP) in one sentence?
**BACK:** Subclasses must be substitutable for their parent classes without breaking functionality.
**Difficulty:** Medium

---

## Card 7:
**FRONT:** What happens if the base class destructor is not declared virtual when deleting via pointer?
**BACK:** The derived class destructor is not called, leading to a memory leak.
**Difficulty:** Hard

---

## Card 8:
**FRONT:** What is the difference between Method Overloading and Method Overriding?
**BACK:** Overloading is compile-time (same name, different parameters); Overriding is run-time (same name and parameters).
**Difficulty:** Easy

---

## Card 9:
**FRONT:** Where must the `super()` call be placed in a child class constructor?
**BACK:** It must always be the absolute first statement of the child constructor.
**Difficulty:** Easy

---

## Card 10:
**FRONT:** Can an interface contain a constructor?
**BACK:** No, interfaces cannot have constructors because they cannot hold state or be instantiated directly.
**Difficulty:** Medium

---

## Card 11:
**FRONT:** If you change only the return type of a method, does it overload it?
**BACK:** No, changing only the return type causes a compilation error (duplicate method signature).
**Difficulty:** Medium

---

## Card 12:
**FRONT:** What does the Dependency Inversion Principle require?
**BACK:** High-level modules should depend on abstractions (interfaces) rather than concrete implementations.
**Difficulty:** Hard

---

## Card 13:
**FRONT:** What access modifier provides visibility to subclasses in other packages?
**BACK:** The `protected` modifier (accessible inside subclasses, even in different packages).
**Difficulty:** Medium

---

## Card 14:
**FRONT:** What is encapsulation in terms of class components?
**BACK:** Bundling data (fields) and functions (methods) into a class while restricting direct access.
**Difficulty:** Easy

---

## Card 15:
**FRONT:** What does a friend function do in C++?
**BACK:** It allows a non-member function to access private and protected members of a class.
**Difficulty:** Hard

---

## Card 16:
**FRONT:** What is the Single Responsibility Principle (SRP)?
**BACK:** A class should have one, and only one, reason to change (single focus).
**Difficulty:** Easy

---

## Card 17:
**FRONT:** What is the Diamond Problem?
**BACK:** Ambiguity when a class inherits from two parent classes that both derive from a single grandparent.
**Difficulty:** Medium

---

## Card 18:
**FRONT:** Can abstract classes have concrete (implemented) methods?
**BACK:** Yes, abstract classes can contain both abstract (unimplemented) and concrete methods.
**Difficulty:** Medium

---

## Card 19:
**FRONT:** If `Base b = new Derived()` is run, and `show()` is overridden (but not virtual in C++), which runs?
**BACK:** The Base class `show()` runs due to static compile-time binding.
**Difficulty:** Hard

---

## Card 20:
**FRONT:** What is the main benefit of Polymorphism?
**BACK:** It allows one interface to control access to a general class of actions (code extensibility).
**Difficulty:** Easy

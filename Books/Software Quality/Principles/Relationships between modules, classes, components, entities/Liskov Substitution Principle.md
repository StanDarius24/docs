##### _If for each object o1 of type S there is an object o2 of type T such that for all programs P defined in terms of T, the behavior of P is unchanged when o1 is substituted for o2 then S is a subtype of T._

DEPENDS OF OPEN/CLOSE PRINCIPLE

The Liskov Substitution Principle (LSP) was introduced by **Barbara Liskov**. It applies to inheritance in such a way that the **derived classes must be completely substitutable for their base classes**. In other words, if class A is a subtype of class B, then we should be able to replace B with A without interrupting the behavior of the program.
It extends the open-close principle and also focuses on the behavior of a superclass and its subtypes. We should design the classes to preserve the property unless we have a strong reason to do otherwise. Let's understand the principle through an example.

```java
public class Student {
	private double height;
	private double mark;
}
public class Person extends Student {
// not possible, person cannot have marks
}
```

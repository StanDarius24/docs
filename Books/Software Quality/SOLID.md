#books #softwareQuality 

The one and only Uncle Bob (Robert C.Martin).

---

These principles establish practices that lend to developing software with considerations for maintaining and extending as the project grows. Adopting these practices can also contribute to avoiding code smells, refactoring code, and Agile or Adaptive software development.

---

SOLID stands for:

-   **S** - Single-responsiblity Principle
-   **O** - Open-closed Principle
-   **L** - Liskov Substitution Principle
-   **I** - Interface Segregation Principle
-   **D** - Dependency Inversion Principle

---

## Single-Responsibility Principle

##### A class should have one and only one reason to change, meaning that a class should have only one job.

Implementation of multiple functionalities in a single class mashup the code and if any modification is required may affect the whole class. It precise the code and the code can be easily maintained.

A bad example:

```java
public class Student  {  
	public void printDetails() {  
		 //functionality of the method  
	}  
	pubic void calculatePercentage() {  
		//functionality of the method  
	}  
	public void addStudent() {  
		//functionality of the method  
	}  
}
```

How this should be done:

```java
public class Student {
	public void addStudent() {
	
	}
}
```
```java
public class PrintStudentDetails {
	public void printDetails() {
	
	}
}
```
```java
public class Percentage {
	public void calculatePercentage() {
	
	}
}
```

---

## Open-Closed Principle

##### Objects or entities should be open for extension but closed for modification.

Bad example:

```java
public class VehicleInfo {
	public double vehicleNumber(Vehicle vcl) {
		if (vcl instanceof Car) {
		} else if (vcl instanceof Bike) {
		}
	}
}
```

Good Example:

```java
public class VehicleInfo {
	public double vehicleNumber() {
	}
}
public class Car extends VehicleInfo {
	 public double vehicleNumber() {
	 }
}
public class Car extendsTruck {
	public double vehicleNumber() {
	}
}
```

---

## Liskov Substitution Principle

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

---

## Interface Segregation Principle

##### A client should never be forced to implement an interface that it doesn’t use, or clients shouldn’t be forced to depend on methods they do not use.

The I  in SOLID stands for interface segregation, and it simply means that **larger interfaces should be split into smaller ones. By doing so, we can ensure that implementing classes only need to be concerned about the methods that are of interest to them.**

Suppose, we have created an interface named **Conversion** having three methods **intToDouble(), intToChar(),** and **charToString()**.

```java
public interface Conversion {  
  public void intToDouble();  
  public void intToChar();  
  public void charToString();  
}
```

The above interface has three methods. If we want to use only a method intToChar(), we have no choice to implement the single method. To overcome the problem, the principle allows us to split the interface into three separate ones.

```java
public interface ConvertIntToDouble {  
	public void intToDouble();  
}   
public interface ConvertIntToChar {  
	public void intToChar();  
}  
public interface ConvertCharToString {  
	public void charToString();  
}
```

---

## Dependency Inversion Principle

##### The principle of dependency inversion refers to the decoupling of software modules. This way, instead of high-level modules depending on low-level modules, both will depend on abstractions.

The principle states that we must use abstraction (abstract classes and interfaces) instead of concrete implementations.

```java
public class WindowsMachine {  
}

public class WindowsMachine {  
	public final keyboard;  
	public final monitor;  
	public WindowsMachine() {  
		monitor = new monitor();  //instance of monitor class  
		keyboard = new keyboard(); //instance of keyboard class  
	}  
}
```

Now we can work on the Windows machine with the help of a keyboard and mouse. But we still face the problem. Because we have tightly coupled the three classes together by using the new keyword. It is hard o test the class windows machine.

To make the code loosely coupled, we decouple the WindowsMachine from the keyboard by using the Keyboard interface and this keyword.

```java
public interface Keyboard {   

}
public class WindowsMachine {  
	private final Keyboard keyboard;  
	private final Monitor monitor;  
	public WindowsMachine(Keyboard keyboard, Monitor monitor) {  
		this.keyboard = keyboard;  
		this.monitor = monitor;  
	}  
}
```

#softwareQuality 

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

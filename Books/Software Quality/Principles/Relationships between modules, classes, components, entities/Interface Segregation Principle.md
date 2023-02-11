#softwareQuality 
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

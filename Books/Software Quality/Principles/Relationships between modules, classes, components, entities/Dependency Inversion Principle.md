#softwareQuality 

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

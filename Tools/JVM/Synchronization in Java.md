Multi-threaded programs may often come to a situation where multiple threads try to access the same resources and finally produce erroneous and unforeseen results.

---

### Java Synchronized Blocks

Java provides a way of creating threads and synchronizing their tasks using synchronized blocks. 

A synchronized block in Java is synchronized on some object. All synchronized blocks synchronize on the same object and can only have one thread executed inside them at a time. All other threads attempting to enter the synchronized block are blocked until the thread inside the synchronized block exits the block.

This synchronization is implemented in Java with a concept called monitors or locks. Only one thread can own a monitor at a given time. When a thread acquires a lock, it is said to have entered the monitor. All other threads attempting to enter the locked monitor will be suspended until the first thread exits the monitor.

---

## Types of Synchronization

There are two synchronizations in Java mentioned below:

1. Process Synchronization
2. Thread Synchronization

### 1. Process Synchronization in Java

Process Synchronization is a technique used to coordinate the execution of multiple processes. It ensures that the shared resources are safe and in order.

### 2. Thread Synchronization in Java

Thread Synchronization is used to coordinate and ordering of the execution of the threads in a multi-threaded program. There are two types of thread synchronization are mentioned below:

- Mutual Exclusive
- Cooperation (Inter-thread communication in Java)

### Mutual Exclusive

Mutual Exclusive helps keep threads from interfering with one another while sharing data. There are three types of Mutual Exclusive mentioned below:

- Synchronized method.
We can declare a method as synchronized using the [_“synchronized”_](https://www.geeksforgeeks.org/synchronized-in-java/) keyword. This will make the code written inside the method thread-safe so that no other thread will execute while the resource is shared.
- Synchronized block.
If we declare a block as synchronized, only the code which is written inside that block is executed sequentially not the complete code. This is used when we want sequential access to some part of code or to synchronize some part of code.
- Static synchronization.
In this, the synchronized method is declared as **“static”** which means the lock or monitor is applied on the class not on the object so that only one thread will access the class at a time.

```java
// A Java program to demonstrate working of
// synchronized.

import java.io.*;
import java.util.*;

// A Class used to send a message
class Sender {
	public void send(String msg)
	{
		System.out.println("Sending\t" + msg);
		try {
			Thread.sleep(1000);
		}
		catch (Exception e) {
			System.out.println("Thread interrupted.");
		}
		System.out.println("\n" + msg + "Sent");
	}
}

// Class for send a message using Threads
class ThreadedSend extends Thread {
	private String msg;
	Sender sender;

	// Receives a message object and a string
	// message to be sent
	ThreadedSend(String m, Sender obj)
	{
		msg = m;
		sender = obj;
	}

	public void run()
	{
		// Only one thread can send a message
		// at a time.
		synchronized (sender)
		{
			// synchronizing the send object
			sender.send(msg);
		}
	}
}

// Driver class
class SyncDemo {
	public static void main(String args[])
	{
		Sender send = new Sender();
		ThreadedSend S1 = new ThreadedSend(" Hi ", send);
		ThreadedSend S2 = new ThreadedSend(" Bye ", send);

		// Start two threads of ThreadedSend type
		S1.start();
		S2.start();

		// wait for threads to end
		try {
			S1.join();
			S2.join();
		}
		catch (Exception e) {
			System.out.println("Interrupted");
		}
	}
}

```
\>>
```bash
Sending     Hi 

 Hi Sent
Sending     Bye 

 Bye Sent
```

---

### Example of the synchronized method by using an anonymous class

```java
// Java Pogram to synchronized method by
// using an anonymous class
import java.io.*;

class Test {
	synchronized void test_function(int n)
	{
		// synchronized method
		for (int i = 1; i <= 3; i++) {
			System.out.println(n + i);
			try {
				Thread.sleep(500);
			}
			catch (Exception e) {
				System.out.println(e);
			}
		}
	}
}

// Driver Class
public class GFG {
	// Main function
	public static void main(String args[])
	{
		// only one object
		final Test obj = new Test();

		Thread a = new Thread() {
			public void run() { obj.test_function(15); }
		};

		Thread b = new Thread() {
			public void run() { obj.test_function(30); }
		};

		a.start();
		b.start();
	}
}

```
\>>
```bash
16
17
18
31
32
33
```

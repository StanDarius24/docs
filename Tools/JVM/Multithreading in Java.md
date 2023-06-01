
Threads can be created by using two mechanisms : 

1. Extending the Thread class 
2. Implementing the Runnable Interface

---

**Thread creation by extending the Thread class**

We create a class that extends the **java.lang.Thread** class. This class overrides the run() method available in the Thread class. A thread begins its life inside run() method. We create an object of our new class and call start() method to start the execution of a thread. Start() invokes the run() method on the Thread object.

```java
class MultithreadingDemo extends Thread {
	public void run() {
		try {
			System.out.println(
				"Thread " + Thread.currentThread().getId()
				+ " is running");
		}
		catch (Exception e) {
			System.out.println("Exception is caught");
		}
	}
}

public class Multithread {
	public static void main(String[] args) {
		int n = 8; // Number of threads
		for (int i = 0; i < n; i++) {
			MultithreadingDemo object
				= new MultithreadingDemo();
			object.start();
		}
	}
}

```

---

**Thread creation by implementing the Runnable Interface**

We create a new class which implements java.lang.Runnable interface and override run() method. Then we instantiate a Thread object and call start() method on this object.

```java
class MultithreadingDemo implements Runnable {
	public void run() {
		try {
			System.out.println(
				"Thread " + Thread.currentThread().getId()
				+ " is running");
		} catch (Exception e) {
			System.out.println("Exception is caught");
		}
	}
}

class Multithread {
	public static void main(String[] args) {
		int n = 8; // Number of threads
		for (int i = 0; i < n; i++) {
			Thread object
				= new Thread(new MultithreadingDemo());
			object.start();
		}
	}
}
```

---

**Thread Class vs Runnable Interface** 

1. If we extend the Thread class, our class cannot extend any other class because Java doesn’t support multiple inheritance. But, if we implement the Runnable interface, our class can still extend other base classes.
2. We can achieve basic functionality of a thread by extending Thread class because it provides some inbuilt methods like yield(), interrupt() etc. that are not available in Runnable interface.
3. Using runnable will give you an object that can be shared amongst multiple threads.

---

# Lifecycle and States of a Thread in Java

A `thread` in Java at any point of time exists in any one of the following states:
1. New
2. Runnable
3. Blocked
4. Waiting
5. Timed Waiting
6. Terminated

#### Life Cycle of a thread

1. **New Thread:** When a new thread is created, it is in the new state. The thread has not yet started to run when the thread is in this state. When a thread lies in the new state, its code is yet to be run and hasn’t started to execute.
2. **Runnable State:** A thread that is ready to run is moved to a runnable state. In this state, a thread might actually be running or it might be ready to run at any instant of time. It is the responsibility of the thread scheduler to give the thread, time to run.   
    A multi-threaded program allocates a fixed amount of time to each individual thread. Each and every thread runs for a short while and then pauses and relinquishes the CPU to another thread so that other threads can get a chance to run. When this happens, all such threads that are ready to run, waiting for the CPU and the currently running thread lie in a runnable state.
3. **Blocked/Waiting state:** When a thread is temporarily inactive, then it’s in one of the following states: 
    - Blocked
    - Waiting
4. **Timed Waiting:** A thread lies in a timed waiting state when it calls a method with a time-out parameter. A thread lies in this state until the timeout is completed or until a notification is received. For example, when a thread calls sleep or a conditional wait, it is moved to a timed waiting state.
5. **Terminated State:** A thread terminates because of either of the following reasons: 
    - Because it exits normally. This happens when the code of the thread has been entirely executed by the program.
    - Because there occurred some unusual erroneous event, like segmentation fault or an unhandled exception.

### Implementing the Thread States in Java

In Java, to get the current state of the thread, use **Thread.getState()** method to get the current state of the thread. Java provides **java.lang.Thread.State** class that defines the ENUM constants for the state of a thread, as a summary of which is given below: 

#### 1. New 

Declaration: public static final Thread.State NEW

**Description:** Thread state for a thread that has not yet started. 

#### 2. Runnable 

Declaration: public static final Thread.State RUNNABLE

**Description:** Thread state for a runnable thread. A thread in the runnable state is executing in the Java virtual machine but it may be waiting for other resources from the operating system such as a processor. 

#### 3. Blocked 

Declaration: public static final Thread.State BLOCKED

**Description:** Thread state for a thread blocked waiting for a monitor lock. A thread in the blocked state is waiting for a monitor lock to enter a synchronized block/method or reenter a synchronized block/method after calling Object.wait(). 

#### 4. Waiting 

Declaration: public static final Thread.State WAITING

**Description:** Thread state for a waiting thread. A thread is in the waiting state due to calling one of the following methods: 

- Object.wait with no timeout
- [Thread.join] with no timeout
- LockSupport.park

#### 5. Timed Waiting 

Declaration: public static final Thread.State TIMED_WAITING

**Description:** Thread state for a waiting thread with a specified waiting time. A thread is in the timed waiting state due to calling one of the following methods with a specified positive waiting time: 

- Thread.sleep
- Object.wait with timeout
- Thread.join with timeout
- LockSupport.parkNanos
- LockSupport.parkUntil

#### 6. Terminated 

Declaration: public static final Thread.State TERMINATED

**Description:** Thread state for a terminated thread. The thread has completed execution.

---

# Java Thread Priority in Multithreading

As we already know java being completely object-oriented works within a [multithreading environment] in which [thread scheduler]assigns the processor to a thread based on the priority of thread. Whenever we create a thread in Java, it always has some priority assigned to it. Priority can either be given by JVM while creating the thread or it can be given by the programmer explicitly.

**Priorities in threads** is a concept where each thread is having a priority which in layman’s language one can say every object is having priority here which is represented by numbers ranging from 1 to 10. 

- The default priority is set to 5 as excepted.
- Minimum priority is set to 1.
- Maximum priority is set to 10.

Here 3 constants are defined in it namely as follows:

1. public static int NORM_PRIORITY
2. public static int MIN_PRIORITY
3. public static int MAX_PRIORITY
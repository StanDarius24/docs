
The major concepts in Java Memory Management :

-   JVM Memory Structure
-   Working of Garbage Collector

---

### Java Memory Structure:

JVM defines various run time data area which are used during execution of a program. Some areas are created by the JVM, whereas some are created by the threads that are used in a program. However, the memory area created by JVM is destroyed only when the JVM exits. The data areas of the thread are created during instantiation and destroyed when the thread exits.

![[Pasted image 20230517142150.png]]

---

### Heap :

- It is a shared runtime data area and stores the actual object in a memory. It is instantiated during the virtual machine startup.
- This memory is allocated for all class instances and array. The heap can be of fixed or dynamic size, depending upon the system’s configuration.
- JVM provides the user control to initialize or vary the size of heap as per the requirement. When a new keyword is used, the object is assigned a space in heap, but the reference of the same exists onto the stack.
- There exists one and only one heap for a running JVM process.
```java
Scanner sc = new Scanner(System.in);
```
The above statement creates the object of Scanner class which gets allocated to the heap, whereas the reference ‘sc’ gets pushed to the stack.

---

### Method Area:

-   It is a logical part of the heap area and is created on virtual machine startup.
-   This memory is allocated for class structures, method data and constructor field data, and also for interfaces or special method used in class. The heap can be of fixed or dynamic size depending upon the system’s configuration.
-   Can be of a fixed size or expanded as required by the computation. Needs not to be contiguous.

`Note: Though method area is logically a part of heap, it may or may not be garbage collected even if garbage collection is compulsory in heap area.`

---

### JVM Stacks

-   A stack is created at the same time when a thread is created and is used to store data and partial results which will be needed while returning value for the method and performing dynamic linking.
-   Stacks can either be of fixed or dynamic size. The size of a stack can be chosen independently when it is created.
-   The memory for the stack requires not to be contiguous.

---

### Native method Stacks:

Also called as C stacks, native method stacks are not written in Java language. This memory is allocated for each thread when it is created. And it can be of fixed or dynamic nature.

---

### Program counter (PC) registers:

Each JVM thread which carries out the task of a specific method has a program counter register associated with it. The non native method has a PC which stores the address of the available JVM instruction whereas in a native method, the value of program counter is undefined. PC register is capable of storing the return address or a native pointer on some specific platform.

---

### Working of a Garbage Collector:

-   JVM triggers this process and as per the JVM garbage collection process is done or else withheld. It reduces the burden of programmer by automatically performing the allocation or deallocation of memory.
-   Garbage collection process causes the rest of the processes or threads to be paused and thus is costly in nature. This problem is unacceptable for the client, but can be eliminated by applying several garbage collector based algorithms. This process of applying algorithm is often termed as **Garbage Collector tuning** and is important for improving the performance of a program.
-   Another solution is the generational garbage collectors that adds an age field to the objects that are assigned a memory. As more and more objects are created, the list of garbage grows, thereby increasing the garbage collection time. On the basis of how many clock cycles the objects have survived, objects are grouped and are allocated an ‘age’ accordingly. This way the garbage collection work gets distributed.
-   In the current scenario, all garbage collectors are generational, and hence, optimal.

`**System.gc()** and **Runtime.gc()** are the methods which requests for Garbage collection to JVM explicitly but it doesn’t ensures garbage collection as the final decision of garbage collection is of JVM only.`

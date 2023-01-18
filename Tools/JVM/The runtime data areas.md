![[Pasted image 20230118235059.png]]

This **subsystem** represents **JVM memory**. The areas are used for different purposes during the program execution.

-   **PC register** holds the address of the currently executing instruction;
-   **stack area** is a memory place where method calls and local variables are stored;
-   **native method stack** stores native method information;
-   **heap** stores all created objects (instances of classes);
-   **method area** stores all the class level information like class name, immediate parent class name, method information and all static variables.

Every thread has its own **PC register**, **stack**, and **native method stack**, but all threads share the same **heap** and **method area.**

# Execution engine
It is responsible for executing the program (bytecode). It interacts with various data areas of the JVM when executing a bytecode.

The execution engine has the following parts:

-   **bytecode interpreter** interprets the bytecode line by line and executes it (rather slowly);
-   **just-in-time compiler** (JIT compiler) translates bytecode into native machine language while executing the program (it executes the program faster than the interpreter);
-   **garbage collector** cleans unused objects from the heap.

Different JVM implementations can contain both a **bytecode interpreter** and a **just-in-time compiler**, or only one of them. Do not confuse them with the javac (source code to bytecode compiler); it's not included in the JVM.
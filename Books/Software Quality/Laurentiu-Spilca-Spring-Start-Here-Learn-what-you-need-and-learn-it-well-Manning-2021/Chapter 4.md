 - Using interfaces to define contracts;
 - Using abstractions for beans in the Spring context;
 - Using dependency injection with abstractions;

---

4.1 Using interfaces to define contracts
In Java, the interface is an abstract structure you use to declare a specific responsibility. An object implementing the interface has to define this responsibility. More objects implementing the same interface can define the responsibility declared by that interface in different ways. We can say that the interface specifies the “what needs to happen,” while every object implementing the interface specifies the “how it should happen.”

4.1.1 Using interfaces for decoupling implementations
Because the two objects are strongly coupled, if you want to change the sorting responsibility, you also need to change the object using this responsibility. A better design would allow you to change the sorting responsibility without changing the object that uses the responsibility.

How can we improve this design? When changing an object’s responsibility, we want to avoid the need to change other objects using the changed responsibility. 
You now can have more objects implementing the same interface. This allows you to change the implementation (the how) without affecting the object that consumes the implementation.

4.1.2 The requirement of the scenario
We need to design the objects and find the right responsibilities and abstractions for implementing this feature.

4.1.3 Implementing the requirement without using a framework
A POJO is a simple object without dependencies, only described by its attributes and methods. In our case, the Comment class defines a POJO describing the details of a comment by its two attributes: author and text.

4.2 Using dependency injection with abstractions
At the end of the section, we’ll discuss more on the stereotype annotations. You’ll find out @Component is not the only stereotype annotation you can use and when you should use other annotations.

4.2.1 Deciding which objects should be part of the Spring context

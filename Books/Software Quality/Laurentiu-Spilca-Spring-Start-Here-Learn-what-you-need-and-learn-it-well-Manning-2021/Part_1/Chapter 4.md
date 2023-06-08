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

You might think you need to add all the app objects in the Spring context, but this is not the case. So the decision should be easy and based on the question, “Does this object need to be managed by the framework?”
Adding objects to the Spring context without needing the framework to manage them adds unnecessary complexity to your app, making the app both more challenging to maintain and less performant. If you add the object to be managed by Spring without getting any benefit from the framework, you just over-engineer your implementation.

We use stereotype annotations for the classes that Spring needs to create instances and add these instances to its context. It doesn’t make sense to add stereotype annotations on interfaces or abstract classes because these cannot be instantiated. Syntactically, you can do this, but it is not useful. The classes we’ll mark with the @Component stereotype annotation are shaded gray. When the context is loaded, Spring creates instances of these classes and adds them to its context.

4.2.2 Choosing what to auto-wire from multiple implementations of an abstraction

Let’s go one step further and discuss what happens if the Spring context contains
more instances that match a requested abstraction. This scenario can happen in real world projects, and you need to know how to handle these cases to make your app work as expected.
- Using the `@Primary` annotation to mark one of the beans for implementation as the default
- Using the `@Qualifier` annotation to name a bean and then refer to it by its name for DI

Spring needs to decide which of the multiple existing implementations it should choose to inject. The first solution is using @Primary. The only thing you need to do is add @Primary near the @Component annotation to mark the implementation provided by this class as the default for implementation, as shown in the following listing.

When you want Spring to inject one of these, you just need to specify the implementation’s name using the @Qualifier annotation again. In the next listing, you find out how to inject a specific implementation as a dependency of the CommentService object.

4.3 Focusing on object responsibilities with stereotype annotations

In real-world projects, it’s a common practice to define the component’s purpose
using the stereotype annotation explicitly. Using @Component is generic and gives you no detail about the responsibility of the object you’re implementing. But developers generally use objects with some known responsibilities.
The services are the objects with the responsibility of implementing the use cases, while repositories are the objects managing the data persistence. Because these responsibilities are so common in projects, and they are important in the class design, having a distinctive way of marking them helps the developer better understand the app design.
Spring offers us the @Service annotation to mark a component that takes the
responsibility of a service and the @Repository annotation to mark a component that implements a repository responsibility. All three (@Component, @Service, and @Repository) are stereotype annotations and instruct Spring to create and add an instance of the annotated class to its context.
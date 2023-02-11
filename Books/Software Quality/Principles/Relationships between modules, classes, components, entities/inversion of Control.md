#softwareQuality 

IoC inverts the flow of control. It's also known as the Hollywood Principle, "Don't call us, we'll call you". A design principle in which custom-written portions of a computer program receive the flow of control from a generic framework. It carries the strong connotation that the reusable code and the problem-specific code are developed independently even though they operate together in an application.

Why
-   Increase modularity of the program and make it extensible.
-   To decouple the execution of a task from implementation.
-   To focus a module on the task it is designed for.
-   To free modules from assumptions about other systems and instead rely on contracts.
-   To prevent side effects when replacing a module.

How
-   Using Factory pattern
-   Using Service Locator pattern
-   Using Dependency Injection
-   Using contextualized lookup
-   Using Template Method pattern
-   Using Strategy pattern
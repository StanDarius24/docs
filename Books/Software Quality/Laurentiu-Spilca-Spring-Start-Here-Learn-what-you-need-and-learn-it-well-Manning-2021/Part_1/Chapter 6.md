---
Aspect-oriented programming (AOP)
Using aspects
Using the aspect execution chain
---

Aspects are a way the framework intercepts method calls and possibly alters the execution of methods. You can affect the execution of specific method calls you select. This technique helps you extract part of the logic belonging to the executing method. In certain scenarios, decoupling a part of the code helps make that method easier to understand. It allows the developer to focus only on the relevant details discussed when reading the method logic.

Another important reason for learning aspects is that Spring uses them in implementing a lot of the crucial capabilities it offers. Understanding how the framework works can save you many hours of debugging later when you face a specific problem. A pertinent example of Spring capability that uses aspects is `transactionality`.
`Transactionality` is one of the main capabilities most apps use today
to keep the persisted data’s consistency. Another significant capability relying on aspects is security configurations, which help your app protect its data and make sure data cannot be seen or changed by unwanted individuals.

---

6.1 How aspects work in Spring

An aspect is simply a piece of logic the framework executes when you call specific methods of your choice. When designing an aspect, you define the following:
- What code you want Spring to execute when you call specific methods. This is named an aspect.
- When the app should execute this logic of the aspect (e.g., before or after the method call, instead of the method call). This is named the advice.
- Which methods the framework needs to intercept and execute the aspect for them. This is named a pointcut.

With aspects terminology, you’ll also find the concept of a join point, which defines the event that triggers the execution of an aspect. But with Spring, this event is always a method call.
`To become an aspect target, the object needs to be a bean in the Spring context. Spring needs to know the objects it has to manage.`

We want <ins>some logic</ins> (The aspect) to be executed <ins>before</ins> (The advice) each <ins>execution</ins> (the join point) of <ins>method publishComment(),</ins> (the pointcut) which belongs to <ins>the CommentService bean</ins> (the target object).

The aspect terminology. Spring executes some logic (the aspect) when someone calls a specific method (the pointcut). We need to specify when the logic is executed according to the pointcut (e.g., before). The when is the advice. For Spring to intercept the method, the object that defines the intercepted method needs to be a bean in the Spring context. So, the bean becomes the target object of the aspect.

But how does Spring intercept each method call and apply the aspect logic? As discussed earlier in this section, the object needs to be a bean in the Spring context. But because you made the object an aspect target, Spring won’t directly give you an instance reference for the bean when you request it from the context. Instead, Spring gives you an object that calls the aspect logic instead of the actual method. We say that Spring gives you a proxy object instead of the real bean. You will now receive the proxy instead of the bean anytime you get the bean from the context, either if you directly use the getBean() method of the context or if you use DI. This approach is named weaving.

Calling an aspected method assumes you call the method through the proxy object provided by Spring. The proxy applies the aspect logic and delegates the call to the actual method.

---

6.2 Implementing aspects with Spring AOP

You have to add these dependencies.

```xml
<dependency>
	<groupId>org.springframework</groupId>
	<artifactId>spring-context</artifactId>
</dependency>
<dependency>
	<groupId>org.springframework</groupId>
	<artifactId>spring-aspects</artifactId>
</dependency>
```

- Enable the aspect mechanism in your Spring app by annotating the configuration class with the @EnableAspectJAutoProxy annotation.
```java
@Configuration
@ComponentScan(basePackages = "services")
@EnableAspectJAutoProxy
public class ProjectConfig {
}
```
-  Create a new class, and annotate it with the @Aspect annotation. Using either @Bean or stereotype annotations, add a bean for this class in the Spring context.
```java
@Aspect
public class LoggingAspect {
}
```
- Define a method that will implement the aspect logic and tell Spring when and which methods to intercept using an advice annotation.
```java
@Around("execution(* services.*.*(..))")
public void log(ProceedingJoinPoint joinPoint) {
}
```
- Implement the aspect logic.
```java
@Around("execution(* services.*.*(..))")
public void log(ProceedingJoinPoint joinPoint) {
// aspect logic here
}
```

The @Aspect annotation isn’t a stereotype annotation. Using @Aspect, you
tell Spring that the class implements the definition of an aspect, but Spring won’t also create a bean for this class.

```java
@Aspect
public class LoggingAspect {
@Around("execution(* services.*.*(..))")
	public void log(ProceedingJoinPoint joinPoint) {
		joinPoint.proceed();
	}
}
```

The peculiar expression used as a parameter to the @Around annotation tells Spring which method calls to intercept. Don’t be intimidated by this expression! This expression language is called AspectJ pointcut language, and you won’t need to learn it by heart to use it. In practice, you don’t use complex expressions. When I need to write such an expression, I always refer to the documentation (http://mng.bz/4K9g).

## execution(* services.\*.\*(..))

- execution() is equivalent to saying “When the method is called . . .”
- The parameter given to execution() specifies the methods whose execution is intercepted.
- This (*) means the intercepted method may have any returned type.
- This means the intercepted method must be in the services package.
- This (*) means the intercepted method can be in any class.
- This (*) means the intercepted method can have any name. All the methods are intercepted.
- This (..) means the intercepted method can have any parameters.

It means Spring intercepts any method defined in a class that is in the services package, regardless of the method’s return type, the class it belongs to, the name of the method, or the parameters the method receives.
Now let’s look at the second element I’ve added to the method: the Proceeding JoinPoint parameter, which represents the intercepted method. The main thing you do with this parameter is tell the aspect when it should delegate further to the actual method.

IMPLEMENT THE ASPECT LOGIC
- Intercepts the method;
- Displays something in the console before calling the intercepted method;
- Calls the intercepted method;
- Displays something in the console after calling the intercepted method;

	`Main`
	`main()` 
	
	-> The Logging aspect intercepts the mothod
		`LoggingAspect`
		`logger.info("Method will execute")` display smth in the console
		`joinPoint.proceed()` delegates to the intercepted method
		`logger.info("Method executed")` display smth in the console
		
		-> The LoggingAspect calls the incercepted method
			 `CommentService`
			`publishComment()`

You can even implement logic where the actual method isn’t called anymore. For example, an aspect that applies some authorization rules decides whether to delegate further to a method the app protects. If the authorization rules aren’t fulfilled, the aspect doesn’t delegate to the intercepted method it protects.

Okay, but would we ever want to have an aspect that changes the parameters of the intercepted method? Or its returned value? Yes. Sometimes it happens that such an approach is useful. Aspects are so powerful they can bring you to the “dark side” of hiding relevant code and make your app more difficult to maintain. Use aspects with caution!

---

6.2.3 Intercepting annotated methods

We want to define a custom annotation and log only the execution of the methods we mark using the custom annotation. To achieve this objective, you need to do the following:
1. Define a custom annotation, and make it accessible at runtime. We’ll call this annotation @ToLog.
2. Use a different AspectJ pointcut expression for the aspect method to tell the aspect to intercept the methods annotated with the custom annotation.
```java
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface ToLog { // define a custom annotation
}

@Aspect
public class LoggingAspect {
@Around("@annotation(ToLog)") //configure an aspect to intercept the
	public Object log(ProceedingJoinPoint jp) { // method with the
	// Omitted code                 newly created annotation
	}
}
```

The definition of the retention policy with `@Retention(RetentionPolicy.RUNTIME)` is critical. By default, in Java annotations `cannot be intercepted at runtime`. You need to explicitly specify that someone can intercept annotations by setting the retention policy to `RUNTIME`. The `@Target` annotation specifies which language elements we can use this annotation for. By default, you can annotate any language elements, but it’s always a good idea to restrict the annotation to only what you make it for.

```java
@Service
public class Demo {
	private Logger logger = Logger.getLogger(Demo.class.getName());
	
	@ToLog
	public void deleteDemo(Demo demo) {
		logger.info("Deleting demo:" + demo.getText());
	}
}
```

---

6.2.4 Other advice annotations you can use

`@Around`— This is indeed the most used of the advice annotations in Spring apps because you can cover any implementation case: you can do things before, after, or even instead of the intercepted method. You can alter the logic any way you want from the aspect.
But you don’t necessarily always need all this flexibility. A good idea is to look for the most straightforward way to implement what you need to implement. Any app implementation should be defined by simplicity.

Other than @Around, Spring offers the following advice annotations:
- @Before— Calls the method defining the aspect logic before the execution of the intercepted method.
- @AfterReturning— Calls the method defining the aspect logic after the method successfully returns, and provides the returned value as a parameter to the aspect method. The aspect method isn’t called if the intercepted method throws an exception.
- @AfterThrowing— Calls the method defining the aspect logic if the intercepted method throws an exception, and provides the exception instance as a parameter to the aspect method.
- @After—Calls the method defining the aspect logic only after the intercepted method execution, whether the method successfully returned or threw an exception.

---

6.3 The aspect execution chain
Suppose, for a method, we need to apply some security restrictions as well as log its executions. We have two aspects that take care of these responsibilities:
- SecurityAspect—Applies the security restrictions. This aspect intercepts the method, validates the call, and in some conditions doesn’t forward the call to the intercepted method (the details about how the SecurityAspect works aren’t relevant for our current discussion; just remember that sometimes this aspect doesn’t call the intercepted method).
- LoggingAspect—Logs the beginning and end of the intercepted method execution.

The order in which the aspects execute is important because executing the aspects in different orders can have different results. Take our example: we know that the SecurityAspect doesn’t delegate the execution in all the cases, so if we choose this aspect to execute first, sometimes the LoggingAspect won’t execute. If we expect the LoggingAspect to log the executions that failed due to security restrictions, this isn’t the way we need to go.
By default, Spring doesn’t guarantee the order in which two aspects in the
same execution chain are called. If the execution order is not relevant, then you just need to define the aspects and leave the framework to execute them in whatever order. If you need to define the aspects’ execution order, you can use the @Order annotation.

---

Summary:
- An aspect is an object that intercepts a method call and can execute logic before, after, and even instead of executing the intercepted method. This helps you decouple part of the code from the business implementation and makes your app easier to maintain.
- Using an aspect, you can write logic that executes with a method execution while being completely decoupled from that method. This way, someone who reads the code only sees what’s relevant regarding the business implementation.
- However, aspects can be a dangerous tool. Overengineering your code with aspects will make your app less maintainable. You don’t need to use aspects everywhere. When using them, make sure they really help your implementation.
- Aspects support many essential Spring capabilities like transactions and securing methods.
- To define an aspect in Spring, you annotate the class implementing the aspect logic with the @Aspect annotation. But remember that Spring needs to manage an instance of this class, so you need to also add a bean of its type in the Spring context.
- To tell Spring which methods an aspect needs to intercept, you use AspectJ pointcut expressions. You write these expressions as values to advise annotations. Spring offers you five advice annotations: @Around, @Before, @After, @AfterThrowing, and @AfterReturning. In most cases, we use @Around, which is also the most powerful.
- Multiple aspects can intercept the same method call. In this case, it’s recommended that you define an order for the aspects to execute using the @Order annotation.
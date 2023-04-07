1. Establishing relationships among beans;
2. Using dependency injection;
3. Accessing the beans from the Spring context through dependency injection.

1. 
-  Link the beans by directly calling the methods that create them (which we’ll call wiring).
- Enable Spring to provide us a value using a method parameter (which we’ll call auto-wiring).

If the object 1 bean already exists in the context, then instead of calling the createObject1() method, Spring will directly take the instance from its context. If the object 1 bean does not yet exist in the context, Spring calls the createObject1() method and returns the bean. Then the object2 set the field to object1.

---

Wiring the beans using the @Bean annotated method’s parameters

We create a method that returned an instance of an object 1, after that we define another method that returned an instance of an object 2, but takes as a parameter to the method an object 1, both methods are anotated with @Bean. As we already now when we turn on the app, spring calls the bean methods and sets its returned type to the application context, because of that spring will call the object 1 method, and after that will call the object 2 method using the reference from the object 1. Spring used dependency injection to do this trick. If we want to take a closer look, there is defined a mechanism that spring uses and it s called Ioc. (An application that’s not using the IoC principle controls the execution and makes use of various dependencies. An application using the IoC principle allows a dependency to control its execution. The DI is such an example of control. The framework (a dependency) sets a value into a field of an object of the app.)

---

Using the @Autowired annotation to inject beans

Using the @Autowired annotation, we mark an object’s property where we want Spring to inject a value from the context.

1.  Injecting the value in the field of the class, which you usually find in examples and proofs of concept
2.  Injecting the value through the constructor parameters of the class approach that you’ll use most often in real-world scenarios
3.  Injecting the value through the setter, which you’ll rarely use in production- ready code

1. Using @Autowired to inject the values through the class fields

3.2.1 
We instruct Spring to provide a bean from its context and set it directly as
the value of the field, annotated with @Autowired. This way we establish a relationship between the two beans.
Using the @Autowired annotation over the field, we instruct Spring to provide a value for that field from its context. Spring creates the two beans, object1 and object2, and injects the object2 to the field of the bean of type object1.

3.2.2 
Using @Autowired to inject the values through the constructor.
The stereotype annotation @Component instructs Spring to create and add a bean to the context of the type of this class: Object1.
When Spring creates the bean of type Object1, it calls the constructor
annotated with @Autowired. Spring provides a bean of type Object2 from
its context as value of the parameter.
When you define a parameter of the constructor, Spring provides a bean from its context as a value to that parameter when calling the constructor.
Now you can make the field `final`.

3.2.3 Using dependency injection through the setter
has more disadvantages than advantages, you can no longer make the field `final`.

Conclusion first option or second one.

---

3.3 Dealing with circular dependencies
A circular dependency (figure 3.11) is a situation in which, to create a bean (let’s name it Bean A), Spring needs to inject another bean that doesn’t exist yet (Bean B). But Bean B also requests a dependency to Bean A. So, to create Bean B, Spring needs first to have Bean A. Spring is now in a deadlock. It cannot create Bean A because it needs Bean B, and it cannot create Bean B because it needs Bean A.

Fix:
1. REDESIGN;
2. Use @Lazy;
```java
@Component 
public class CircularDependencyA { 

	private CircularDependencyB circB; 
	
	@Autowired 
	public CircularDependencyA(@Lazy CircularDependencyB circB) { 
		this.circB = circB;
	}

}
```
3. Setter/Field Injection;
4. @PostConstruct to set the dependency;
5. Implement ApplicationContextAware and InitializingBean
If one of the beans implements _ApplicationContextAware_, the bean has access to Spring context and can extract the other bean from there.
By implementing _InitializingBean_, we indicate that this bean has to do some actions after all its properties have been set. In this case, we want to manually set our dependency.
```java
@Component
public class CircularDependencyA implements ApplicationContextAware, InitializingBean {

    private CircularDependencyB circB;

    private ApplicationContext context;

    public CircularDependencyB getCircB() {
        return circB;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        circB = context.getBean(CircularDependencyB.class);
    }

    @Override
    public void setApplicationContext(final ApplicationContext ctx) throws BeansException {
        context = ctx;
    }
}
```

```java
@Component
public class CircularDependencyB {

    private CircularDependencyA circA;

    private String message = "Hi!";

    @Autowired
    public void setCircA(CircularDependencyA circA) {
        this.circA = circA;
    }

    public String getMessage() {
        return message;
    }
}
```

3.4 Choosing from multiple beans in the Spring context

1. The identifier of the parameter matches the name of one of the beans from the context (which, remember, is the same as the name of the method annotated with @Bean that returns its value). In this case, Spring will choose the bean for which the name is the same as the parameter.
2. The identifier of the parameter doesn’t match any of the bean names from the context. Then you have the following options:  
	- You marked one of the beans as primary (as we discussed in chapter 2, using the @Primary annotation). In this case, Spring will select the primary bean for injection.
	- You can explicitly select a specific bean using the @Qualifier annotation, which we discuss in this chapter.
	- If none of the beans is primary and you don’t use @Qualifier, the app will fail with an exception, complaining that the context contains more beans of the same type and Spring doesn’t know which one to choose.

```java
@Bean
public Parrot parrot2() {
	Parrot p = new Parrot();
	p.setName("Miki");
	return p;
}

@Bean
public Person person(Parrot parrot2)
```

One way to instruct Spring to provide you a specific instance from its context, when the context contains more than one instance of the same type, is to rely on the name of this instance. Just name the parameter the same as the instance you’d like Spring to provide you.

We should avoid this approach, instead we use @Qualifier annotation.

```java
@Bean
public Parrot parrot2() {
	Parrot p = new Parrot();
	p.setName("Miki");
	return p;
}

@Bean
public Person person(
@Qualifier("parrot2") Parrot parrot) 
```

---

Summary:
- The Spring context is a place in the app’s memory that the framework uses to keep the objects it manages. You need to add any object that needs to be augmented to the Spring context with a feature the framework offers.
- When implementing an app, you need to refer from one object to another. This way, an object can delegate actions to other objects when executing their responsibilities. To implement this behavior, you need to establish relationships among the beans in the Spring context.
- You can establish a relationship between two beans using one of three approaches:
	1) Directly referring to the @Bean annotated method that creates one of them from the method that creates the other. Spring knows you refer to the bean in the context, and if the bean already exists, it doesn’t call the same method again to create another instance. Instead, it returns the reference to the existing bean in the context. 
	2) Defining a parameter to the method annotated with @Bean. When Spring observes the @Bean method has a parameter, it searches a bean of that parameter’s type in its context and provides that bean as a value to the parameter.
	3) Using the @Autowired annotation in three ways: 
		- Annotate the field in the class where you want to instruct Spring to inject the bean from the context. You’ll find this approach often used in examples and proofs of concept.
		- Annotate the constructor you’d like Spring to call to create the bean. Spring will inject other beans from the context in the constructor’s parameters. You’ll find this approach the most used in real-world code.
		- Annotate the setter of the attribute where you’d like Spring to inject the bean from the context. You won’t find this approach typically used in production-ready code.
	4) Whenever you allow Spring to provide a value or reference through an attribute of the class or a method or constructor parameter, we say Spring uses DI, a technique supported by the IoC principle.
	5) The creation of two beans that depend on one another generates a circular dependency. Spring cannot create the beans with a circular dependency, and the execution fails with an exception. When configuring your beans, make sure you avoid circular dependencies.
	6) When Spring has more than one bean of the same type in its context, it can’t decide which of those beans need to be injected. You can tell Spring which is the instance it needs to inject by
		- using the @Primary annotation, which marks one of the beans as the default for dependency injection, or
		- naming the beans and injecting them by name using the @Qualifier annotation.

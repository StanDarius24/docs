
The Spring Context, defining beans.
You can add beans in the context in the following ways
 * Using the @Bean annotation
 * Using stereotype annotations
 * Programmatically

1. Define a configuration class (annotated with @Configuration) for your project, which, as we’ll discuss later, we use to configure the context of Spring.
2. Add a method to the configuration class that returns the object instance you want to add to the context and annotate the method with the @Bean annotation.
3. Make Spring use the configuration class defined in step 1. As you’ll learn later, we use configuration classes to write different configurations for the framework.

By adding the @Bean annotation, we instruct Spring to call this method when at context initialization and add the returned value to the context.

Defining a bean as primary
Earlier in this section we discussed that you could have multiple beans of the same kind in the Spring context, but you need to refer to them using their names. There’s another option when referring to beans in the context when you have more of the same type. When you have multiple beans of the same kind in the Spring context you can make one of them primary. You mark the bean you want to be primary using the @Primary annotation. A primary bean is the one Spring will choose if it has multiple options and you don’t specify a name; the primary bean is simply Spring’s default choice.

code snippets:

```java
public class App {

	public static void main(String[] args) {
		var context = new AnnotationConfigApplicationContext(ProjectConfig.class);
		var p1 = context.getBean(Parrot.class);
		var p2 = context.getBean("parrot2", Parrot.class);
		var p3 = context.getBean("riki", Parrot.class);
		
		System.out.println(p1.getName());
		System.out.println(p2.getName());
		System.out.println(p3.getName());
	}
}
```

```java
@Configuration
public class ProjectConfig {

	@Bean
	@Primary
	Parrot parrot1() {
		var p = new Parrot();
		p.setName("Koko");
		return p;
	}
	
	@Bean
	Parrot parrot2() {
		var p = new Parrot();
		p.setName("Miki");
		return p;
	}
	
	@Bean(name = "riki")
		Parrot parrot3() {
		var p = new Parrot();
		p.setName("Riki");
		return p;
	}

}
```

2.2.2  Using stereotype annotations to add beans to the Spring context

With stereotype annotations, you add the annotation above the class for which you need to have an instance in the Spring context. When doing so, we say that you’ve marked the class as a component. When the app creates the Spring context, Spring creates an instance of the class you marked as a component and adds that instance to its context.  We’ll still have a configuration class when we use this approach to tell Spring where to look for the classes annotated with stereotype annotations. Moreover, you can use both the approaches.
1. Using the @Component annotation, mark the classes for which you want Spring to add an instance to its context (in our case Parrot).
2. Using @ComponentScan annotation over the configuration class, instruct Spring on where to find the classes you marked.

```java
@Component
public class Parrot {
	private String name;
	public String getName() {
	return name;
}
```

```java
@Configuration
@ComponentScan(basePackages = {"main"})
public class ProjectConfig {
}
```

```java
public class App {
	public static void main(String[] args) {
		var context = new AnnotationConfigApplicationContext(ProjectConfig.class);
		var p = context.getBean(Parrot.class);
		p.setName("Koko");
		System.out.println(p.getName());
	}
}
```

By default, Spring doesn’t search for classes annotated with stereotype annotations, so if we just leave the code as-is, Spring won’t add a bean of type Parrot in its context. To tell Spring it needs to search for classes annotated with stereotype annotations, we use the @ComponentScan annotation over the configuration class. Also, with the @ComponentScan annotation, we tell Spring where to look for these classes.

---
Comparison:
 - Using the @Bean annotation:
1. You have full control over the instance creation you add to the Spring context. It is your responsibility to create and configure the instance in the body of the method annotated with @Bean. Spring only takes that instance and adds it to the context as-is.
2. You can use this method to add more instances of the same type to the Spring context. Remember, in section 2.1.1 we added three Parrot instances into the Spring context.
3. You can use the @Bean annotation to add to the Spring context any object instance. The class that defines the instance doesn’t need to be defined in your app. Remember, earlier we added a String and an Integer to the Spring context.
4. You need to write a separate method for each bean you create, which adds boilerplate code to your app. For this reason, we prefer using @Bean as a second option to stereotype annotations in our projects.

- Using stereotype annotations
1. You only have control over the instance after the framework creates it.
2. This way, you can only add one instance of the class to the context.
3. You can use stereotype annotations only to create beans of the classes your applica-tion owns. For example, you couldn’t add a bean of type String or Integer like we did in section 2.1.1 with the @Bean annotation because you don’t own these classes to change them by adding a stereotype annotation.
4. Using stereotype annotations to add beans to the Spring context doesn’t add boiler-plate code to your app. You’ll prefer this approach in general for the classes that belong to your app.

2.2.3 Programmatically adding beans to the Spring context.

```java
<T> void registerBean(String beanName, Class<T> beanClass, Supplier<T> supplier, BeanDefinitionCustomizer... customizers);
```

1. Use the first parameter `beanName` to define a name for the bean you add in the Spring context. If you don’t need to give a name to the bean you’re adding, you can use `null` as a value when you call the method.
2. The second parameter is the class that defines the bean you add to the context. Say you want to add an instance of the class `Parrot`; the value you give to this parameter is `Parrot.class`.
3. The third parameter is an instance of `Supplier`. The implementation of this Supplier needs to return the value of the instance you add to the context. Remember, `Supplier` is a functional interface you find in the `java.util.function` package. The purpose of a supplier implementation is to return a value you define without taking parameters.
4. The fourth and last parameter is a varargs of `BeanDefinitionCustomizer`. (If this doesn’t sound familiar, that’s okay; the `BeanDefinitionCustomizer` is just an interface you implement to configure different characteristics of the bean; e.g., making it primary.) Being defined as a varargs type, you can omit this parameter entirely, or you can give it more values of type `BeanDefinitionCustomizer`.

```java
public static void main(String[] args) {
	var context = new AnnotationConfigApplicationContext(ProjectConfig.class);
	Parrot x = new Parrot();
	x.setName("Kiki");
	Supplier<Parrot> parrotSupplier = () -> x;
	//context.registerBean("parrot1", Parrot.class, parrotSupplier);
	context.registerBean("parrot1", Parrot.class, parrotSupplier, bc -> bc.setPrimary(true));
	Parrot p = context.getBean(Parrot.class);
	System.out.println(p.getName());
}
```



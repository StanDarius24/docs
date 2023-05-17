#java #springBoot 

## 1. Overview

We can leverage the capabilities of Spring DI engine using the annotations in the _org.springframework.beans.factory.annotation_ and _org.springframework.context.annotation_ packages.

We often call these “Spring core annotations” and we'll review them in this tutorial.

---

## 2. DI-Related Annotations

Starting with Spring 2.5, the framework introduced annotations-driven _Dependency Injection_. The main annotation of this feature is _@Autowired__._ **It allows Spring to resolve and inject collaborating beans into our bean.**

#### 2.1.a Enabling _@Autowired_ Annotations

The Spring framework enables automatic dependency injection. In other words, **by declaring all the bean dependencies in a Spring configuration file, Spring container can autowire relationships between collaborating beans**. This is called **_Spring bean autowiring_**.

To use Java-based configuration in our application, let's enable annotation-driven injection to load our Spring configuration:

```java
@Configuration
@ComponentScan("com.baeldung.autowire.sample")
public class AppConfig {}
```

Alternatively, the [_<context:annotation-config>_ annotation](https://www.baeldung.com/spring-contextannotation-contextcomponentscan#:~:text=The%20%3Ccontext%3Aannotation%2Dconfig,annotation%2Dconfig%3E%20can%20resolve.) is mainly used to activate the dependency injection annotations in Spring XML files.

Moreover, **Spring Boot introduces the [_@SpringBootApplication_](https://www.baeldung.com/spring-boot-annotations#spring-boot-application) annotation**. This single annotation is equivalent to using _@Configuration_, _@EnableAutoConfiguration_, and _@ComponentScan_.

Let's use this annotation in the main class of the application:

```java
@SpringBootApplication
public class App {
    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
```
As a result, when we run this Spring Boot application, **it will automatically scan the components in the current package and its sub-packages**. Thus it will register them in Spring's Application Context, and allow us to inject beans using _@Autowired_.

#### 2.1.b Using _@Autowired_

After enabling annotation injection, **we can use autowiring on properties, setters, and constructors**.

#### 2.1.c @Autowired on Property
Let’s see how we can annotate a property using _@Autowired_. This eliminates the need for getters and setters.

First, let's define a _fooFormatter_ bean:

```java
@Component("fooFormatter")
public class FooFormatter {
    public String format() {
        return "foo";
    }
}
```
Then, we'll inject this bean into the _FooService_ bean using _@Autowired_ on the field definition:
```java
@Component
public class FooService {  
    @Autowired
    private FooFormatter fooFormatter;
}
```
As a result, Spring injects _fooFormatter_ when _FooService_ is created.

---

#### 2.1.d @Autowired_ on Setters
Now let's try adding _@Autowired_ annotation on a setter method.

In the following example, the setter method is called with the instance of _FooFormatter_ when _FooService_ is created:

```java
public class FooService {
    private FooFormatter fooFormatter;
    @Autowired
    public void setFormatter(FooFormatter fooFormatter) {
        this.fooFormatter = fooFormatter;
    }
}
```

#### 2.1.e @Autowired_ on Constructors
Finally, let's use _@Autowired_ on a constructor.

We'll see that an instance of _FooFormatter_ is injected by Spring as an argument to the _FooService_ constructor:
```java
public class FooService {
    private FooFormatter fooFormatter;
    @Autowired
    public FooService(FooFormatter fooFormatter) {
        this.fooFormatter = fooFormatter;
    }
}
```

---

#### 2.1.f @Autowired_ and Optional Dependencies
When a bean is being constructed, the _@Autowired_ dependencies should be available. Otherwise, **if Spring cannot resolve a bean for wiring, it will throw an exception**.

Consequently, it prevents the Spring container from launching successfully with an exception of the form:
```java
Caused by: org.springframework.beans.factory.NoSuchBeanDefinitionException: 
No qualifying bean of type [com.autowire.sample.FooDAO] found for dependency: 
expected at least 1 bean which qualifies as autowire candidate for this dependency. 
Dependency annotations: 
{@org.springframework.beans.factory.annotation.Autowired(required=true)}
```
To fix this, we need to declare a bean of the required type:
```java
public class FooService {
    @Autowired(required = false)
    private FooDAO dataAccessor; 
}
```

---

### 2.1.g Autowire Disambiguation
By default, Spring resolves _@Autowired_ entries by type. **If more than one bean of the same type is available in the container, the framework will throw a fatal exception**.

To resolve this conflict, we need to tell Spring explicitly which bean we want to inject.

#### Autowiring by _@Qualifier

For instance, let's see how we can use the [_@Qualifier_](https://www.baeldung.com/spring-qualifier-annotation) annotation to indicate the required bean.

First, we'll define 2 beans of type _Formatter_:
```java
@Component("fooFormatter")
public class FooFormatter implements Formatter {
    public String format() {
        return "foo";
    }
}
```

```java
@Component("barFormatter")
public class BarFormatter implements Formatter {
    public String format() {
        return "bar";
    }
}
```
Now let's try to inject a _Formatter_ bean into the _FooService_ class:
```java
public class FooService {
    @Autowired
    private Formatter formatter;
}
```
In our example, there are two concrete implementations of _Formatter_ available for the Spring container. As a result, **Spring will throw a _NoUniqueBeanDefinitionException_ exception when constructing the _FooService_**:
```java
Caused by: org.springframework.beans.factory.NoUniqueBeanDefinitionException: 
No qualifying bean of type [com.autowire.sample.Formatter] is defined: 
expected single matching bean but found 2: barFormatter,fooFormatter
```
**We can avoid this by narrowing the implementation using a _@Qualifier_ annotation:**

```java
public class FooService {
    @Autowired
    @Qualifier("fooFormatter")
    private Formatter formatter;
}
```
When there are multiple beans of the same type, it's a good idea to **use _@Qualifier_ to avoid ambiguity.**

Please note that the value of the _@Qualifier_ annotation matches with the name declared in the _@Component_ annotation of our _FooFormatter_ implementation.

---

### 2.1.h Autowiring by Custom Qualifier
Spring also allows us to **create our own custom _@Qualifier_ annotation**. To do so, we should provide the _@Qualifier_ annotation with the definition:
```java
@Qualifier
@Target({
  ElementType.FIELD, ElementType.METHOD, ElementType.TYPE, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
public @interface FormatterType {  
    String value();
}
```
Then we can use the _FormatterType_ within various implementations to specify a custom value:
```java
@FormatterType("Foo")
@Component
public class FooFormatter implements Formatter {
    public String format() {
        return "foo";
    }
}
```

```java
@FormatterType("Bar")
@Component
public class BarFormatter implements Formatter {
    public String format() {
        return "bar";
    }
}
```

Finally, our custom Qualifier annotation is ready to use for autowiring:

```java
@Component
public class FooService {  
    @Autowired
    @FormatterType("Foo")
    private Formatter formatter;
}
```

The value specified in the **_@Target_ meta-annotation restricts where to apply the qualifier,** which in our example is fields, methods, types, and parameters.

### 2.1.i Autowiring by Name

**Spring uses the bean's name as a default qualifier value.** It will inspect the container and look for a bean with the exact name as the property to autowire it.

Hence, in our example, Spring matches the _fooFormatter_ property name to the _FooFormatter_ implementation. Therefore, it injects that specific implementation when constructing _FooService_:
```java
public class FooService {
 @Autowired 
private Formatter fooFormatter; 
}
```

---

### 2.2. _@Bean_

There are several ways to configure beans in a Spring container. Firstly, we can declare them using XML configuration. We can also declare beans using the _@Bean_ annotation in a configuration class.

_@Bean_ marks a factory method which instantiates a Spring bean:
```java
@Bean
Engine engine() {
    return new Engine();
}
```
**Spring calls these methods** when a new instance of the return type is required.

The resulting bean has the same name as the factory method. If we want to name it differently, we can do so with the _name_ or the _value_ arguments of this annotation (the argument _value_ is an alias for the argument _name_):
```java
@Bean("engine")
Engine getEngine() {
    return new Engine();
}
```
Note, that all methods annotated with _@Bean_ must be in _@Configuration_ classes.

---

### 2.3. _@Qualifier_

We use _@Qualifier_ along with _@Autowired_ to **provide the bean id or bean name** we want to use in ambiguous situations.

For example, the following two beans implement the same interface:

```java
class Bike implements Vehicle {}

class Car implements Vehicle {}
```

If Spring needs to inject a _Vehicle_ bean, it ends up with multiple matching definitions. In such cases, we can provide a bean's name explicitly using the _@Qualifier_ annotation.

Using constructor injection:

```java
@Autowired
Biker(@Qualifier("bike") Vehicle vehicle) {
    this.vehicle = vehicle;
}
```
Using setter injection:
```java
@Autowired 
void setVehicle(@Qualifier("bike") Vehicle vehicle) { 
	this.vehicle = vehicle; 
}
```
Alternatively:
```java
@Autowired
@Qualifier("bike")
void setVehicle(Vehicle vehicle) {
    this.vehicle = vehicle;
}
```
Using field injection:
```java
@Autowired
@Qualifier("bike")
Vehicle vehicle;
```

For a more detailed description, please read [this article](https://www.baeldung.com/spring-autowire).

---

### 2.4. _@Required_

_@Required_ on setter methods to mark dependencies that we want to populate through XML:

```java
@Required
void setColor(String color) {
    this.color = color;
}
```

```xml
<bean class="com.baeldung.annotations.Bike"> 
	<property name="color" value="green" /> 
</bean>
```

---

### 2.5. _@Value_

We can use _@Value_ for injecting property values into beans. It's compatible with constructor, setter, and field injection.

Constructor injection:

```java
Engine(@Value("8") int cylinderCount) { 
	this.cylinderCount = cylinderCount; 
}
```

Setter injection:

```java
@Autowired 
void setCylinderCount(@Value("8") int cylinderCount) { 
	this.cylinderCount = cylinderCount; 
}
```

Alternatively:

```java
@Value("8") 
void setCylinderCount(int cylinderCount) { 
	this.cylinderCount = cylinderCount; 
}
```

Field injection:

```java
@Value("8") 
int cylinderCount;
```

Of course, injecting static values isn't useful. Therefore, we can use **placeholder strings** in _@Value_ to wire values **defined in external sources**, for example, in _.properties_ or _.yaml_ files.

Let's assume the following _.properties_ file:
`engine.fuelType=petrol`
We can inject the value of _engine.fuelType_ with the following:

```java
@Value("${engine.fuelType}") 
String fuelType;
```
We can use _@Value_ even with SpEL. More advanced examples can be found in our [article about _@Value_](https://www.baeldung.com/spring-value-annotation).

---

### 2.6. _@DependsOn_

We can use this annotation to make Spring **initialize other beans before the annotated one**. Usually, this behavior is automatic, based on the explicit dependencies between beans.

We only need this annotation **when the dependencies are implicit**, for example, JDBC driver loading or static variable initialization.

We can use _@DependsOn_ on the dependent class specifying the names of the dependency beans. The annotation's _value_ argument needs an array containing the dependency bean names:

```java
@DependsOn("engine")
class Car implements Vehicle {}
```

Alternatively, if we define a bean with the _@Bean_ annotation, the factory method should be annotated with _@DependsOn_:
```java
@Bean 
@DependsOn("fuel") 
Engine engine() { 
	return new Engine(); 
}
```

---

### 2.7. _@Lazy_

We use _@Lazy_ when we want to initialize our bean lazily. By default, Spring creates all singleton beans eagerly at the startup/bootstrapping of the application context.

However, there are cases when **we need to create a bean when we request it, not at application startup**.

This annotation behaves differently depending on where we exactly place it. We can put it on:

-   a _@Bean_ annotated bean factory method, to delay the method call (hence the bean creation)
-   a @_Configuration_ class and all contained _@Bean_ methods will be affected
-   a _@Component_ class, which is not a _@Configuration_ class, this bean will be initialized lazily
-   an _@Autowired_ constructor, setter, or field, to load the dependency itself lazily (via proxy)

This annotation has an argument named _value_ with the default value of _true_. It is useful to override the default behavior.

For example, marking beans to be eagerly loaded when the global setting is lazy, or configure specific _@Bean_ methods to eager loading in a _@Configuration_ class marked with _@Lazy_:

```java
@Configuration 
@Lazy 
class VehicleFactoryConfig { 
	@Bean 
	@Lazy(false) 
	Engine engine() { 
		return new Engine(); 
	} 
}
```
For further reading, please visit [this article](https://www.baeldung.com/spring-lazy-annotation).

---

### 2.8. _@Lookup_

A method annotated with _@Lookup_ tells Spring to return an instance of the method’s return type when we invoke it.
Detailed information about the annotation [can be found in this article](https://www.baeldung.com/spring-lookup).

---

### 2.9. _@Primary_

Sometimes we need to define multiple beans of the same type. In these cases, the injection will be unsuccessful because Spring has no clue which bean we need.

We already saw an option to deal with this scenario: marking all the wiring points with _@Qualifier_ and specify the name of the required bean.

However, most of the time we need a specific bean and rarely the others. We can use _@Primary_ to simplify this case: if **we mark the most frequently used bean with _@Primary_** it will be chosen on unqualified injection points:

```java
@Component
@Primary
class Car implements Vehicle {}

@Component
class Bike implements Vehicle {}

@Component
class Driver {
    @Autowired
    Vehicle vehicle;
}

@Component
class Biker {
    @Autowired
    @Qualifier("bike")
    Vehicle vehicle;
}
```
In the previous example _Car_ is the primary vehicle. Therefore, in the _Driver_ class, Spring injects a _Car_ bean. Of course, in the _Biker_ bean, the value of the field _vehicle_ will be a _Bike_ object because it's qualified.

---

### 2.10. _@Scope_

We use _@Scope_ to define the [scope](https://www.baeldung.com/spring-bean-scopes) of a _@Component_ class or a _@Bean_ definition_._ It can be either _singleton, prototype, request, session, globalSession_ or some custom scope.

For example:
```java
@Component 
@Scope("prototype") 
class Engine {}
```

---

## 3. Context Configuration Annotations

We can configure the application context with the annotations described in this section.

---

### 3.1. _@Profile_

If we want Spring to **use a _@Component_ class or a _@Bean_ method only when a specific profile is active**, we can mark it with _@Profile_. We can configure the name of the profile with the _value_ argument of the annotation:

```java
@Component
@Profile("sportDay")
class Bike implements Vehicle {}
```

You can read more about profiles in [this article](https://www.baeldung.com/spring-profiles).

---

### 3.2. _@Import_
We can use **specific _@Configuration_ classes without component scanning** with this annotation. We can provide those classes with _@Import_‘s _value_ argument:
```java
@Import(VehiclePartSupplier.class)
class VehicleFactoryConfig {}
```

---

### 3.3. _@ImportResource_

### 3.2. _@Import_

We can use **specific _@Configuration_ classes without component scanning** with this annotation. We can provide those classes with _@Import_‘s _value_ argument:

```java
@Import(VehiclePartSupplier.class) 
class VehicleFactoryConfig {}
```

---

### 3.3. _@ImportResource_

We can **import XML configurations** with this annotation. We can specify the XML file locations with the _locations_ argument, or with its alias, the _value_ argument:

```java
@Configuration
@ImportResource("classpath:/annotations.xml")
class VehicleFactoryConfig {}
```

---

### 3.4. _@PropertySource_

With this annotation, we can **define property files for application settings**:

```java
@Configuration
@PropertySource("classpath:/annotations.properties")
class VehicleFactoryConfig {}
```

_@PropertySource_ leverages the Java 8 repeating annotations feature, which means we can mark a class with it multiple times:

```java
@Configuration
@PropertySource("classpath:/annotations.properties")
@PropertySource("classpath:/vehicle-factory.properties")
class VehicleFactoryConfig {}
```

---

### 3.5. _@PropertySources_

We can use this annotation to specify multiple _@PropertySource_ configurations:

```java
@Configuration
@PropertySources({ 
    @PropertySource("classpath:/annotations.properties"),
    @PropertySource("classpath:/vehicle-factory.properties")
})
class VehicleFactoryConfig {}
```

---
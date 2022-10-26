#java #springBoot 

## 1. Overview

We can leverage the capabilities of Spring DI engine using the annotations in the _org.springframework.beans.factory.annotation_ and _org.springframework.context.annotation_ packages.

We often call these “Spring core annotations” and we'll review them in this tutorial.

## 2. DI-Related Annotations

### 2.1. _@Autowired_

We can use the _@Autowired_ to **mark a dependency which Spring is going to resolve and inject**. We can use this annotation with a constructor, setter, or field injection.

Constructor injection:

```java
class Car {
    Engine engine;
    @Autowired
    Car(Engine engine) {
        this.engine = engine;
    }
}
```

Setter injection:

```java
class Car {
    Engine engine;
    @Autowired
    void setEngine(Engine engine) {
        this.engine = engine;
    }
}
```

Field injection:

```java
class Car {
    @Autowired
    Engine engine;
}
```

_@Autowired_ has a _boolean_ argument called _required_ with a default value of _true_. It tunes Spring's behavior when it doesn't find a suitable bean to wire. When _true_, an exception is thrown, otherwise, nothing is wired.

Note, that if we use constructor injection, all constructor arguments are mandatory.

Starting with version 4.3, we don't need to annotate constructors with _@Autowired_ explicitly unless we declare at least two constructors.

More about autowired below:

**It allows Spring to resolve and inject collaborating beans into our bean.**



### 2.2. _@Bean_

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
@Bean @DependsOn("fuel") 
Engine engine() { 
	return new Engine(); 
}
```

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
### 2.8. _@Lookup_

A method annotated with _@Lookup_ tells Spring to return an instance of the method’s return type when we invoke it.
Detailed information about the annotation [can be found in this article](https://www.baeldung.com/spring-lookup).

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

### 2.10. _@Scope_

We use _@Scope_ to define the [scope](https://www.baeldung.com/spring-bean-scopes) of a _@Component_ class or a _@Bean_ definition_._ It can be either _singleton, prototype, request, session, globalSession_ or some custom scope.

For example:
```java
@Component 
@Scope("prototype") 
class Engine {}
```

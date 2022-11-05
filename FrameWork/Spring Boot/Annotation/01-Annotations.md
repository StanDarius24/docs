#java #springBoot 

**Types of Spring Framework Annotations**

Basically, there are 6 types of annotation available in the whole spring framework.

1.  Spring Core Annotations
2.  Spring Web Annotations
3.  Spring Boot Annotations
4.  Spring Scheduling Annotations
5.  Spring Data Annotations
6.  Spring Bean Annotations

**Type 1:** Spring Core Annotations

Spring annotations present in the _**org.springframework.beans.factory.annotation**_ and _**org.springframework.context.annotation**_ packages are commonly known as Spring Core annotations. We can divide them into two categories:

---

-   DI-Related Annotations
    -   @Autowired
    -   @Qualifier
    -   @Primary
    -   @Bean
    -   @Lazy
    -   @Required
    -   @Value
    -   @Scope
    -   @Lookup, etc.
-   Context Configuration Annotations
    -   @Profile
    -   @Import
    -   @ImportResource
    -   @PropertySource, etc.

---

**A** DI (Dependency Injection) Related Annotations:

**1.1:** @Autowired

@Autowired annotation is applied to the fields, setter methods, and constructors. It injects object dependency implicitly. We use @Autowired to mark the dependency that will be injected by the Spring container.

**B Context Configuration Annotations** 

@Profile: If you want Spring to use a @Component class or a @Bean method only when a specific profile is active then you can mark it with @Profile.

```Java
@Component
@Profile("developer")
public class Employee {}
```

**Type 2:** Spring Web Annotations

Spring annotations present in the _**org.springframework.web.bind.annotation p**_ackages are commonly known as Spring Web annotations. Some of the annotations that are available in this category are:
-   @RequestMapping
-   @RequestBody
-   @PathVariable
-   @RequestParam
-   Response Handling Annotations
    -   @ResponseBody
    -   @ExceptionHandler
    -   @ResponseStatus
-   @Controller
-   @RestController
-   @ModelAttribute
-   @CrossOrigin

**Example:** @Controller

Spring @Controller annotation is also a specialization of @Component annotation. The @Controller annotation indicates that a particular class serves the role of a controller. Spring Controller annotation is typically used in combination with annotated handler methods based on the @RequestMapping annotation. It can be applied to classes only. It’s used to mark a class as a web request handler. It’s mostly used with Spring MVC applications. This annotation acts as a stereotype for the annotated class, indicating its role. The dispatcher scans such annotated classes for mapped methods and detects @RequestMapping annotations.

```java
@Controller
public class DemoController {
    @RequestMapping("/hello")
    @ResponseBody
    public String helloGFG()
    {
        return "Hello GeeksForGeeks";
    }
}
```

**Type 3:** Spring Boot Annotations

Spring annotations present in the _**org.springframework.boot.autoconfigure**_ and _**org.springframework.boot.autoconfigure.condition**_ packages are commonly known as Spring Boot annotations. Some of the annotations that are available in this category are:

-   @SpringBootApplication
-   @EnableAutoConfiguration
-   Auto-Configuration Conditions
    -   @ConditionalOnClass, and @ConditionalOnMissingClass
    -   @ConditionalOnBean, and @ConditionalOnMissingBean
    -   @ConditionalOnProperty
    -   @ConditionalOnResource
    -   @ConditionalOnWebApplication and @ConditionalOnNotWebApplication
    -   @ConditionalExpression
    -   @Conditional

**Example:** @SpringBootApplication

This annotation is used to mark the main class of a Spring Boot application. It encapsulates @Configuration, @EnableAutoConfiguration, and @ComponentScan annotations with their default attributes.

```java
@SpringBootApplication
// Class
public class DemoApplication {
	// Main driver method`
    public static void main(String[] args)
    {
		SpringApplication.run(DemoApplication.class, args);
    }
}
```

**Type 4:** Spring Scheduling Annotations

Spring annotations present in the _**org.springframework.scheduling.annotation**_ packages are commonly known as Spring Scheduling annotations. Some of the annotations that are available in this category are:

-   @EnableAsync
-   @EnableScheduling
-   @Async
-   @Scheduled
-   @Schedules

**Example:** @EnableAsync

This annotation is used to enable asynchronous functionality in Spring.

```java
@Configuration
@EnableAsync
class Config {}
```

**Type 5:** Spring Data Annotations

Spring Data provides an abstraction over data storage technologies. Hence the business logic code can be much more independent of the underlying persistence implementation. Some of the annotations that are available in this category are:

-   Common Spring Data Annotations
    -   @Transactional
    -   @NoRepositoryBean
    -   @Param
    -   @Id
    -   @Transient
    -   @CreatedBy, @LastModifiedBy, @CreatedDate, @LastModifiedDate
-   Spring Data JPA Annotations
    -   @Query
    -   @Procedure
    -   @Lock
    -   @Modifying
    -   @EnableJpaRepositories
-   Spring Data Mongo Annotations
    -   @Document
    -   @Field
    -   @Query
    -   @EnableMongoRepositories

**Example:**

**A** @Transactional 

When there is a need to configure the transactional behavior of a method, we can do it with @Transactional annotation.

```java
@Transactional
void payment() {}
```

**B** @Id: @Id marks a field in a model class as the primary key. Since it’s implementation-independent, it makes a model class easy to use with multiple data store engines.

```java
class Student {
    @Id
    Long id;
    // other fields
      // ........... 
}
```

**Type 6:** Spring Bean Annotations

There’re several ways to configure beans in a Spring container. You can declare them using XML configuration or you can declare beans using the @Bean annotation in a configuration class or you can mark the class with one of the annotations from the _**org.springframework.stereotype**_ package and leave the rest to component scanning. Some of the annotations that are available in this category are:

-   @ComponentScan
-   @Configuration
-   Stereotype Annotations
    -   @Component
    -   @Service
    -   @Repository
    -   @Controller

**Example:** Stereotype Annotations

Spring Framework provides us with some special annotations. These annotations are used to create Spring beans automatically in the application context. @Component annotation is the main Stereotype Annotation. There are some Stereotype meta-annotations which is derived from _@Component_ those are

1.  _@Service_
2.  _@Repository_
3.  _@Controller_

**1: @Service:** We specify a class with @Service to indicate that they’re holding the business logic. Besides being used in the service layer, there isn’t any other special use for this annotation. The utility classes can be marked as Service classes.

**2: @Repository:** We specify a class with @Repository to indicate that they’re dealing with **CRUD operations**, usually, it’s used with DAO (Data Access Object) or Repository implementations that deal with database tables.

**3: @Controller:** We specify a class with @Controller to indicate that they’re front controllers and responsible to handle user requests and return the appropriate response. It is mostly used with REST Web Services.

```
So the stereotype annotations in spring are **@Component, @Service, @Repository, and @Controller**.
```

#springBoot #java
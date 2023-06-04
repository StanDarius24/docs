---
* What a framework is; 
* When to use and when to avoid using frameworks; 
* What the Spring framework is; 
* Using Spring in real-world scenarios. 
---
--- 
1. Spring Core — One of the fundamental parts of Spring that includes foundational capabilities. One of these features is the Spring context. As you’ll learn in detail in chapter 2, the Spring context is a fundamental capability of the Spring framework that enables Spring to manage instances of your app. Also, as part of Spring Core, you find the Spring aspects functionality. Aspects help Spring intercept and manipulate methods you define in your app. We discuss more details of the aspects in chapter 6. The Spring Expression Language (SpEL) is another capability you’ll find as part of Spring Core, which enables you to describe configurations for Spring using a specific language. All of these are new notions, and I don’t expect you to know them yet. But soon you’ll understand that Spring Core holds the mechanisms Spring uses to integrate into your app. 
2. Spring model-view-controller (MVC)—The part of the Spring framework that enables you to develop web applications that serve HTTP requests. We’ll use Spring MVC starting in chapter 7. 
3. Spring Data Access—Also one of the fundamental parts of Spring. It provides basic tools you can use to connect to SQL databases to implement the persistence layer of your app. We’ll use Spring Data Access starting in chapter 13. 
4. Spring testing—The part holding the tools you need to write tests for your Spring application. We’ll discuss this subject in chapter 15.  
--- 

 Spring Core is the part of the Spring framework that provides the foundational mechanisms to integrate into apps. Spring works based on the principle inversion of control (IoC). When using this principle, instead of allowing the app to control the execution, we give control to some other piece of software—in our case, the Spring framework. Through configurations, we instruct the framework on how to manage the code we write, which defines the logic of the app. Here’s where the “inversion” in IoC comes from: you don’t let the app control the execution by its own code and use dependencies. Instead, we allow the framework (the dependency) to control the app and its code.  The IoC container glues Spring components and components of your application to the framework together. Using the IoC container, to which you often refer as the Spring context, you make certain objects known to Spring, which enables the framework to use them in the way you configured. 
 
---
1.2.2 Using Spring Data Access feature to implement the app’s persistence For most applications, it’s critical to persist part of the data they process. Working with databases is a fundamental subject, and in Spring, it’s the Data Access module that you’ll use to take care of data persistence in many cases. The Spring Data Access includes using JDBC, integrating with object-relational mapping (ORM) frameworks like Hibernate 
1.2.3 The Spring MVC capabilities for developing web apps The most common applications developed with Spring are web apps, and within the Spring ecosystem, you’ll find a large set of tools that enables you to write web applications and web services in different fashions. You can use the Spring MVC to develop apps using a standard servlet fashion, which is common in a vast number of applications today. 
1.2.4 The Spring testing feature The Spring testing module offers us a large set of tools that we’ll use to write unit and integration tests. 
1.2.5 Projects from the Spring ecosystem The Spring ecosystem is so much more than just the capabilities discussed earlier in this section. It includes a big collection of other frameworks that integrate well and form a larger universe. Here we have projects like Spring Data, Spring Security, Spring Cloud, Spring Batch, Spring Boot, and so on. Spring Boot Spring Boot is a project part of the Spring ecosystem that introduces the concept of “convention over configuration.” 


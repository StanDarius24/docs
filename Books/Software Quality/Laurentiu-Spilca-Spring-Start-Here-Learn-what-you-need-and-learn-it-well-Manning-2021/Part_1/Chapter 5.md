---

The Spring context

Bean scopes and life cycle

---

- Using the singleton bean scope
- Using eager and lazy instantiation for singleton beans
- Using the prototype bean scope

Singleton is the default scope of a bean in Spring, and it’s what we’ve been using up to now.

---

5.1 Using the singleton bean scope

The singleton bean scope defines Spring’s default approach for managing the beans in its context. There are 2 singleton bean instantiation approaches (eager and lazy)

---

5.1.1 How singleton beans work

Spring creates a singleton bean when it loads the context and assigns the bean a name (sometimes also referred to as bean ID). We name this scope singleton because you always get the same instance when you refer to a specific bean.You can have more instances of the same type in the Spring context if they have different names.

When one refers to a singleton class in an app, they mean a class that offers only one instance to the app and manages the creation of that instance. In Spring, however, singleton doesn’t mean the context has only one instance of that type. It just means that a name is assigned to the instance, and the same instance will always be referred through that name.

---

5.1.2 Singleton beans in real-world scenarios

Because the singleton bean scope assumes that multiple components of the app can share an object instance, the most important thing to consider is that these beans must be immutable. Most often, a real-world app executes actions on multiple threads. In such a scenario, multiple threads share the same object
instance. If these threads change the instance, you encounter a race-condition scenario. A race condition is a situation that can happen in multithreaded architectures when multiple threads try to change a shared resource. In case of a race condition, the developer needs to properly synchronize the threads to avoid unexpected execution results or errors.
If you want mutable singleton beans, you need to make these beans concurrent by yourself. But singleton beans aren’t designed to be synchronized. They’re commonly used to define an app’s backbone class design and delegate responsibilities one to another. Technically, synchronization is possible, but it’s not a good practice. Synchronizing the thread on a concurrent instance can dramatically affect the app’s performance. In most cases, you will find other means to solve the same problem and avoid thread concurrency.

Using beans boils down to three points
 - Make an object bean in the Spring context only if you need Spring to manage it so that the framework can augment that bean with a specific capability. If the object doesn’t need any capability offered by the framework, you don’t need to make it a bean.
 - If you need to make an object bean in the Spring context, it should be singleton only if it’s immutable. Avoid designing mutable singleton beans.
 - If a bean needs to be mutable, an option could be to use the prototype scope.

---

5.1.3 Using eager and lazy instantiation
In most cases, Spring creates all singleton beans when it initialises the context this is Spring’s default behaviour. We’ve used only this default behaviour, which is also called eager instantiation. In this section, we discuss a different approach of the framework, lazy instantiation, and compare these two approaches.  With lazy instantiation, Spring doesn’t create the singleton instances when it creates the context. Instead, it creates each instance the first time someone refers to the bean. Let’s take an example to observe the difference between the approaches and then discuss the advantages and disadvantages of using them in production apps.

The @Lazy annotation tells Spring that it needs to create the bean only when someone refers to the bean for the first time.

When should you use eager instantiation and when should you use lazy? In most cases, it’s more comfortable to let the framework create all the instances at the beginning when the context is instantiated (eager); this way, when one instance delegates to another, the second bean already exists in any situation.

In a lazy instantiation, the framework has to first check if the instance exists and eventually create it if it doesn’t, so from the performance point of view, it’s better to have the instances in the context already (eager) because it spares some checks the framework needs to do when one bean delegates to another. Another advantage of eager instantiation is when something is wrong and the framework cannot create a bean; we can observe this issue when starting the app. With lazy instantiation, someone would observe the issue only when the app is already executing and it reaches the point that the bean needs to be created.

But lazy instantiation is not all evil. Some time ago, I worked on a vast monolithic
application. This app was installed in different locations where it was used in various scopes by its clients. In most cases, a specific client didn’t use a big part of the functionality, so instantiating the beans together with the Spring context unnecessarily occupied a lot of memory. For that app, the developers designed most of the beans to be lazily instantiated so that the app would create only the necessary instances.

My advice is to go with the default, which is an eager instantiation. This approach
generally brings more benefits. If you find yourself in a situation like the one I
presented with the monolithic app, first see if you can do something about the app’s design. Often, the need for using lazy instantiation is a sign something might be wrong with the app’s design. For example, in my story, it would have been better if the app had been designed in a modular way or as microservices. Such an architecture would have helped the developers deploy only what specific clients needed, and then making the instantiation of the beans lazy wouldn’t have been necessary. But in the real world, not everything is possible due to other factors like cost or time. If you cannot treat the real cause of the problem, you can sometimes treat at least some of the symptoms.

---

5.2 Using the prototype bean scope

As you’ll see, the idea is straightforward. Every time you request a reference to a prototype-scoped bean, Spring creates a new object instance. For prototype beans, Spring doesn’t create and manage an object instance directly. The framework manages the object’s type and creates a new instance every time someone requests a reference to the bean.
When you create the bean using the @Bean annotation approach, @Scope goes together with @Bean over the method that declares the bean. When declaring the bean with stereotype annotations, you use the @Scope annotation and the stereotype annotation over the class that declares the bean.
With prototype beans, we no longer have concurrency problems because each thread that requests the bean gets a different instance, so defining mutable prototype beans is not a problem.
```java
@Bean
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public Demo demo() {
	return new Demo();
}
...
@Repository  
@Scope(BeanDefinition.SCOPE_PROTOTYPE)  
public class CommentRepository {  }
```

---

5.2.2 Prototype beans in real-world scenarios

| Singleton                                                                                           | Prototype                                                                                             |
| --------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| The framework associates a name with an actual object instance                                      | A name is associated with a type.                                                                     |
| Every time you refer to a bean name you’ll get the same object instance.                            | Every time you refer to a bean name, you get a new instance.                                          |
| You can configure Spring to create the instances when the context is loaded or when first referred. | The framework always creates the object instances for the prototype scope when you refer to the bean. |
| Singleton is the default bean scope in Spring.                                                      | You need to explicitly mark a bean as a prototype.                                                    |
| It’s not recommended that a singleton bean to have mutable attributes.                              | A prototype bean can have mutable attributes.                                                         |

Summary:

1. In Spring, the scope of beans defines how the framework manages the object instances.
2. Spring offers two bean scopes: singleton and prototype. 
	- With singleton, Spring manages the object instances directly in its context. Each instance has a unique name, and using that name you always refer to that specific instance. Singleton is Spring’s default.
	- With prototype, Spring considers only the object type. Each type has a unique name associated with it. Spring creates a new instance of that type every time you refer to the bean name.

3. You can configure Spring to create a singleton bean either when the context is initialized (eager) or when the bean is referred for the first time (lazy). By default, a bean is eagerly instantiated.
4. In apps, we most often use singleton beans. Because anyone referring to the same name gets the same object instance, multiple different threads could access and use this instance. For this reason, it’s advisable to have the instance immutable. If, however, you prefer to have mutating operations on the bean’s attribute, it’s your responsibility to take care of the thread synchronization.
5. If you need to have a mutable object like a bean, using the prototype scope could be a good option.
6. Be careful with injecting a prototype-scoped bean into a singleton-scoped bean. When you do something like this, you need to be aware that the singleton instance always uses the same prototype instance, which Spring injects when it creates the singleton instance. This is usually a vicious design because the point of making a bean prototype-scoped is to get a different instance for every use.
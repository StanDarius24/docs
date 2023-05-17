---

The Spring context

Bean scopes and life cycle

---

- Using the singleton bean scope
- Using eager and lazy instantiation for singleton beans
- Using the prototype bean scope

Singleton is the default scope of a bean in Spring, and it’s what we’ve been using up to now.

5.1 Using the singleton bean scope

The singleton bean scope defines Spring’s default approach for managing the beans in its context. There are 2 singleton bean instantiation approaches (eager and lazy)

5.1.1 How singleton beans work

Spring creates a singleton bean when it loads the context and assigns the bean a name (sometimes also referred to as bean ID). We name this scope singleton because you always get the same instance when you refer to a specific bean.You can have more instances of the same type in the Spring context if they have different names.

When one refers to a singleton class in an app, they mean a class that offers only one instance to the app and manages the creation of that instance. In Spring, however, singleton doesn’t mean the context has only one instance of that type. It just means that a name is assigned to the instance, and the same instance will always be referred through that name.
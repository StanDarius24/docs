#java #springBoot 

When single-threaded execution isn't enough, we can use annotations from the _org.springframework.scheduling.annotation_ package.

---

## 2. _@EnableAsync_

With this annotation, we can enable asynchronous functionality in Spring.

We must use it with _@Configuration_:

```java
@Configuration
@EnableAsync
class VehicleFactoryConfig {}
```

Now, that we enabled asynchronous calls, we can use _@Async_ to define the methods supporting it.

---

## 3. _@EnableScheduling_

With this annotation, we can enable scheduling in the application.

We also have to use it in conjunction with _@Configuration_:

```java
@Configuration
@EnableScheduling
class VehicleFactoryConfig {}
```

As a result, we can now run methods periodically with _@Scheduled_.

---

## 4._@Async_

We can define methods we want to **execute on a different thread**, hence run them asynchronously.

To achieve this, we can annotate the method with _@Async_:

```java
@Async
void repairCar() {
    // ...
}
```

If we apply this annotation to a class, then all methods will be called asynchronously.

Note, that we need to enable the asynchronous calls for this annotation to work, with _@EnableAsync_ or XML configuration.

---

##  5._@Scheduled_

If we need a method to **execute periodically**, we can use this annotation:

```java
@Scheduled(fixedRate = 10000)
void checkVehicle() {
    // ...
}
```

We can use it to execute a method at **fixed intervals**, or we can fine-tune it with **cron-like expressions**.

_@Scheduled_ leverages the Java 8 repeating annotations feature, which means we can mark a method with it multiple times:

```java
@Scheduled(fixedRate = 10000)
@Scheduled(cron = "0 * * * * MON-FRI")
void checkVehicle() {
    // ...
}
```

Note, that the method annotated with _@Scheduled_ should have a _void_ return type.

Moreover, we have to enable scheduling for this annotation to work for example with _@EnableScheduling_ or XML configuration.

---

## 6._@Schedules_

We can use this annotation to specify multiple _@Scheduled_ rules:

```java
@Schedules({ 
  @Scheduled(fixedRate = 10000), 
  @Scheduled(cron = "0 * * * * MON-FRI")
})
void checkVehicle() {
    // ...
}
```

Note, that since Java 8 we can achieve the same with the repeating annotations feature as described above.
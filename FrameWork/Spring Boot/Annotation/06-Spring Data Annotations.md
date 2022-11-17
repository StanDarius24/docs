#java #springBoot 

Spring Data provides an abstraction over data storage technologies. Therefore, our business logic code can be much more independent of the underlying persistence implementation. Also, Spring simplifies the handling of implementation-dependent details of data storage.

In this tutorial, we'll see the most common annotations of the Spring Data, Spring Data JPA, and Spring Data MongoDB projects.

---

## 1. Common Spring Data Annotations

### 1.1. _@Transactional_

When we want to **configure the transactional behavior of a method**, we can do it with:

```java
@Transactional
void pay() {}
```

If we apply this annotation on class level, then it works on all methods inside the class. However, we can override its effects by applying it to a specific method.

---

###  1.2 _@NoRepositoryBean_

**Sometimes we want to create repository interfaces with the only goal of providing common methods for the child repositories**.

Of course, we don't want Spring to create a bean of these repositories since we won't inject them anywhere. _@NoRepositoryBean_ does exactly this: when we mark a child interface of _org.springframework.data.repository.Repository_, Spring won't create a bean out of it.

For example, if we want an _Optional<T> findById(ID id)_ method in all of our repositories, we can create a base repository:

```java
@NoRepositoryBean
interface MyUtilityRepository<T, ID extends Serializable> extends CrudRepository<T, ID> {
    Optional<T> findById(ID id);
}
```

This annotation doesn't affect the child interfaces; hence Spring will create a bean for the following repository interface:

```java
@Repository
interface PersonRepository extends MyUtilityRepository<Person, Long> {}
```

Note, that the example above isn't necessary since Spring Data version 2 which includes this method replacing the older _T findOne(ID id)_.

---


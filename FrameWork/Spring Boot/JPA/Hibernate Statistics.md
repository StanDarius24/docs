#java #springBoot 

```bash
23:04:12,123 INFO StatisticalLoggingSessionEventListener:258 - Session Metrics {
 23793 nanoseconds spent acquiring 1 JDBC connections;
 0 nanoseconds spent releasing 0 JDBC connections;
 394686 nanoseconds spent preparing 4 JDBC statements;
 2528603 nanoseconds spent executing 4 JDBC statements;
 0 nanoseconds spent executing 0 JDBC batches;
 0 nanoseconds spent performing 0 L2C puts;
 0 nanoseconds spent performing 0 L2C hits;
 0 nanoseconds spent performing 0 L2C misses;
 9700599 nanoseconds spent executing 1 flushes (flushing a total of 9 entities and 3 collections);
 42921 nanoseconds spent executing 1 partial-flushes (flushing a total of 0 entities and 0 collections)
}
```

The best way to find performance issues is to enable hibernate statistics
The lines describes:
 1. - This is the time spent acquiring a JDBC connection from the connection pool.
 2. - This field shows the time spent releasing JDBC connections back to the connection pool.
 3. - This is the time spent preparing the JDBC statement(s) for execution.
 4. - This field shows the time spent executing the JDBC statement(s).
 5. - This field shows the time spent executing JDBC batches, which is a feature that allows multiple SQL statements to be executed together as a single batch.
 6. - This field shows the time spent storing data in the Level 2 cache.
 7. - This field shows the time spent retrieving data from the Level 2 cache.
 8. - This field shows the time spent looking for data in the Level 2 cache and not finding it.
 9. - This field shows the time spent flushing the Hibernate session to the database.
 10. - This field shows the time spent performing a partial flush of the session to the database. A partial flush only flushes changes for entities that are associated with the current JDBC batch.

```

The lines 2 to 5 show you how many JDBC connections and statements Hibernate used during this session and how much time it spent on it. You should always have a look at these values and compare them with your expectations.

If there are a lot more statements than you expected, you most likely have the most common performance problem, the n+1 select issue. You can find it in nearly all applications, and it might create huge performance issues on a bigger database. I explain this issue in more details in the next section.

The lines 7 to 9 show how Hibernate interacted with the 2nd level cache. This is one of Hibernate’s 3 caches, and it stores entities in a session independent way. If you use the 2nd level in your application, you should always monitor these statistics to see if Hibernate gets the entities from there.

```

---

## Configurations:
```xml
spring:  
  jpa:  
    properties:  
      hibernate:  
        generate_statistics: true
```

In our cases in `TESTS` files.

```java
@TestPropertySource(properties = [  
    "spring.jpa.properties.hibernate.generate_statistics=true",  
    "logging.level.org.hibernate.stat=debug"  
])
```

---

## N+1 Select Issue

The n+1 select issue is the most common performance problem. A lot of developers blame the OR-Mapping concept for this issue, and they’re not completely wrong. But you can easily avoid it if you understand how Hibernate treats lazily fetched relationships. The developer is, therefore, to blame as well because it’s his responsibility to avoid these kinds of issues.

```java
@Entity
@Table(name = "purchaseOrder")
public class Order implements Serializable {

    @OneToMany(mappedBy = "order", fetch = FetchType.LAZY)
    private Set<OrderItem> items = new HashSet<OrderItem>();

    ...
}
```

When you now load an _Order_ entity from the database, you just need to call the _getItems()_ method to get all items of this order. Hibernate hides the required database queries to get the related _OrderItem_ entities from the database.

When you started with Hibernate, you probably learned that you should use _FetchType.LAZY_  for most of the relationships and that it’s the default for to-many relationships. This tells Hibernate to only fetch the related entities if you use the attribute which maps the relationship. Fetching only the data you need is a good thing in general, but it also requires Hibernate to execute an additional query to initialize each relationship.

Hibernate performs one query to get all _Order_ entities and an additional one for each of the n _Order_ entities to initialize the _orderItem_ relationship. So you now know why this kind of issue is called n+1 select issue and why it can create huge performance problems.

What makes it even worse is, that you often don’t recognize it on a small test database, if you haven’t checked your Hibernate statistics. The code snippet requires only a few dozen queries if the test database doesn’t contain a lot of orders. But that will be completely different if you use your productive database which contains several thousand of them.

I said earlier that you can easily avoid these issues. And that’s true. You just have to initialize the orderItem relationship when you select the _Order_ entities from the database.

But please, only do that, if you use the relationship in your business code and don’t use _FetchType.EAGER_ to always fetch the related entities. That just replaces your n+1 issue with another performance problem.

---

## **Initialize a Relationships with a _@NamedEntityGraph_**

I prefer to use a _@NamedEntityGraph_ which is is one of my favorite features introduced in JPA 2.1. It provides a query independent way to specify a graph of entities which Hibernate shall fetch from the database. In following code snippet, you can see an example of a simple graph that lets Hibernate eagerly fetch the items attribute of an entity:

```java
@Entity
@Table(name = "purchase_order")
@NamedEntityGraph(
  name = "graph.Order.items", 
  attributeNodes = @NamedAttributeNode("items"))
public class Order implements Serializable {

    ...
}
```

There isn’t much you need to do to define an entity graph with a _@NamedEntityGraph_ annotation. You just have to provide a unique name for the graph and one _@NamedAttributeNode_ annotation for each attribute Hibernate shall fetch eagerly. In this example, it’s only the items attribute which maps the relationship between an _Order_ and several _OrderItem_ entities.
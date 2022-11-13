#java #springBoot 

Spring Boot made configuring Spring easier with its auto-configuration feature.

In this quick tutorial, we'll explore the annotations from the _org.springframework.boot.autoconfigure_ and _org.springframework.boot.autoconfigure.condition_ packages.

## 2. _@SpringBootApplication_

We use this annotation to **mark the main class of a Spring Boot application**:

```java
@SpringBootApplication
class VehicleFactoryApplication {

    public static void main(String[] args) {
        SpringApplication.run(VehicleFactoryApplication.class, args);
    }
}
```

_@SpringBootApplication_ encapsulates **_@Configuration_, _@EnableAutoConfiguration_, and _@ComponentScan_** annotations with their default attributes.

---

## 3. _@EnableAutoConfiguration_

_@EnableAutoConfiguration_, as its name says, enables auto-configuration. It means that **Spring Boot looks for auto-configuration beans** on its classpath and automatically applies them.

Note, that we have to use this annotation with _@Configuration_:

```java
@Configuration
@EnableAutoConfiguration
class VehicleFactoryConfig {}
```

---

## 4.1.a Auto-Configuration Conditions

Usually, when we write our **custom auto-configurations**, we want Spring to **use them conditionally**. We can achieve this with the annotations in this section.

We can place the annotations in this section on _@Configuration_ classes or _@Bean_ methods.

In the next sections, we'll only introduce the basic concept behind each condition.

Simply put, the Spring Boot auto-configuration helps us automatically configure a Spring application based on the dependencies that are present on the classpath.

This can make development faster and easier by eliminating the need to define certain beans included in the auto-configuration classes.

In the following section, we'll look at **creating our custom Spring Boot auto-configuration.**

---

## 4.1.b **Maven Dependencies**

Let's start with the dependencies:

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
    <version>2.4.0</version>
</dependency>
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.19</version>
</dependency>
```

The latest versions of [spring-boot-starter-data-jpa](https://search.maven.org/classic/#search%7Cga%7C1%7Ca%3A%22spring-boot-starter-data-jpa%22) and [mysql-connector-java](https://search.maven.org/classic/#search%7Cga%7C1%7Ca%3A%22mysql-connector-java%22%20AND%20g%3A%22mysql%22) can be downloaded from Maven Central.

---

## **4.1.c Creating a Custom Auto-Configuration**

**In order to create a custom auto-configuration, we need to create a class annotated as _@Configuration_ and register it.**

Let's create a custom configuration for a _MySQL_ data source:

```java
@Configuration
public class MySQLAutoconfiguration {
    //...
}
```

Next, we need to register the class as an auto-configuration candidate.

We do this by adding the name of the class under the key _org.springframework.boot.autoconfigure.EnableAutoConfiguration_ in the standard file _resources/META-INF/spring.factories_:

```bash
org.springframework.boot.autoconfigure.EnableAutoConfiguration=\
com.baeldung.autoconfiguration.MySQLAutoconfiguration
```

If we want our auto-configuration class to have priority over other candidates, we can add the _@AutoConfigureOrder(Ordered.HIGHEST_PRECEDENCE)_ annotation.

We design the auto-configuration using classes and beans marked with _@Conditional_ annotations so that we can replace the auto-configuration or specific parts of it.

**Note that the auto-configuration is only in effect if we don't define the auto-configured beans in the application. If we define our bean, it will override the default one.**

---

### **4.2 Class Conditions

Class conditions allow us to **specify that we want to include a configuration bean if a specified class is present** using the _@ConditionalOnClass_ annotation, **or if a class is absent** using the _@ConditionalOnMissingClass_ annotation.

Let's specify that our _MySQLConfiguration_ will load only if the class _DataSource_ is present, in which case we can assume the application will use a database:

```java
@Configuration
@ConditionalOnClass(DataSource.class)
public class MySQLAutoconfiguration {
    //...
}
```

---

### **4.2.a Bean Conditions

If we want to **include a bean only if a specified bean is present or not**, we can use the _@ConditionalOnBean_ and _@ConditionalOnMissingBean_ annotations.

To look at this, let's add an _entityManagerFactory_ bean to our configuration class.

First, we'll specify that we only want to create this bean if a bean called _dataSource_ is present and if a bean called _entityManagerFactory_ is not already defined:

```java
@Bean
@ConditionalOnBean(name = "dataSource")
@ConditionalOnMissingBean
public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
    LocalContainerEntityManagerFactoryBean em
      = new LocalContainerEntityManagerFactoryBean();
    em.setDataSource(dataSource());
    em.setPackagesToScan("com.baeldung.autoconfiguration.example");
    em.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
    if (additionalProperties() != null) {
        em.setJpaProperties(additionalProperties());
    }
    return em;
}
```

Let's also configure a _transactionManager_ bean that will load only if we haven't already defined a bean of type _JpaTransactionManager_:

```java
@Bean
@ConditionalOnMissingBean(type = "JpaTransactionManager")
JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
    JpaTransactionManager transactionManager = new JpaTransactionManager();
    transactionManager.setEntityManagerFactory(entityManagerFactory);
    return transactionManager;
}
```

---

### **4.2.b Property Conditions

We use the _@ConditionalOnProperty_ annotation to **specify if a configuration loads based on the presence and value of a Spring Environment property.**

First, let's add a property source file for our configuration that will determine where the properties will be read from:

```java
@PropertySource("classpath:mysql.properties")
public class MySQLAutoconfiguration {
    //...
}
```

We can configure the main _DataSource_ bean that we'll use to create connections to the database so that it will load only if a property called _usemysql_ is present.

We can use the attribute _havingValue_ to specify certain values of the _usemysql_ property that have to be matched.

Now let's define the _dataSource_ bean with default values that connect to a local database called _myDb_ if we set the _usemysql_ property to _local_:

```java
@Bean
@ConditionalOnProperty(
  name = "usemysql", 
  havingValue = "local")
@ConditionalOnMissingBean
public DataSource dataSource() {
    DriverManagerDataSource dataSource = new DriverManagerDataSource();
 
    dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
    dataSource.setUrl("jdbc:mysql://localhost:3306/myDb?createDatabaseIfNotExist=true");
    dataSource.setUsername("mysqluser");
    dataSource.setPassword("mysqlpass");

    return dataSource;
}
```

If we set the _usemysql_ property to _custom_, we'll configure the _dataSource_ bean using custom properties values for the database URL, user and password:

```java
@Bean(name = "dataSource")
@ConditionalOnProperty(
  name = "usemysql", 
  havingValue = "custom")
@ConditionalOnMissingBean
public DataSource dataSource2() {
    DriverManagerDataSource dataSource = new DriverManagerDataSource();
        
    dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
    dataSource.setUrl(env.getProperty("mysql.url"));
    dataSource.setUsername(env.getProperty("mysql.user") != null 
      ? env.getProperty("mysql.user") : "");
    dataSource.setPassword(env.getProperty("mysql.pass") != null 
      ? env.getProperty("mysql.pass") : "");
        
    return dataSource;
}
```

The _mysql.properties_ file will contain the _usemysql_ property:

```plaintext
usemysql=local
```

An application that uses the _MySQLAutoconfiguration_ may need to override the default properties. In this case, it just needs to add different values for the _mysql.url_, _mysql.user_ and _mysql.pass_ properties and the _usemysql=custom_ line in the _mysql.properties_ file.

---

### **4.2.c Resource Conditions**

Adding the _@ConditionalOnResource_ annotation means that the **configuration loads only when a specified resource is present.**

Let's define a method called _additionalProperties()_ that will return a _Properties_ object containing Hibernate-specific properties to be used by the _entityManagerFactory_ bean, only if the resource file _mysql.properties_ is present:

```java
@ConditionalOnResource(
  resources = "classpath:mysql.properties")
@Conditional(HibernateCondition.class)
Properties additionalProperties() {
    Properties hibernateProperties = new Properties();

    hibernateProperties.setProperty("hibernate.hbm2ddl.auto", 
      env.getProperty("mysql-hibernate.hbm2ddl.auto"));
    hibernateProperties.setProperty("hibernate.dialect", 
      env.getProperty("mysql-hibernate.dialect"));
    hibernateProperties.setProperty("hibernate.show_sql", 
      env.getProperty("mysql-hibernate.show_sql") != null 
      ? env.getProperty("mysql-hibernate.show_sql") : "false");
    return hibernateProperties;
}
```

We can add the Hibernate-specific properties to the _mysql.properties_ file:

```bash
mysql-hibernate.dialect=org.hibernate.dialect.MySQLDialect
mysql-hibernate.show_sql=true
mysql-hibernate.hbm2ddl.auto=create-drop
```

---

### **4.2.d Custom Conditions

Let's say we don't want to use any of the conditions available in Spring Boot.

We can also **define custom conditions by extending the _SpringBootCondition_ class and overriding the _getMatchOutcome()_ method.**

Let's create a condition called _HibernateCondition_ for our _additionalProperties()_ method that will verify whether a _HibernateEntityManager_ class is present on the classpath:

```java
static class HibernateCondition extends SpringBootCondition {

    private static String[] CLASS_NAMES
      = { "org.hibernate.ejb.HibernateEntityManager", 
          "org.hibernate.jpa.HibernateEntityManager" };

    @Override
    public ConditionOutcome getMatchOutcome(ConditionContext context, 
      AnnotatedTypeMetadata metadata) {
 
        ConditionMessage.Builder message
          = ConditionMessage.forCondition("Hibernate");
        return Arrays.stream(CLASS_NAMES)
          .filter(className -> ClassUtils.isPresent(className, context.getClassLoader()))
          .map(className -> ConditionOutcome
            .match(message.found("class")
            .items(Style.NORMAL, className)))
          .findAny()
          .orElseGet(() -> ConditionOutcome
            .noMatch(message.didNotFind("class", "classes")
            .items(Style.NORMAL, Arrays.asList(CLASS_NAMES))));
    }
}
```

Then we can add the condition to the _additionalProperties()_ method:

```java
@Conditional(HibernateCondition.class)
Properties additionalProperties() {
  //...
}
```

---

### **4.2.e Application Conditions

We can also **specify that the configuration can load only inside/outside a web context.** In order to do this, we can add the _@ConditionalOnWebApplication_ or _@ConditionalOnNotWebApplication_ annotation.

---

### **4.2.f Testing the Auto-Configuration

Let's create a very simple example to test our auto-configuration.

We will create an entity class called _MyUser_ and a _MyUserRepository_ interface using Spring Data:

```java
@Entity
public class MyUser {
    @Id
    private String email;

    // standard constructor, getters, setters
}
```

```java
public interface MyUserRepository 
  extends JpaRepository<MyUser, String> { }
```

In order to enable auto-configuration, we can use one of the _@SpringBootApplication_ or _@EnableAutoConfiguration_ annotations:

```java
@SpringBootApplication
public class AutoconfigurationApplication {
    public static void main(String[] args) {
        SpringApplication.run(AutoconfigurationApplication.class, args);
    }
}
```

Next, let's write a _JUnit_ test that saves a _MyUser_ entity:

```java
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(
  classes = AutoconfigurationApplication.class)
@EnableJpaRepositories(
  basePackages = { "com.baeldung.autoconfiguration.example" })
public class AutoconfigurationLiveTest {

    @Autowired
    private MyUserRepository userRepository;

    @Test
    public void whenSaveUser_thenOk() {
        MyUser user = new MyUser("user@email.com");
        userRepository.save(user);
    }
}
```

Since we didn't define our _DataSource_ configuration, the application will use the auto-configuration we created to connect to a _MySQL_ database called _myDb_.

**The connection string contains the _createDatabaseIfNotExist=true_ property, so the database does not need to exist. However, the user _mysqluser_, or the one specified through the _mysql.user_ property if it is present, needs to be created.**

We can check the application log to see that we're using the _MySQL_ data source:

```bash
web - 2017-04-12 00:01:33,956 [main] INFO  o.s.j.d.DriverManagerDataSource - Loaded JDBC driver: com.mysql.cj.jdbc.Driver
```

---

### **4.2.g Disabling Auto-Configuration Classes

Let's say we want to **exclude the auto-configuration from loading.**

We could add the _@EnableAutoConfiguration_ annotation with _exclude_ or _excludeName_ attribute to a configuration class:

```java
@Configuration
@EnableAutoConfiguration(
  exclude={MySQLAutoconfiguration.class})
public class AutoconfigurationApplication {
    //...
}
```

We can also set the _spring.autoconfigure.exclude_ property:

```bash
spring.autoconfigure.exclude=com.baeldung.autoconfiguration.MySQLAutoconfiguration
```

---

### 4.3 _@ConditionalOnClass_ and _@ConditionalOnMissingClass_

Using these conditions, Spring will only use the marked auto-configuration bean if the class in the annotation's **argument is present/absent**:

```java
@Configuration
@ConditionalOnClass(DataSource.class)
class MySQLAutoconfiguration {
    //...
}
```

---

### 4.4 _@ConditionalOnBean_ and _@ConditionalOnMissingBean_

We can use these annotations when we want to define conditions based on the **presence or absence of a specific bean**:

```java
@Bean
@ConditionalOnBean(name = "dataSource")
LocalContainerEntityManagerFactoryBean entityManagerFactory() {
    // ...
}
```

---

### 4.5 _@ConditionalOnProperty_

With this annotation, we can make conditions on the **values of properties**:

```java
@Bean
@ConditionalOnProperty(
    name = "usemysql", 
    havingValue = "local"
)
DataSource dataSource() {
    // ...
}
```

---

### 4.6 _@ConditionalOnResource_

We can make Spring to use a definition only when a specific **resource is present**:

```java
@ConditionalOnResource(resources = "classpath:mysql.properties")
Properties additionalProperties() {
    // ...
}
```

---

### 4.7 _@ConditionalOnWebApplication_ and _@ConditionalOnNotWebApplication_

With these annotations, we can create conditions based on if the current **application is or isn't a web application**:

```java
@ConditionalOnWebApplication
HealthCheckController healthCheckController() {
    // ...
}
```

---

### 4.8. _@ConditionalExpression_

We can use this annotation in more complex situations. Spring will use the marked definition when the **SpEL expression is evaluated to true**:

```java
@Bean
@ConditionalOnExpression("${usemysql} && ${mysqlserver == 'local'}")
DataSource dataSource() {
    // ...
}
```

---

### 4.7. _@Conditional_

For even more complex conditions, we can create a class evaluating the **custom condition**. We tell Spring to use this custom condition with _@Conditional_:

```java
@Conditional(HibernateCondition.class)
Properties additionalProperties() {
    //...
}
```

---

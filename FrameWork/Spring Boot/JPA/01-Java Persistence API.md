#java #springBoot 

- Bridge object oriented domain model to entity from database

- JPI is a specification not implementation:

Implementations are: 
 - Hibernate, 
 - Ibatis, 
 - Toplink, 
 - orm lite.

## JPA Arhitecture

| name                   | calculation formula                                                                                                              |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Entity                 | Entities are the persistence objects, stores as records in the database                                                          |
| Entity Manager         | It is an Interface, it manages the persistence operations on objects. It works like factory for Query instance.                  |
| Entity Transaction     | It has one-to-one relationship with EntityManager. For each EntityManager, operations are maintained by EntityTransaction class. |
| Entity Manager Factory | This is a factory class of EntityManager. It creates and manages multiple EntityManager instances.                               |
| Persistence            | This class contain static methods to obtain EntityManagerFactory instance.                                                       |
| Query                  | This interface is implemented by each JPA vendor to obtain relational objects that meet the criteria.                            |


![[Pasted image 20221029162619.png]]

```xml
<dependency>
    <groupId>org.hibernate.orm</groupId>
    <artifactId>hibernate-core</artifactId>
    <version>6.1.5.Final</version>
</dependency>
```
improved (based on)
```xml
<dependencies> 
	<dependency> 
		<groupId>org.springframework.data</groupId> 
			<artifactId>spring-data-jpa</artifactId> 
	</dependency>
<dependencies>
```

---

### Persistance
Bootstrap class that is used to obtain an EntityManagerFactory, it also be used to cause schema generation to occur.

### EntityManagerFactory
Interface used to interact with the entity manager factory for the persistence unit.When the application has finished using the entity manager factory, and/or at application shutdown, the application should close the entity manager factory.  Once an <code>EntityManagerFactory</code> has been closed, all its entity managers are considered to be in the closed state.
The relationship between EntityManagerFactory and EntityManager is one-to-many. It is a factory class to EntityManager instances.

It is configurable by the Persistance Unit:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="1.0" xmlns="http://java.sun.com/xml/ns/persistence"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="http://java.sun.com/xml/ns/persistence http://java.sun.com/xml/ns/persistence/persistence_1_0.xsd">
  <persistence-unit name="myPersistenceUnitName" transaction-type="RESOURCE_LOCAL">
    <provider>org.eclipse.persistence.jpa.PersistenceProvider</provider>
    <class>com.oracle.ticketsystem.beans.Tickethistory</class>
    <class>com.oracle.ticketsystem.beans.Ticket</class>
    <class>com.oracle.ticketsystem.beans.Technicianprivatedata</class>
    <class>com.oracle.ticketsystem.beans.Product</class>
    <class>com.oracle.ticketsystem.beans.Department</class>
    <class>com.oracle.ticketsystem.beans.Technician</class>
    <properties>
      <property name="eclipselink.target-database" value="Derby"/>
      <property name="javax.persistence.jdbc.driver" value="org.apache.derby.jdbc.ClientDriver"/>
      <property name="javax.persistence.jdbc.url" value="jdbc:derby://localhost:1527/jpatutorial;create=true"/>
      <property name="javax.persistence.jdbc.user" value="app"/>
      <property name="javax.persistence.jdbc.password" value="app"/>
      <property name="eclipselink.logging.level" value="ALL"/>
    </properties>
  </persistence-unit>
</persistence>
```

### Entity Manager
Interface used to interact with the persistence context.An EntityManager instance is associated with a persistance context.A persistence context is a set of entity instances in which for any persistent entity identity there is a unique entity instance.Within the persistence context, the entity instances and their lifecycle are managed. The EntityManager API is used to create and remove persistent entity instances, to find entities by their primary key, and to query over entities.The set of entities that can be managed by a given EntityManager instance is defined by a persistence unit. A persistence unit defines the set of all classes that are related or grouped by the application, and which must be colocated in their mapping to a single database.

The relationship between EntityManager and EntityTransaction is one-to-one. For each EntityManager operation, there is an EntityTransaction instance.

The relationship between EntityManager and Query is one-to-many. Many number of queries can execute using one EntityManager instance.

The relationship between EntityManager and Entity is one-to-many. One EntityManager instance can manage multiple Entities.

### Entity Transaction
nterface used to control transactions on resource-local entity managers. The EntityManager.getTransaction() method returns the EntityTransaction interface.
-   _void begin()_ - Start a resource transaction.
-   _void commit()_ - Commit the current resource transaction, writing any unflushed changes to the database.
-   _boolean getRollbackOnly()_ - Determine whether the current resource transaction has been marked for rollback.
-   _boolean isActive()_ - Indicate whether a resource transaction is in progress.
-   _void rollback()_ - Roll back the current resource transaction.
-   _void setRollbackOnly()_ - Mark the current resource transaction so that the only possible outcome of the transaction is for the transaction to be rolled back.
```java
private static void insertEntity() {
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("PERSISTENCE"); //create a factory
    EntityManager entityManager = entityManagerFactory.createEntityManager(); //create a manager for factory
    EntityTransaction entityTransaction = entityManager.getTransaction(); //create an entity transaction for manager
    entityTransaction.begin(); // start the transaction
    Student student = new Student("Ramesh", "Fadatare", "rameshfadatare@javaguides.com");
    entityManager.persist(student); // make an instance managed and persistent
    entityManager.getTransaction().commit(); //Commit the current resource transaction, writing any unflushed changes to the database.
    entityManager.close();
    // Close an application-managed entity manager. After the close method has been invoked, all methods  
// on the EntityManager instance and any Query, TypedQuery, and  
// StoredProcedureQuery objects obtained from it will throw the IllegalStateException except for getProperties, getTransaction, and isOpen (which will return false). If this method is called when the entity manager is joined to an active transaction, the persistence  context remains managed until the transaction completes.
    entityManagerFactory.close(); // Close the factory, releasing any resources that it holds. After a factory instance has been closed, all methods invoked on it will throw the IllegalStateException, except for isOpen, which will return false. Once an EntityManagerFactory has been closed, all its entity managers are considered to be in the closed state.
}
```

### Entity
Specifies that the class is an entity. This annotation is applied to the entity class.

### Query
Interface used to control query execution.
```java
@Query("SELECT u FROM User u WHERE u.status = 1") Collection<User> findAllActiveUsers();
```

---

## ORM Mapping
ORM stands for **Object-Relational Mapping**, it is a programming technique that _abstracts your code from the database_ behind it. In plain English, if you are using ORM and a MySQL database, you could switch to PostgreSQL at any time without changing your code. At all.

## ORM mapping

| Name         |
| ------------ |
| one to one   |
| one to many  |
| many to one  |
| many to many |

![[Pasted image 20221029193047.png]]

## ORM atchitecture
| name       | calculation formula                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Object     | relation part java class                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Mapping    | mapping = jpi provider, mapping file, jpi loader, and object grid:  <br/>jpi provider related to the vendor product (HIBERNATE TOPLINK IBATIS)  <br/> mapping file (Persistence.xml) -> configuration between data in java class and data in a relation database <br/> jpa loader -> cache memory -> load the relation grid data<br/> object grid -> temporary location that can store the copy of the relation database (cache memory) queries against the database are first affected on the object grid only after it is commited it affect the main database |
| Relational | contain the relational data which is connected to the business component      <br/> bs component commits data it is stored in the database physically until then the modified data is stored in the cache memory                                                                                                                                                                                                                                                                                                                                                 |

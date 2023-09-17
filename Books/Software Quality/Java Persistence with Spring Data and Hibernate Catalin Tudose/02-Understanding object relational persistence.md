
---
- Persisting with SQL databases in Java applications
- Analyzing the object/relational paradigm mismatch
- Introducing ORM, JPA, Hibernate, and Spring Data
---

The choice of approach to managing persistent data may be a key design decision in many software projects.

Should we hand-code even the most primitive CRUD (create, read, update, delete) operations in SQL and JDBC, or should this work be handed to an intermediary layer?
How can we achieve portability if every database management system has its own SQL dialect?
Should we abandon SQL completely and adopt a different database technology, such as object database systems or NoSQL systems?

The debate may never end, but a solution called _object/relational mapping_ (ORM) now has wide acceptance.

---

## 1.1 What is persistence?

Most applications require persistent data. Persistence is one of the fundamental concepts in application development. If an information system didn’t preserve data when it was powered off, the system would be of little practical use. _Object persistence_ means individual objects can outlive the application process; they can be saved to a data store and be re-created at a later point in time. When we talk about persistence in Java, we’re generally talking about mapping and storing object instances in a database using SQL.

---

### 1.1.1 Relational databases

Relational database management systems have SQL-based application programming interfaces, so we call today’s relational database products SQL _database management systems_ (DBMS) or, when we’re talking about particular systems, SQL _databases_.
Relational technology is a well-known technology, and this alone is sufficient reason for many organizations to choose it. Relational databases are also an incredibly flexible and robust approach to data management. Due to the well-researched theoretical foundation of the relational data model, relational databases can guarantee and protect the integrity of stored data, along with having other desirable characteristics.
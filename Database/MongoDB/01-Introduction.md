#Database #mongoDB #documentParadigm

A record in MongoDB is a document, which is a data structure composed of field and value pairs. MongoDB documents are similar to JSON objects. The values of fields may include other documents, arrays, and arrays of documents.
![[Pasted image 20230121161918.png]]

The advantages of using documents are:

-   Documents correspond to native data types in many programming languages.
    
-   Embedded documents and arrays reduce need for expensive joins.
    
-   Dynamic schema supports fluent polymorphism.

---

### High Performance

MongoDB provides high performance data persistence. In particular,

-   Support for embedded data models reduces I/O activity on database system.
    
-   Indexes support faster queries and can include keys from embedded documents and arrays.

---

### High Availability

MongoDB's replication facility, called [replica set], provides:

-   _automatic_ failover
    
-   data redundancy.

A [replica set] is a group of MongoDB servers that maintain the same data set, providing redundancy and increasing data availability.

---

### Horizontal Scalability

MongoDB provides horizontal scalability as part of its _core_ functionality:

-   [Sharding] distributes data across a cluster of machines.
    
-   Starting in 3.4, MongoDB supports creating [zones] of data based on the [shard key]. In a balanced cluster, MongoDB directs reads and writes covered by a zone only to those shards inside the zone. See the [Zones] manual page for more information.

---

### Support for Multiple Storage Engines

MongoDB supports [multiple storage engines:]

-   [WiredTiger Storage Engine] (including support for [Encryption at Rest)]
    
-   [In-Memory Storage Engine.]

In addition, MongoDB provides pluggable storage engine API that allows third parties to develop storage engines for MongoDB.
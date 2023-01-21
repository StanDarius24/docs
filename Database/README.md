There are different paradigms for databases:

### Key-Value:

![[Pasted image 20230121170900.png]]

A **key–value database**, or **key–value store**, is a data storage paradigm designed for storing, retrieving, and managing [associative arrays](https://en.wikipedia.org/wiki/Associative_array "Associative array"), and a [data structure](https://en.wikipedia.org/wiki/Data_structure "Data structure") more commonly known today as a _dictionary_ or _[hash table](https://en.wikipedia.org/wiki/Hash_table "Hash table")_. Dictionaries contain a [collection](https://en.wikipedia.org/wiki/Collection_(abstract_data_type) "Collection (abstract data type)") of _[objects](https://en.wikipedia.org/wiki/Object_(computer_science) "Object (computer science)")_, or _[records](https://en.wikipedia.org/wiki/Record_(computer_science) "Record (computer science)")_, which in turn have many different _[fields](https://en.wikipedia.org/wiki/Field_(computer_science) "Field (computer science)")_ within them, each containing data. These records are stored and retrieved using a _key_ that uniquely identifies the record, and is used to find the data within the [database](https://en.wikipedia.org/wiki/Database "Database").
Key–value databases work in a very different fashion from the better known [relational databases](https://en.wikipedia.org/wiki/Relational_database "Relational database") (RDB). RDBs predefine the data structure in the database as a series of tables containing fields with well defined [data types](https://en.wikipedia.org/wiki/Data_type "Data type"). Exposing the data types to the database program allows it to apply a number of optimizations. In contrast, key–value systems treat the data as a single opaque collection, which may have different fields for every record. This offers considerable flexibility and more closely follows modern concepts like [object-oriented programming](https://en.wikipedia.org/wiki/Object-oriented_programming "Object-oriented programming"). Because optional values are not represented by placeholders or input parameters, as in most RDBs, key–value databases often use far less [memory](https://en.wikipedia.org/wiki/Computer_memory "Computer memory") to store the same data, which can lead to large performance gains in certain workloads.
Performance, a lack of standardization and other issues limited key–value systems to niche uses for many years, but the rapid move to [cloud computing](https://en.wikipedia.org/wiki/Cloud_computing "Cloud computing") after 2010 has led to a renaissance as part of the broader [NoSQL](https://en.wikipedia.org/wiki/NoSQL "NoSQL") movement. Some [graph databases](https://en.wikipedia.org/wiki/Graph_database "Graph database"), such as [ArangoDB](https://en.wikipedia.org/wiki/ArangoDB "ArangoDB"),(https://en.wikipedia.org/wiki/Key%E2%80%93value_database#cite_note-1) are also key–value databases internally, adding the concept of the relationships (_[pointers](https://en.wikipedia.org/wiki/Pointer_(computer_programming) "Pointer (computer programming)")_) between records as a first class data type.

**Popular Key-Value Databases**: Redis, Memcached, Etcd

---

### Wide Column:

![[Pasted image 20230121170854.png]]

A **wide-column store** (or **extensible record store**) is a type of [NoSQL](https://en.wikipedia.org/wiki/NoSQL "NoSQL") [database](https://en.wikipedia.org/wiki/Database "Database").[[1]](https://en.wikipedia.org/wiki/Wide-column_store#cite_note-db-engines-1) It uses tables, rows, and columns, but unlike a [relational database](https://en.wikipedia.org/wiki/Relational_database "Relational database"), the names and format of the columns can vary from row to row in the same table. A wide-column store can be interpreted as a two-dimensional [key–value store](https://en.wikipedia.org/wiki/Key%E2%80%93value_store "Key–value store").[[1]](https://en.wikipedia.org/wiki/Wide-column_store#cite_note-db-engines-1)
Wide-column stores such as [Bigtable](https://en.wikipedia.org/wiki/Bigtable "Bigtable") and [Apache Cassandra](https://en.wikipedia.org/wiki/Apache_Cassandra "Apache Cassandra") are not [column stores](https://en.wikipedia.org/wiki/Column-oriented_DBMS "Column-oriented DBMS") in the original sense of the term, since their two-level structures do not use a columnar data layout. In genuine column stores, a columnar data layout is adopted such that each column is stored separately on disk. Wide-column stores do often support the notion of [column families](https://en.wikipedia.org/wiki/Column_family "Column family") that are stored separately. However, each such column family typically contains multiple columns that are used together, similar to traditional relational database tables. Within a given column family, all data is stored in a row-by-row fashion, such that the columns for a given row are stored together, rather than each column being stored separately.


**Popular Wide-Column Databases**: Cassandra, Apache HBase

---

### Document Oriented:

![[Pasted image 20230121170848.png]]

Document-oriented databases are one of the main categories of [NoSQL](https://en.wikipedia.org/wiki/NoSQL "NoSQL") databases, and the popularity of the term "document-oriented database" has grown[[2]](https://en.wikipedia.org/wiki/Document-oriented_database#cite_note-2) with the use of the term NoSQL itself. [XML databases](https://en.wikipedia.org/wiki/XML_database "XML database") are a subclass of document-oriented databases that are optimized to work with [XML](https://en.wikipedia.org/wiki/XML "XML") documents. [Graph databases](https://en.wikipedia.org/wiki/Graph_databases "Graph databases") are similar, but add another layer, the _relationship_, which allows them to link documents for rapid traversal.

Document-oriented databases are inherently a subclass of the [key-value store](https://en.wikipedia.org/wiki/Key-value_database "Key-value database"), another NoSQL database concept. The difference[_[contradictory](https://en.wikipedia.org/wiki/Category:Articles_contradicting_other_articles "Category:Articles contradicting other articles")_] lies in the way the data is processed; in a key-value store, the data is considered to be inherently opaque to the database, whereas a document-oriented system relies on internal structure in the _document_ in order to extract [metadata](https://en.wikipedia.org/wiki/Metadata "Metadata") that the database engine uses for further optimization. Although the difference is often negligible due to tools in the systems,[[a]](https://en.wikipedia.org/wiki/Document-oriented_database#cite_note-3) conceptually the document-store is designed to offer a richer experience with modern programming techniques.

**Popular Document Databases**: MongoDB, Firestore, CouchDB

---

### Relational:

![[Pasted image 20230121170842.png]]

A **relational database** is a (most commonly digital) [database](https://en.wikipedia.org/wiki/Database "Database") based on the [relational model](https://en.wikipedia.org/wiki/Relational_model "Relational model") of data, as proposed by [E. F. Codd](https://en.wikipedia.org/wiki/E._F._Codd "E. F. Codd") in 1970.[[1]](https://en.wikipedia.org/wiki/Relational_database#cite_note-codd-1) A system used to maintain relational databases is a **relational database management system** (**RDBMS**). Many relational database systems are equipped with the option of using [SQL](https://en.wikipedia.org/wiki/SQL "SQL") (Structured Query Language) for querying and updating the database.(https://en.wikipedia.org/wiki/Relational_database#cite_note-2)
A relational model organizes data into one or more [tables](https://en.wikipedia.org/wiki/Table_(database) "Table (database)") (or "relations") of [columns](https://en.wikipedia.org/wiki/Column_(database) "Column (database)") and [rows](https://en.wikipedia.org/wiki/Row_(database) "Row (database)"), with a unique key identifying each row. Rows are also called [records](https://en.wikipedia.org/wiki/Record_(computer_science) "Record (computer science)") or [tuples](https://en.wikipedia.org/wiki/Tuple "Tuple").(https://en.wikipedia.org/wiki/Relational_database#cite_note-12) Columns are also called attributes. Generally, each table/relation represents one "entity type" (such as customer or product). The rows represent instances of that type of entity (such as "Lee" or "chair") and the columns representing values attributed to that instance (such as address or price).

For example, each row of a class table corresponds to a class, and a class corresponds to multiple students, so the relationship between the class table and the student table is "one to many"(https://en.wikipedia.org/wiki/Relational_database#cite_note-13)

**Popular Relational Databases**: [MySQL](https://fireship.io/lessons/sql-firebase-typeorm/), Postgres, SQL Server, CockroachDB

---

### Graph:

![[Pasted image 20230121170835.png]]

A **graph database** (**GDB**) is a [database](https://en.wikipedia.org/wiki/Database "Database") that uses [graph structures](https://en.wikipedia.org/wiki/Graph_(data_structure) "Graph (data structure)") for [semantic queries](https://en.wikipedia.org/wiki/Semantic_query "Semantic query") with [nodes](https://en.wikipedia.org/wiki/Node_(graph_theory) "Node (graph theory)"), [edges](https://en.wikipedia.org/wiki/Edge_(graph_theory) "Edge (graph theory)"), and properties to represent and store data.(https://en.wikipedia.org/wiki/Graph_database#cite_note-1) A key concept of the system is the _[graph](https://en.wikipedia.org/wiki/Graph_(discrete_mathematics) "Graph (discrete mathematics)")_ (or _edge_ or _relationship_). The graph relates the data items in the store to a collection of nodes and edges, the edges representing the relationships between the nodes. The relationships allow data in the store to be linked together directly and, in many cases, retrieved with one operation. Graph databases hold the relationships between data as a priority. Querying relationships is fast because they are perpetually stored in the database. Relationships can be intuitively visualized using graph databases, making them useful for heavily inter-connected data.(https://en.wikipedia.org/wiki/Graph_database#cite_note-:0-2)
Graph databases are commonly referred to as a [NoSQL](https://en.wikipedia.org/wiki/NoSQL "NoSQL"). Graph databases are similar to 1970s [network model](https://en.wikipedia.org/wiki/Network_model "Network model") databases in that both represent general graphs, but network-model databases operate at a lower level of [abstraction](https://en.wikipedia.org/wiki/Abstraction_(computer_science) "Abstraction (computer science)")(https://en.wikipedia.org/wiki/Graph_database#cite_note-Gutierrez2-3) and lack easy [traversal](https://en.wikipedia.org/wiki/Graph_traversal "Graph traversal") over a chain of edges.(https://en.wikipedia.org/wiki/Graph_database#cite_note-4)

**Popular Graph Databases**: Neo4j, DGraph, Janus Graph

---

### Search Engine:

![[Pasted image 20230121170830.png]]

A **database search engine** is a [search engine](https://en.wikipedia.org/wiki/Search_engine "Search engine") that operates on material stored in a digital [database](https://en.wikipedia.org/wiki/Database "Database").
It provides a distributed, [multitenant](https://en.wikipedia.org/wiki/Multitenancy "Multitenancy")-capable [full-text search](https://en.wikipedia.org/wiki/Full-text_search "Full-text search") engine with an [HTTP](https://en.wikipedia.org/wiki/HTTP "HTTP") web interface and schema-free [JSON](https://en.wikipedia.org/wiki/JSON "JSON") documents. Elasticsearch is developed in [Java](https://en.wikipedia.org/wiki/Java_(programming_language) "Java (programming language)") and is dual-licensed under the [source-available](https://en.wikipedia.org/wiki/Source-available_software "Source-available software") [Server Side Public License](https://en.wikipedia.org/wiki/Server_Side_Public_License "Server Side Public License") and the Elastic license,(https://en.wikipedia.org/wiki/Elasticsearch#cite_note-:0-2) while other parts(https://en.wikipedia.org/wiki/Elasticsearch#cite_note-3) fall under the proprietary ([_source-available_](https://en.wikipedia.org/wiki/Source-available_software "Source-available software")) _Elastic License_. .[[9]](https://en.wikipedia.org/wiki/Elasticsearch#cite_note-programming-language-clients-9) According to the [DB-Engines ranking](https://en.wikipedia.org/wiki/DB-Engines_ranking "DB-Engines ranking"), Elasticsearch is the most popular enterprise search engine.(https://en.wikipedia.org/wiki/Elasticsearch#cite_note-10)

**Popular Search Databases**: ElasticSearch, Algolia, [MeiliSearch](https://fireship.io/lessons/meilisearch-firebase-google-cloud/)

---

### Multi-Model

![[Pasted image 20230121170822.png]]

In the field of database design, a **multi-model database** is a [database management system](https://en.wikipedia.org/wiki/Database_management_systems "Database management systems") designed to support multiple [data models](https://en.wikipedia.org/wiki/Database_model "Database model") against a single, integrated backend. In contrast, most database management systems are organized around a single data model that determines how data can be organized, stored, and manipulated.(https://en.wikipedia.org/wiki/Multi-model_database#cite_note-neither-1) [Document](https://en.wikipedia.org/wiki/Document-oriented_database "Document-oriented database"), [graph](https://en.wikipedia.org/wiki/Graph_database "Graph database"), [relational](https://en.wikipedia.org/wiki/Relational_database "Relational database"), and [key–value](https://en.wikipedia.org/wiki/Key%E2%80%93value_database "Key–value database") models are examples of data models that may be supported by a multi-model database.
A multi-model database is a database that can store, index and query data in more than one model. For some time, databases have primarily supported only one model, such as: [relational database](https://en.wikipedia.org/wiki/Relational_database "Relational database"), [document-oriented database](https://en.wikipedia.org/wiki/Document-oriented_database "Document-oriented database"), [graph database](https://en.wikipedia.org/wiki/Graph_database "Graph database") or [triplestore](https://en.wikipedia.org/wiki/Triplestore "Triplestore"). A database that combines many of these is multi-model.

**Popular Multi-model Databases**: FaunaDB, CosmosDB

Documentations used:
https://www.postgresql.org/files/documentation/pdf/14/postgresql-14-A4.pdf
https://www.mongodb.com/docs/
#postgresql #Database #mongoDB #relationalParadigm #documentParadigm 
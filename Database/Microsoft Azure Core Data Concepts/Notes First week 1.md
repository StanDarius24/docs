#certificate #azure #Database 

In database systems, ACID (Atomicity, Consistency, Isolation, Durability) refers to a standard set of properties that guarantee database transactions are processed reliably.

---

### Atomicity

Atomicity means that you guarantee that either all of the transaction succeeds or none of it does. You don’t get part of it succeeding and part of it not. If one part of the transaction fails, the whole transaction fails. With atomicity, it’s either “all or nothing”.

---

### Consistency

This ensures that you guarantee that all data will be consistent. All data will be valid according to all defined rules, including any constraints, cascades, and triggers that have been applied on the database.

---

### Isolation

Guarantees that all transactions will occur in isolation. No transaction will be affected by any other transaction. So a transaction cannot read data from any other transaction that has not yet completed.

---

### Durability

Durability means that, once a transaction is committed, it will remain in the system – even if there’s a system crash immediately following the transaction. Any changes from the transaction must be stored permanently. If the system tells the user that the transaction has succeeded, the transaction must have, in fact, succeeded.

---

## Streaming Data

-   Batch processing is a technique for automating and processing multiple transactions as a single group.
-   Batch processing helps in handling tasks like payroll, end-of-month reconciliation, or settling trades overnight.
-   Batch processing systems can save money and labor over time, but they may be costly to design and implement up-front.

---


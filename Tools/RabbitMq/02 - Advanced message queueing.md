
---
## Quorum queues

This is a replicated queue to provide high availability and data safety. Quorum queues ensure that the cluster is up-to-date by agreeing on the contents of a queue. All communication is routed to the queue leader, which means the queue leader locality has an effect on the latency and bandwidth requirement of the messages.

In quorum queues, the leader and replication are consensus-driven, which means they agree on the state of the queue and its contents. Quorum queues will only confirm when the majority of its nodes are available, which thereby avoids data loss.

After declaring a quorum queue, you can bind it to any exchange just as with other queue types. Queues must be durable and instantiated by setting the x-queue-type header to quorum. If the majority of nodes agree on the contents of a queue, the data is valid. Otherwise, the system attempts to bring all queues up to date.

---

## PREFETCH

The RabbitMQ prefetch value is used to specify how many messages are being sent at the same time.

Messages in RabbitMQ are pushed from the broker to the consumers. The RabbitMQ default prefetch setting gives clients an unlimited buffer, meaning that RabbitMQ, by default, sends as many messages as it can to any consumer that appears ready to accept them. It is, therefore, possible to have more than one message "in flight" on a channel at any given moment.

Messages are cached by the RabbitMQ client library (in the consumer) until processed. All pre-fetched messages are invisible to other consumers and are listed as unacked messages in the RabbitMQ management interface.

An unlimited buffer of messages sent from the broker to the consumer could lead to a window of many unacknowledged messages. Prefetching in RabbitMQ simply allows you to set a limit of the number of unacked (not handled) messages.

There are two prefetch options available, channel prefetch count and consumer prefetch count.

-> 

The channel prefetch value defines the max number of unacknowledged deliveries that are permitted on a channel. Setting a limit on this buffer caps the number of received messages before the broker waits for an acknowledgment.

Because a single channel may consume from multiple queues, coordination between them is required to ensure that they don’t pass the limit. This can be a slow process especially when consuming across a cluster, and it is not the recommended approach.

The best practice is to set a consumer prefetch by setting a limit on the number of unacked messages at the client.

Optimizing the prefetch count requires that you are considering the number of consumers and messages your broker handles. There is a negligible amount of additional overhead. The broker must understand how many messages to send to each consumer instead of each channel.

Let’s imagine a queue with 1000 messages and 3 consumers.

- **prefetch = 1:**  
    Each consumer gets **1 message at a time**.  
    After it ACKs, RabbitMQ sends the next one.  
    → Best fairness, worst throughput.
    
- **prefetch = 10:**  
    Each consumer can get up to **10 unacked messages**.  
    → Good balance between fairness and throughput.
    
- **prefetch = 0:**  
    Means _no limit_ (RabbitMQ will send messages as fast as the consumer’s TCP buffer allows).  
    → High throughput but potential overload and out-of-memory risks.

|Scenario|Recommended Prefetch|
|---|---|
|Short, lightweight message processing (sub-ms)|50–300|
|Medium processing time (50–200 ms per message)|10–50|
|Heavy or CPU-bound processing (>500 ms per message)|1–5|
|Long I/O operations or variable latency|Start with 1–10 and adjust|

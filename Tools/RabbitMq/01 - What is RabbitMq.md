
book as reference: https://www.cloudamqp.com/blog/part1-rabbitmq-for-beginners-what-is-rabbitmq.html

-> Message Queue:
- Message queuing allows applications to communicate by sending messages to each other. The message queue provides temporary message storage when the destination program is busy or not connected.
- A message queue is made up of a producer, a broker (the message queue software), and a consumer.
- A message queue provides an asynchronous communication between applications

PRODUCER -MESSAGE-> MESSAGE BROKER -MESSAGE-> CONSUMER

--- 

**Producer** is an application that sends messages. It does not send messages directly to the consumer. It send messages only to the rabbitmq broker

**Consumer** is an application that reads messages from the rabbitmq broker (multiple consumers)

**Queue** is a buffer or storage in a rabbitMQ broker to store the messages. The messages are put into a queue by a producer and read from it by a consumer. Once a message is read, it is consumed and removed from the queue. A message can thus only pe processed exactly once.

**Connection** - A link between the application (producer and consumer) and the broker, that performs underlying networking tasks including initial authentication, IP resolution, and networking.

**Channel** - Connections can multiplex over a single TCP connection, meaning that an application can open "lightweight connections" on a single connection. This lightweight connection is called a channel. Each connection can maintain a set of underlying channels.

**Message** is an information that is sent from the producer to a consumer though RabbitMq

**Exchange** it acts as an intermediary between the producer and a queue. Instead of sending messages directly to a queue, a producer can send them to an exchange instead. The exchange then sends those messages to one or more queues following a specified set of rules. Thus, the producer does not need to know the queues that eventually receive those messages.

**Routing key** is a key that the exchange looks at to decide how to route the message to queues. The routing key is like an address for the message

![[Screenshot 2025-10-02 at 00.00.35.png]]

**Binding** is a link between a queue and an exchange, an association, or relationship between a queue and an exchange. It describes which queue is interested in messages from a given exchange.

**AMQP** - Advanced Message Queueing Protocol is the primary protocol used by RabbitMQ for messaging.

**Users** - Connecting to RabbitMQ with a given username and password, that is assigned permissions such as rights to read, write and configure. Users can also have specific permissions to a specific virtual host.

**Vhost** - Virtual host or vhost segregates applications that are using the same RabbitMQ instance. Different users can have different access privileges to different vhosts and queues and exchanges can be created so that they only exist in one vhost.

**Acknowledgments and Confirms** - Acknowledgments can be used in both directions, indicating that messages have been received or acted upon. For instance, a consumer can inform the broker that it has received or processed a message, and the broker can confirm to the producer that a message has been received.

---

Messaging System architecture
				Message Broker 
Producer - Message -> ( Queue ) - Message -> Consumer

---

Simple RabbitMQ Architecture

Producer - Message -> ( Exchange ) -> (Queue) - Message -> Consumer

---

RabbitMQ Architecture with Multiple Queues

Producer - Message -> ( Exchange )
					    |-- Routing Key -> ( Queue ) - Message -> Consumer
					    |-- Routing Key -> ( Queue ) - Message -> Consumer
					    |-- Routing Key -> ( Queue ) - Message -> Consumer

---

Rabbitmq UI

- **Connections** →
    - A _connection_ represents a TCP link between your application (producer or consumer) and the RabbitMQ broker.
    - Every producer and consumer needs a connection to communicate with RabbitMQ.
    - In the UI, you’ll see active connections whenever clients are connected to the broker.
- **Channels** →
    - A _channel_ is a lightweight communication layer that sits on top of a connection.
    - Producers and consumers use channels to publish and consume messages without creating new TCP connections each time.
    - Typically, a single connection can host multiple channels.
- **Exchanges** →
    - An _exchange_ receives messages from producers and routes them to queues based on rules (bindings and routing keys).
    - Types of exchanges include **Direct**, **Fanout**, **Topic**, and **Headers**, each determining how messages are delivered to queues.
- **Queues** →
    - A _queue_ stores messages until they are consumed by a consumer.
    - Each queue is bound to one or more exchanges and may have different routing rules.
    - In the UI, you can see queue details such as the number of ready messages, unacknowledged messages, and consumers attached.


---

Rather than directly publishing messages to a queue, producers send them to an exchange. The exchange uses bindings and routing keys to determine the correct destination for the message. Bindings link the queue to an exchange. Routing keys act as an address for the message.

### Types of Exchanges
- Direct - A direct exchange delivers messages to queues based on a message routing key. In a direct exchange, messages are routed to the queue with the binding key that exactly matches the routing key of the message.
- Topic - The topic exchange performs a wildcard match between the routing key and the routing pattern specified in the binding
- Fanout - A fanout exchange routes messages to all of the queues with a binding tied to the exchange.
- Headers - A header exchange uses the message header attributes for routing purposes.

---

Messages are not published directly to a queue. Instead, the producer sends messages to an exchange. Exchanges are message routing agents, living in a virtual host (vhost) within RabbitMQ. Exchanges accept messages from the producer application and route them to message queues with the help of header attributes, bindings, and routing keys.

A binding is a link configured to make a connection between a queue and an exchange. The routing key is a message attribute. The exchange might look at the routing key, depending on exchange type, when deciding on how to route the message to the correct queue. 

Exchanges, connections, and queues can be configured to include properties such as durable, temporary, and auto-delete. Durable exchanges survive server restarts and last until they are deleted. Temporary exchanges exist until RabbitMQ is shut down. Auto-deleted exchanges are removed once the last bound object is unbound from the exchange.

In RabbitMQ, four different types of exchanges route the message differently using different parameters and bindings setups. Clients can create their own unique exchanges or use the predefined default exchanges.

---

## Direct Exchange

A direct exchange delivers messages to queues based on a routing key. The routing key is a message attribute added to the message by the producer. Think of the routing key as an address that the exchange uses to decide on how to route the message. A message goes to the queue(s) that exactly matches the binding key to the routing key of the message. The direct exchange type is useful to distinguish messages published to the same exchange using a simple string identifier. Default exchange is "" empty string

**If the message routing key does not match any binding key, the message is discarded or forwarded to an alternate exchange if specified.**

---

## Topic exchange

Topic exchanges route messages to a queue based on a wildcard match between the routing key and the routing pattern, which is specified by the queue binding. Messages can be routed to one or many queues depending on this wildcard match.

The routing key must be a list of words delimited by a period (.). Examples include agreements.us or agreements.eu.stockholm, which in this case identifies agreements that are set up for a company with offices in different locations. The routing patterns may contain an asterisk ("*") to match a word in a specific position of the routing key (e.g., a routing pattern of agreements.*.*.b.* only match routing keys where the first word is agreements and the fourth word is "b"). A pound symbol ("#") indicates a match on zero or more words (e.g., a routing pattern of agreements.eu.berlin.# matches any routing keys beginning with agreements.eu.berlin).

The consumers indicate which topics they are interested in (like subscribing to a feed of an individual tag). The consumer creates a queue and sets up a binding with a given routing pattern to the exchange. All messages with a routing key that match the routing pattern are routed to the queue and stay there until the consumer handles the message.

---

## FANOUT EXCHANGE

Fanout exchanges copy and route a received message to all queues that are bound to it regardless of routing keys or pattern matching, unlike direct and topic exchanges. If routing keys are provided, they will be ignored.

Fanout exchanges can be useful when the same message needs to be sent to one or more queues with consumers who may process the same message in different ways, like in distributed systems designed to broadcast various state and configuration updates.

---

## HEADERS EXCHANGE

A headers exchange routes messages based on arguments contained in headers and optional values. Headers exchanges are very similar to topic exchanges, but route messages based on header values instead of routing keys. A message matches if the value of the header equals the value specified upon binding.

A special argument named "x-match", added in the binding between the exchange and the queue, specifies if all headers must match or just one. Either any common header between the message and the binding counts as a match or all the headers referenced in the binding need to be present in the message for it to match.

The "x-match" property can have two different values: "any" or "all", where "all" is the default value. A value of "all" means all header pairs (key, value) must match, while value of "any" means at least one of the header pairs must match. Headers can be constructed using a wider range of data types, for example, integer or hash, instead of a string. The headers exchange type (used with the binding argument "any") is useful for directing messages which contain a subset of known (unordered) criteria.

## DEAD LETTER EXCHANGE

RabbitMQ provides an AMQP extension known as the dead letter exchange. A message is considered dead when it has reached the end of it's time-to-live, the queue exceeds the max length (messages or bytes) configured, or the message has been rejected by the queue or nacked by the consumer for some reason and is not marked for re-queueing. A dead-lettered message can be republished to an exchange called dead letter exchange. The message is routed to the dead letter exchange either with the routing key specified for the queue they were on or with the same routing keys with which they were originally published. The exchange then routes the message to a defined dead-letter queue.

## ALTERNATE EXCHANGE

A client may accidentally or maliciously route messages using non-existent routing keys. To avoid complications from lost information, collecting unroutable messages in a RabbitMQ alternate exchange is an easy, safe backup. RabbitMQ handles unroutable messages in two ways based on the mandatory flag setting within the message header. The server either returns the message when the flag is set to "true" or silently drops the message when set to "false". RabbitMQ let you define an alternate exchange to apply logic to unroutable messages.

---

# ARGUMENTS AND PROPERTIES

---

RabbitMQ has arguments and properties that can be used to define behaviours. Properties are defined by the AMQP protocol and included in RabbitMQ. Arguments can be any key-value pair and are used for feature extensions. Some properties are mandatory while others are optional, and all arguments are optional. Properties and Arguments can be defined for Queues, Exchanges, and Messages in RabbitMQ. Examples of a property for a queue is: `passive`, `durable` and `exclusive`

An argument is an optional feature for defining behaviours, implemented by the RabbitMQ server. These arguments are also known as x-arguments and can sometimes be changed after queue declaration. An example of an argument for messages and queues is TTL, time to live

Examples of Queue Properties include passive, which determines if the queue already exists, and durable, which tells if the queue remains when a server restarts. An example of Queue Arguments includes x-max-priority, which sets a maximum number of priorities, or x-message-ttl, which sets queue TTL.

An example of an Exchange Property is `durable`, which tells if the exchange remains when a server restarts, and `internal` which tells that the exchange can not be used directly by publishers.

Examples of Exchange Arguments include `x-dead-letter-exchange` and `x-dead-letter-routing-key`, which are used by the dead letter exchange.

Can be added via code/interface
![[Screenshot 2025-10-28 at 21.52.27.png]]

---

### ARGUMENTS AND POLICIES

To set arguments, the use of policies is recommended. Policies make it possible to configure arguments for one or many queues at once, and the queues will all be updated when you’re updating the policy definition. To reduce the overhead work of configuring every single queue and exchange with arguments, the use of policies is perfect. Policies enable a way to configure multiple queues or exchanges in a consistent way, reducing the risk of sloppy mistakes in the configuration. A queue can only be applied by one policy simultaneously, but there is a priority system along with the regex recognition in order to manage several policies.

![[Screenshot 2025-10-28 at 21.54.19.png]]

Policies can be advantageously used to apply queue or exchange arguments to more than one created queue/exchange. Policies are created per vhost, with a pattern that defines where it will be applied and a parameter that defines what the policy will do.

---


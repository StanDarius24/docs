#books Java Concurrency in Practice

Brian Goetz
Tim Peierls
Joshua Bloch
Joseph Bowbeer
David Holmes
Doug Lea

Writing correct programs is hard; writing correct concurrent programs is `harder`. There are simply more things that can go wrong in a concurrent program than in a sequential one. So, why do we bother with concurrency? Threads are an 
inescapable  feature  of  the  Java  language,  and  they  can  simplify  the  development  of  complex  systems  by  turning  complicated  `asynchronous  code`  into  simpler  straight line  code.  In  addition,  threads  are  the  easiest  way  to  tap  the computing power of multiprocessor systems. And, as processor counts increase, exploiting concurrency effectively will only become more important. 

Writing correct programs is hard; writing correct concurrent programs is harder. There are simply more things that can go wrong in a concurrent program than in a sequential one. So, why do we bother with concurrency? ThreThe sequential programming model is intuitive and natural, as it models the way humans work: do one thing at a time, in sequence mostly. Get out of bed, put on your bathrobe, go downstairs and start the tea. As in programming languages, each of these realworld actions is an abstraction for a sequence of finergrained actions  open the cupboard, select a flavor of tea, measure some tea into the pot, see if there's enough water in the teakettle, if not put some more water in, set it on the stove, turn the stove on, wait for the water to boil, and so on. This last step waiting for the water to boil also involves a degree of asynchrony. While the water is heating, you have a choice of what to do just wait, or do other tasks in that time such as starting the toast (another asynchronous task) or fetching the newspaper, while remaining aware that your attention will soon be needed by the teakettle. The manufacturers of teakettles and toasters know their products are often used in an asynchronous manner, so they raise an audible signal when they complete their task. Finding the right balance of sequentiality and asynchrony is often a characteristic of efficient people and the same is true of programs. ads are an inescapable feature of the Java language, and they can simplify the development of complex systems by turning 
complicated asynchronous code into simpler straightline code. In addition, threads are the easiest way to tap the computing power of multiprocessor systems. And, as processor counts increase, exploiting concurrency effectively will only become more important. 

Threads are sometimes called lightweight processes, and most modern operating systems treat threads, not processes, as the basic units of scheduling. In the absence of explicit coordination, threads execute simultaneously and asynchronously with respect to one another. Since threads share the memory address space of their owning process, all threads within a process have access to the same variables and allocate objects from the same heap, which allows finer grained data sharing than inter process mechanisms. But without explicit synchronization to coordinate access to shared data, a thread may modify variables that another thread is in the middle of using, with unpredictable results. 

When used properly, threads can reduce development and maintenance costs and improve the performance of complex applications. Threads make it easier to model how humans work and interact, by turning asynchronous workflows into 
mostly sequential ones. They can also turn otherwise convoluted code into straight line code that is easier to write, read, and maintain. 

Multiprocessor systems used to be expensive and rare, found only in large data centers and scientific computing facilities. Today they are cheap and plentiful; even low end server and midrange desktop systems often have multiple processors. This trend will only accelerate; as it gets harder to scale up clock rates, processor manufacturers will instead put more processor cores on a single chip. All the major chip manufacturers have begun this transition, and we are already seeing machines with dramatically higher processor counts. 

Since the basic unit of scheduling is the thread, a program with only one thread can run on at most one processor at a time. On a two processor system, a single threaded program is giving up access to half the available CPU resources; on a 
100 processor system, it is giving up access to 99%. On the other hand, programs with multiple active threads can execute simultaneously on multiple processors. When properly designed, multithreaded programs can improve 
throughput by utilizing available processor resources more effectively. 

Using multiple threads can also help achieve better throughput on single processor systems. If a program is single threaded, the processor remains idle while it waits for a synchronous I/O operation to complete. In a multithreaded 
program, another thread can still run while the first thread is waiting for the I/O to complete, allowing the application to still make progress during the blocking I/O. (This is like reading the newspaper while waiting for the water to boil, rather 
than waiting for the water to boil before starting to read.) 

#softwareQuality 

**Don't Repeat Yourself**: Every piece of knowledge must have a single, unambiguous, authoritative representation within a system.

Each significant piece of functionality in a program should be implemented in just one place in the source code. Where similar functions are carried out by distinct pieces of code, it is generally beneficial to combine them into one by abstracting out the varying parts.

Why
-   Duplication (inadvertent or purposeful duplication) can lead to maintenance nightmares, poor factoring, and logical contradictions.
-   A modification of any single element of a system does not require a change in other logically unrelated elements.
-   Additionally, elements that are logically related all change predictably and uniformly, and are thus kept in sync.

How
-   Put business rules, long expressions, if statements, math formulas, metadata, etc. in only one place.
-   Identify the single, definitive source of every piece of knowledge used in your system, and then use that source to generate applicable instances of that knowledge (code, documentation, tests, etc).
-   Apply the [Rule of three](https://en.wikipedia.org/wiki/Rule_of_three_(computer_programming)).
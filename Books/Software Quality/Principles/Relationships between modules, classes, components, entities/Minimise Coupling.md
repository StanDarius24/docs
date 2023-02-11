Coupling between modules or components is their degree of mutual interdependence; lower coupling is better. In other words, coupling is the probability that code unit "B" will "break" after an unknown change to code unit "A".

Why
-   A change in one module usually forces a ripple effect of changes in other modules.
-   Assembly of modules might require more effort and/or time due to the increased inter-module dependency.
-   A particular module might be harder to reuse and/or test because dependent modules must be included.
-   Developers might be afraid to change code because they aren't sure what might be affected.

How
-   Eliminate, minimise, and reduce complexity of necessary relationships.
-   By hiding implementation details, coupling is reduced.
-   Apply the [Law of Demeter](https://github.com/webpro/programming-principles#law-of-demeter).
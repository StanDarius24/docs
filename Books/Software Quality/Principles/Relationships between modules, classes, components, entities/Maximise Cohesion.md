#softwareQuality 

## Maximise Cohesion

Cohesion of a single module or component is the degree to which its responsibilities form a meaningful unit. Higher cohesion is better.

Why
-   Reduced module complexity
-   Increased system maintainability, because logical changes in the domain affect fewer modules, and because changes in one module require fewer changes in other modules.
-   Increased module reusability, because application developers will find the component they need more easily among the cohesive set of operations provided by the module.

How
-   Group related functionalities sharing a single responsibility (e.g. in a module or class).
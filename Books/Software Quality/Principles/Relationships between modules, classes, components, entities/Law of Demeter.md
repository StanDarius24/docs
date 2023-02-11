#softwareQuality 

Don't talk to strangers.

Why
-   It usually tightens coupling
-   It might reveal too much implementation details

How
A method of an object may only call methods of:

1.  The object itself.
2.  An argument of the method.
3.  Any object created within the method.
4.  Any direct properties/fields of the object.
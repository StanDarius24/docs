#softwareQuality 

## Encapsulate What Changes

A good design identifies the hotspots that are most likely to change and encapsulates them behind an interface. When an anticipated change then occurs, the modifications are kept local.

Why
-   To minimize required modifications when a change occurs.

How
-   Encapsulate the concept that varies behind an interface.
-   Possibly separate the varying concept into its own module.
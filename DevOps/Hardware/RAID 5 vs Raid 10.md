#devops 

RAID 10 = Combining features of RAID 0 + RAID 1. It provides optimization for fault tolerance.
RAID 0 helps to increase performance by striping volume data across multiple disk drives.
RAID 1 provides disk mirroring which duplicates your data.

![[Pasted image 20221123233725.png]]
![[Pasted image 20221123233749.png]]


---

RAID 5 costs more for write-intensive applications than RAID 1.
RAID 5 is less outage resilient than RAID 1.
RAID 5 suffers massive performance degradation during partial outage.
RAID 5 is less architecturally flexible than RAID 1.
Correcting RAID 5 performance problems can be very expensive.


---

For RAID 5 you need three minimum hard drive disks. For example:

1.  Level : RAID 5
2.  Number of disks: 3 (plus 1 spare drive)
3.  Drive size: 4000 GB
4.  Total RAID capacity: 8 TB
5.  Max fault tolerance: 1 disk
6.  Theoretical read performance: 2x
7.  Theoretical write performance: 1x (poor for small size write/files)
8.  Storage efficiency: 2/3 (66.7%)

RAID 10 you need four minimum hard drive disks. For example:

1.  Level : RAID 10
2.  Number of disks: 4 (plus 1 spare drive)
3.  Drive size: 4000 GB
4.  Total RAID capacity: 8 TB
5.  Max fault tolerance: 1 disk
6.  Theoretical read performance: 4x
7.  Theoretical write performance: 2x
8.  Storage efficiency: 1/2 (50%)
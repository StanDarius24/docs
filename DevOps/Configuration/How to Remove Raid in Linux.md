## Remove Raid in Linux

Follow the below steps to remove the raid md device in Linux.

**1**. Find the below details.
```
Operating system  : CentOS release 6.5 (Final)
RAID device 	  : /dev/md0
		  : md0 : active raid5 sdd1[4] sdc1[3] sdb1[1] sda1[0]
```
As you can see I have md0 device which contain four active Disks like below.

**2**. Check the Raid status.
```
# cat /proc/mdstat 
Personalities : [raid6] [raid5] [raid4] 
md0 : active raid5 sdd1[4] sdc1[3] sdb1[1] sda1[0]
      4189184 blocks super 1.2 level 5, 512k chunk, algorithm 2 [4/4] [UUUU]
      
unused devices: 

[root@srv6 ~]# mdadm --detail /dev/md0
/dev/md0:
        Version : 1.2
  Creation Time : Wed Apr 19 01:47:10 2017
     Raid Level : raid5
     Array Size : 4189184 (4.00 GiB 4.29 GB)
  Used Dev Size : 2094592 (2045.84 MiB 2144.86 MB)
   Raid Devices : 4
  Total Devices : 4
    Persistence : Superblock is persistent

    Update Time : Wed Apr 19 21:59:48 2017
          State : clean 
 Active Devices : 4
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 0

         Layout : left-symmetric
     Chunk Size : 512K

           Name : srv6:0  (local to host srv6)
           UUID : 4e7c1751:cd467d3f:8e86a6a1:3c88f6a4
         Events : 139

    Number   Major   Minor   RaidDevice State
       0       8        1        0      active sync   /dev/sda1
       1       8       17        1      active sync   /dev/sdb1
       3       8       33        2      active sync   /dev/sdc1
       4       8       49        3      active sync   /dev/sdd1
```

3. Remove RAID 5 device. First of all we should take backup of data stored in RAID device in case it needed and unmount it from filesystem like below.
```
# df -hTP /raid5_disk/
Filesystem     Type  Size  Used Avail Use% Mounted on
/dev/md0       ext4  5.9G  213M  5.4G   4% /raid5_disk

# umount /raid5_disk

# sed -i '/md0/d' /etc/fstab
```
**4**. Now we can stop or deactivate RAID device by running below command from root user.
```
# mdadm --stop /dev/md0
mdadm: stopped /dev/md0
```
After stopping the raid device you, can remove md device.
```
# mdadm --remove /dev/md0
```
In some OS, i find we can’t remove md device because md device is already removed after stopped with stop option as above.
```
# mdadm  --stop /dev/md0 
mdadm: stopped /dev/md0

# cat /proc/mdstat 
Personalities : [raid6] [raid5] [raid4] 
unused devices: 

# ls -l /dev/md0
ls: cannot access /dev/md0: No such file or directory

# mdadm  --remove /dev/md0 
mdadm: error opening /dev/md0: No such file or directory
```
Raid device successfully removed. Now we can Finally remove superblocks from all associated disks, like below.
```
# mdadm --zero-superblock /dev/sda1 /dev/sdb1 /dev/sdc1 /dev/sdd1
```
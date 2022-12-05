#linux

-   its huge. Its code base size is 10% of the linux kernel size. Its PID 1! That's a lot of unfound bugs that will bring the whole system down...
    
-   feature creep. We all know it manages services... but its also slowly replacing fs mounting, cron, temp management and a whole lot more... still while pid 1. A cron bug won't bring your system down. A systemd-jobs bug might.
    
-   it has quite a few security issues
    
-   it isn't posix compliant so alienates other unix OSs. This is a really dumb thing because software depends on systemd (like gnome) making ports to BSD a nightmare. Alienating other unix OSs makes innovation sharing harder for everyone.

The unix philosophy is that your app should do 1 thing and do it well. Systemd seems to do everything, at best well, at worst it's a liability.It does parallel job starting well and lazy loading of services so I'll give it that. That's why linux systemd adopted it so widely, but I don't think it was worth it. We lost a lot of trust.
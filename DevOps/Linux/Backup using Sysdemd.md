---
My requirements for a task scheduler were:
-   Run some quick tasks every day
-   Run some long running tasks every 12 hours (sometimes these tasks take over 30 hours)
-   Don’t run a task if the same type of task is already running. For example, don’t start a new instance of the adidas.com scraper if an old instance is still running.

After learning about systemd, I learned that it met all my requirements and had some pretty awesome benefits:

-   Automatic log rotation
-   Random delays: add `RandomizedDelaySec` to a timer
-   Memory and CPU limits: add `CPUQuota` or `MemoryLimit` to a slice
-   Easy to debug: `systemctl` lets you view logs, exit codes, and timer history

---

#linux #systemd

```bash
# /etc/systemd/system/backup-data.service
[Unit]
Description=Backup hq-Heydo docker volume
Wants=backup-data.timer
[Service]
ExecStart=/bin/bash /home/werft/script.sh
WorkingDirectory=/home/werft
Slice=backup=data.slice
[Install]
WantedBy=multi-user.target
```

```bash
# /etc/systemd/system/backup-data.timer
[Unit]
Description=Backup hq-Heydo every day
Requires=backup-data.service
[Timer]
Unit=backup-data.service
OnCalendar=daily
Persistent=true
[Install]
WantedBy=timers.target
```

```bash
# /etc/systemd/system/backup-data.slice
[Unit]
Description=Limited resources Slice
DefaultDependencies=no
Before=slices.target
[Slice]
CPUQuota=80%
```

where /home/werft/backup-data.sh has a rsync call.

after that run

```bash
systemctl daemon-reload
systemctl enable backup-data.timer backup-data.timer 
systemctl start backup-data.timer backup-data.service
# to see the timer logs
systemctl list-timers
```

*More*

-   Myth: Email alerts are easier with cron. Actually, you can use `OnFailure=` with a systemd service to [call the mail](https://www.curry-software.com/en/blog/telegram_unit_fail/) command.
-   You can use [flock](https://linuxaria.com/howto/linux-shell-introduction-to-flock) with cron to prevent running multiple instances of the same task.

*Conclusion*

In conclusion systemd can be a nicer alternative to cron. Compared to cron, it can take a lot of time to configure systemd. But, systemd makes other things easier, like debugging errors, setting CPU and memory limits, and randomized scheduling.

tl;dr
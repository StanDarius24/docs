```bash
$ pg_dump -U db_user -W -F p db_name > /path_of_the_dump/dump_file.sql
```

```bash
$ CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES 1477326feb62 grafana/grafana "/run.sh" 2 months ago Up 3 days 0.0.0.0:3000->3000/tcp grafana 8c45029d15e8 prom/prometheus "/bin/prometheus --c…" 2 months ago Up 3 days 0.0.0.0:9090->9090/tcp prometheus
```

if you dont have a volume attach 

```bash
*$ docker cp /home/dump.sql 1477326feb62:/usr/share/grafana/conf/
```

```bash
$ scp -i ~/.ssh/id_rsa root@157.90.130.141:/home/dump.sql .
```

```bash
$ psql databasename < dump.sql
```

in configuration table change:

datastorage.cachestorage.path -> empty
datastorage.local.path -> spo-storage
datastorage.path -> spo-storage
datastorage.selected -> localedir

and also,

mongo.eventlogs.host -> localhost
mongo.eventlogs.port -> 27017
mongo.eventlogs.key -> do not modify
mongo.host -> localhost
mongo.key -> do not modify
mongo.port -> 27017

delete everything related to mongo, pass, etc.


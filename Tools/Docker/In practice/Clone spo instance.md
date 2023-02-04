

-   ssh server
-   goto: /var/lib/docker/volumes
-   ssh-add .ssh/id_rsa (ssh-agent)
    
-   ssh -A m.heydo.space
    
-   scp -r spaceone-dock_hennecke-postgres-data/ development.heydo.[space:/var/lib/docker/volumes](http://space/var/lib/docker/volumes)
    
-   rsync -avz --delete spaceone-dock_hennecke-spaceone-cache/ development.heydo.[space:/var/lib/docker/volumes/spaceone-dock_hennecke-spaceone-cache/](http://space/var/lib/docker/volumes/spaceone-dock_hennecke-spaceone-cache/)
    
-   all 4 volumes /instance (Hennecke missing cache)

Portainer

-   copy into stack postgres container & all volumes
-   connect to postgres container console
-   SELECT * FROM configuration WHERE key ILIKE '%dock%';
    -   edit/delete dock.container.key  UPDATE configuration SET value = 'buehler2' WHERE key = 'dock.container.key';
    -   in the master if old key was correct: select key, host, uuid, exthost from dockcontainer ;
    -   delete dock.container.uuid | DELETE FROM configuration WHERE key = 'dock.container.uuid'; /  UPDATE configuration SET value = '' WHERE key = 'dock.container.uuid';
-   change mailto debug [mail.debug.to](http://mail.debug.to/) | SELECT * FROM configuration WHERE key ILIKE '%debug%';
    -   UPDATE configuration SET value = 'alex.binzar@[h](http://heydo.net/)ibyte.ro' WHERE key = '[mail.debug.to](http://mail.debug.to/)';
-   copy remaining container into the stack 
    -   maybe check labels
    -   check volumes
Add a slave node in jenkins (there are going to be more servers which will handle the builds)
So let's say that we have a server that builds frontend apps and another server that builds backend apps.
So it will be a main server that will receive the command to build a new image and this server will delegate to a slave server to do it.

1. So we need ssh authorization from master to slave.

### Mac OS
	sudo systemsetup -setremotelogin on
	sudo systemsetup -getremotelogin <- you can check
	reboot

For linux it's quite simple, it doesnt require documentation :P

---

click on build executor , create new node.

in remote root directory add the project path
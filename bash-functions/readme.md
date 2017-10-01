# Collection of .bashrc functions I use #

These bash functions get added to the linux users .bashrc, almost all of these functions get used by my docker scripts. I then use bashrc_sync.sh to push the .bashrc out to the hosts. This can be done better by using Ansible instead of a bash script.

### Bash Functions ###

Display the running processes inside of a docker container
**function dockertop()**

----------

Display some stats about a docker container
**function dockerstats()**

----------

Easy way to connect into a docker container
**function dockerconn()**

----------

Show the logs for a docker container
**function dockerlog()**

----------

This beast gathers information on running containers from multiple docker commands and displays it in way that is friendly for my other scripts.
**function dockerlabelsscript()**

----------

Gets memory used by container, used for my DockerMemoryMon.sh script
**function dockerstatsscript()**

----------

Extract some custom labels we have on containers.
**function labellooker()**

----------

Display all running docker containers, in my case we want to display the registrator container first.
**function getRunning()**

----------

Displays how much devicemapper space is available, used and total for docker host.
**function devicemapperget()**

----------

Display the number of restarts that have happened for a container in a non-swarm env. if you reach the restart count limit it will not start back up and you will have to redeloy.
**function DockerRestartCount()**

----------

This will delete heap dumps from inside containers, used for node.js apps in docker containers. While this will remove the heaps it will not free up the space on the device mapper FS until you stop them and docker system purge/docker rm container. If using device mapper be sure to monitor it, when it fills up you will have to rebuild the LVM.
**function DockerHeapCleanUp()**

----------

Experimental only, cp'ing files out of an cotainer fails to work as expected.
**function DockerTakeHeapDump()**

----------

Millage will vary with this depending on how you use docker secrets.
**function SecretKitty()**

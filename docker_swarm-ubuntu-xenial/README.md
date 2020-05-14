# Basic Docker Swarm

This provides a little sandbox for running a Docker Swarm with 3 nodes (one manager and 2 workers).

## Setup

* Bring up the machines using `vagrant up`
* SSH to the manager with `vagrant ssh manager` and start the Swarm with `docker swarm init --advertise-addr 192.168.10.100` (the output of this command will contain the join token)
* SSH to worker1 with `vagrant ssh worker1` and join the Swarm with `docker swarm join --token <token> 192.168.10.100:2377`
* SSH to worker2 with `vagrant ssh worker2` and join the Swarm with `docker swarm join --token <token> 192.168.10.100:2377`

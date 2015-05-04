# Makefile for docker-logstash-client

# set token
ELK_HOST ?= '45.55.215.236'

# docker settings
ENVS =  -e ELK_HOST=$(ELK_HOST)
PORTS = -p 7001:7001
CONTAINER = logstash-client
VOLUMES = -v /var/log:/var/host/log



.PHONY: container run

container :
	docker build -t $(CONTAINER) .

run :
	docker run --log-driver syslog --name $(CONTAINER) -i -d $(PORTS) $(ENVS) $(VOLUMES) -t $(CONTAINER)
stop :
	docker stop $(CONTAINER)
	docker rm $(CONTAINER)
kill :
	docker kill $(CONTAINER)
	docker rm $(CONTAINER)
restart :
	docker kill $(CONTAINER)
	docker rm $(CONTAINER)
	docker run --log-driver syslog --name $(CONTAINER) -i -d $(PORTS) $(ENVS) $(VOLUMES) -t $(CONTAINER)
attach:
	docker attach $(CONTAINER)

tail:
	docker logs -f $(CONTAINER)

Custom consul docker image

Version 1.0

To Pull this image please run following command :

    docker pull thegeeklinux/consul:1.0
To create container run following command :

	docker run --name="consul" -d -p "8300:8300" -p "8301:8301/udp" -p "8301:8301" -p "8400:8400" -p "8500:8500" -p "8600:53/udp" -e "ADVERTISE=$ip_of_local_system" -e "ARGS=-server -bootstrap-expect 1 -node=thegeeklinux-consul-bootstrap" -consul:1.0

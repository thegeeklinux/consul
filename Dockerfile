FROM ubuntu:14.04
RUN apt-get update -qq && \
	apt-get install -yq supervisor curl python-pip language-pack-en wget unzip && \
	apt-get clean && \
	rm -rf /tmp/* /var/tmp/* && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
	pip install envtpl
	

# consul-template installation
RUN wget -P /tmp/ https://releases.hashicorp.com/consul-template/0.7.0/consul-template_0.7.0_linux_amd64.zip \
        && unzip /tmp/consul-template_0.7.0_linux_amd64.zip -d /usr/local/bin/ 

RUN wget -P /tmp/ https://releases.hashicorp.com/consul/0.5.0/consul_0.5.0_linux_amd64.zip \
	&& unzip /tmp/consul_0.5.0_linux_amd64.zip -d  /bin \
	&& chmod +x /bin/consul \
	&& rm /tmp/consul_0.5.0_linux_amd64.zip 

RUN wget -P /tmp/  https://releases.hashicorp.com/consul/0.5.0/consul_0.5.0_web_ui.zip \
	&& mkdir /ui \
	&& unzip /tmp/consul_0.5.0_web_ui.zip -d /ui \
	&& rm /tmp/consul_0.5.0_web_ui.zip \
	&& mv /ui/dist/* /ui/ \
	&& rm -rf /ui/dist 

ADD ./config /config/
ONBUILD ADD ./config /config/
ADD ./supervisor/consul.conf.tpl /etc/supervisor/conf.d/consul.conf.tpl
ONBUILD ADD ./supervisor/consul.conf.tpl /etc/supervisor/conf.d/consul.conf.tpl
ADD ./scripts/ /usr/local/bin/
RUN chmod +x /usr/local/bin/start

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp
VOLUME ["/data"]
CMD ["/usr/local/bin/start"]

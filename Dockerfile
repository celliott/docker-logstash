# php ubuntu dockerfile

# pull base image
FROM dockerfile/ubuntu

RUN apt-get update
RUN apt-get -yq install curl rpm supervisor

RUN curl -O http://download.elasticsearch.org/logstash-forwarder/packages/logstash-forwarder-0.3.1-1.x86_64.rpm
RUN rpm -ivh ~/logstash-forwarder-0.3.1-1.x86_64.rpm
RUN cd /etc/init.d/
RUN curl -o logstash-forwarder http://logstashbook.com/code/4/logstash_forwarder_redhat_init
RUN chmod +x logstash-forwarder

ADD logstash-forwarder /etc/sysconfig/logstash-forwarder
ADD logstash-forwarder.conf /etc/logstash-forwarder.conf
ADD logstash-forwarder.crt /etc/pki/tls/certs/logstash-forwarder.crt
ADD supervisord.conf /etc/supervisor/conf.d/collectd.conf

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh && /bin/bash -l
#CMD /bin/bash -l

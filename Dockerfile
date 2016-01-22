FROM hypriot/rpi-alpine-scratch

RUN echo "http://dl-3.alpinelinux.org/alpine/v3.3/community/" >> /etc/apk/repositories &&\
	apk update && \
	apk add openjdk7-jre bash && \
	mkdir /data /opt /opt/standalone-hdfs-1.0.0

ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre/
	
COPY binaries/standalone-hdfs-1.0.0-namenode-linux.zip /root/ 
COPY binaries/standalone-hdfs-1.0.0-datanode-linux.zip /root/ 
COPY startup.sh /

RUN cd /opt/standalone-hdfs-1.0.0 && \
	unzip /root/standalone-hdfs-1.0.0-namenode-linux.zip && \
	mv standalone-hdfs-1.0.0 namenode && \
	unzip /root/standalone-hdfs-1.0.0-datanode-linux.zip && \
	mv standalone-hdfs-1.0.0 datanode && \
	rm /root/standalone-hdfs-1.0.0-namenode-linux.zip /root/standalone-hdfs-1.0.0-datanode-linux.zip && \
	cd namenode/bin && \
	./hadoop namenode -format && \
	chmod +x /startup.sh && \
	cd /opt/standalone-hdfs-1.0.0/datanode && \
	rm -rf tmp && \
	ln -s /data tmp

EXPOSE 26411 26412 26416

WORKDIR /data

CMD /startup.sh

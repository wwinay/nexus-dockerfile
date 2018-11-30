FROM centos
ENV NEXUS_VERSION=3.14.0-04
RUN yum install -y java wget
RUN wget http://download.sonatype.com/nexus/3/latest-unix.tar.gz -P /opt/
RUN tar -xzf /opt/latest-unix.tar.gz -C /opt
RUN mv /opt/nexus-${NEXUS_VERSION} /opt/nexus
RUN adduser nexus
RUN chown -R nexus:nexus /opt/
RUN echo $'run_as_user="nexus"' >> /opt/nexus/bin/nexus.rc
VOLUME /opt/
USER nexus
EXPOSE 8081
CMD ["/opt/nexus/bin/nexus", "run"]


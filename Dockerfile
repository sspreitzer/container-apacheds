FROM rhel:7.5

RUN yum install -y java-headless && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    curl http://www-eu.apache.org/dist//directory/apacheds/dist/2.0.0-M24/apacheds-2.0.0-M24.tar.gz > /opt/apacheds.tar.gz && \
    tar xvzf /opt/apacheds.tar.gz -C /opt && \
    rm /opt/apacheds.tar.gz && \
    ln -s /opt/apacheds-2.0.0-M24 /opt/apacheds

VOLUME /opt/apacheds/instances/default/log /opt/apacheds/instances/default/run /opt/apacheds/instances/default/cache /opt/apacheds/instances/default/partitions /opt/apacheds/instances/default/conf

WORKDIR /opt/apacheds
CMD ["/opt/apacheds/bin/apacheds.sh", "run"]

FROM centos:7
RUN mkdir -p /opt/rrsahre
COPY ./rrshare /opt/rrshare

VOLUME ["/opt/rrsahre", "/opt/work/store"]
CMD ["/opt/rrshare/rrshareweb", "run"]

EXPOSE 3001
FROM centos:7
COPY ./rrshare /opt/rrshare

VOLUME ["/opt/work/store"]
CMD ["/opt/rrshare/rrshareweb"]

EXPOSE 3001
EXPOSE 6714

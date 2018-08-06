FROM centos:7
USER root
COPY ./rrshare /opt/rrshare

VOLUME ["/opt/work/store"]
CMD ["sh","-c","/opt/rrshare/rrshareweb"]

EXPOSE 3001
EXPOSE 6714
EXPOSE 30210

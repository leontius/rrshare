FROM lsiobase/alpine:3.12
USER root
ENV GLIBC_VERSION=2.31-r0 TZ=Asia/Shanghai

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	wget \
	libstdc++ && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk" && \
 apk add --allow-untrusted glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
 apk del wget

COPY ./rrshare /opt/rrshare

RUN chown -R root:root /opt/rrshare/ && \
    chmod a+x /opt/rrshare/rrshareweb && \
    chmod a+x /opt/rrshare/p4pclient

VOLUME ["/opt/work/store"]
CMD ["sh", "-c", "/opt/rrshare/rrshareweb"]
EXPOSE 3001 6714 30210
VOLUME /mnt /rrshare

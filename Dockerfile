FROM alpine:3.9

ENV GLIBC_VERSION=2.29-r0

RUN \
 echo http://mirrors.ustc.edu.cn/alpine/v3.9/main > /etc/apk/repositories; \
 echo http://mirrors.ustc.edu.cn/alpine/v3.9/community >> /etc/apk/repositories \
 apk add --no-cache \
	wget \
	libstdc++ && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk" && \
 apk add --allow-untrusted glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
 apk del wget

COPY ./rrshare /opt/rrshare

VOLUME ["/opt/work/store"]
CMD ["/opt/rrshare/rrshareweb"]

EXPOSE 3001 6714 30210

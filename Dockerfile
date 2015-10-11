FROM colstrom/alpine:main
RUN apk-install squid

EXPOSE 3128
VOLUME /var/log/squid

ENTRYPOINT ["squid", "-N"]

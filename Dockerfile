FROM colstrom/alpine:main
RUN apk-install squid
ADD squid.sh /usr/local/bin/squid
RUN sed -i 's/^#cache_dir/cache_dir/' /etc/squid/squid.conf \
    && chmod a+x /usr/local/bin/squid

EXPOSE 3128
VOLUME ["/var/log/squid", "/var/cache/squid"]

ENTRYPOINT ["squid"]

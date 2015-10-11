FROM colstrom/alpine:main
RUN apk-install squid

RUN sed -i 's/^#cache_dir/cache_dir/' /etc/squid/squid.conf \
  && squid -z

EXPOSE 3128
VOLUME ["/var/log/squid", "/var/cache/squid"]

ENTRYPOINT ["squid", "-N"]

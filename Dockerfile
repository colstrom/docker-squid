FROM colstrom/alpine:main
RUN apk-install squid

EXPOSE 3128
ENTRYPOINT ["squid", "-N"]

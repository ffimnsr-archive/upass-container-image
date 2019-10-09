FROM alpine:3.9
ARG keyid
WORKDIR /tmp
COPY secret.asc .
COPY entrypoint.sh /
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk update && \
  apk --no-cache add pass git && \
  chmod a+x /entrypoint.sh
RUN gpg --batch --import secret.asc && \
  echo $keyid | gpg --import-ownertrust && \
  rm -f secret.asc
WORKDIR /root
ENTRYPOINT ["/entrypoint.sh"]
CMD ["pass"]

LABEL org.label-schema.vendor="ffimnsr" \
      org.label-schema.url="https://www.passwordstore.org" \
      org.label-schema.name="pass" \
      org.label-schema.description="The standard unix password manager" \
      org.label-schema.version="1.0.0" \
      org.label-schema.docker.schema-version="1.0"

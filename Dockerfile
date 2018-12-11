FROM alpine:3.6

RUN apk add --update --no-cache --virtual=run-deps \
  python3 \
  nginx \
  ca-certificates \
  gettext \
  curl \
  && python3 -m ensurepip --upgrade

ENV LISTEN_PORT 80
ENV PROXY_TARGET_HOST setme
ENV PROXY_TARGET_PORT setme
ENV AWS_HOSTED_ZONE_ID setme
ENV AWS_ROUTE53_HOSTNAME setme

RUN mkdir -p /var/log/nginx && \
    mkdir -p /run/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stdout /var/log/nginx/error.log

RUN pip3 install awscli

COPY nginx.conf /etc/nginx/conf.d/mysite.template

COPY run_bifrost.sh /
RUN chmod +x /run_bifrost.sh

CMD /run_bifrost.sh

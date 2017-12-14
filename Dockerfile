from nginx

ENV AWS_ACCESS_KEY_ID setme
ENV AWS_SECRET_ACCESS_KEY setme
ENV AWS_REGION setme
ENV LISTEN_PORT setme
ENV PROXY_TARGET_HOST setme
ENV PROXY_TARGET_PORT setme
ENV AWS_HOSTED_ZONE_ID setme
ENV AWS_ROUTE53_HOSTNAME setme

RUN apt-get update -y && apt-get install -y python-pip
RUN pip install awscli

RUN mkdir -p /var/log/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stdout /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/conf.d/mysite.template

COPY run_bifrost.sh /
RUN chmod +x /run_bifrost.sh

CMD /run_bifrost.sh

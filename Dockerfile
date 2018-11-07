from alpine:3.6

ENV AWS_REGION default
ENV AWS_HOSTED_ZONE_ID default
ENV AWS_ROUTE53_HOSTNAME default

RUN apk add --update --no-cache --virtual=run-deps \
  python3 \
  ca-certificates
RUN pip install awscli

CMD /run.sh

COPY run.sh /
RUN chmod +x /run.sh

from alpine:3.6

ENV AWS_REGION default
ENV AWS_HOSTED_ZONE_ID default
ENV AWS_ROUTE53_HOSTNAME default

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache
RUN pip install awscli

CMD /run.sh

COPY run.sh /
RUN chmod +x /run.sh

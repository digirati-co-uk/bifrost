# Bifrost

Bifrost is a proxy container that self-registers the underlying AWS EC2 instance with Route53 by a specified name.

## Environment variables

| Environment Variable    | Description                              | Default |
|-------------------------|------------------------------------------|---------|
| AWS\_ACCESS\_KEY_ID     | AWS credential key for Route53 access    |         |
| AWS\_SECRET\_ACCESS_KEY | AWS credential secret for Route53 access |         |
| AWS_REGION              | AWS region                               |         |
| AWS\_HOSTED\_ZONE_ID    | AWS hosted zone ID for Route53           |         |
| AWS\_ROUTE53_HOSTNAME   | Fully qualified domain name to register  |         |
| LISTEN_PORT             | Port for the proxy to listen on          | 80      |
| PROXY\_TARGET_HOST      | Target hostname                          |         |
| PROXY\_TARGET_PORT      | Target port                              |         |

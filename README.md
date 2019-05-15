# docker-saslauthd
Docker-saslauthd is a SASL authentication daemon in a container. You
could use this for example to bridge the gap between a SASL enabled
service, and an LDAP server.

## Installation
### Docker
A prebuilt docker image is available:

```
docker pull zombi/saslauthd
```

## Configuration
The project is configurable by using the following environment variables:

 * `SASLAUTHD_LDAP_SERVER` the hostname of the LDAP server.
 * `SASLAUTHD_LDAP_STARTTLS` if StartTLS should be used.
 * `SASLAUTHD_LDAP_VERIFY` if the StartTLS certificate should be only accepted if valid.
 * `SASLAUTHD_LDAP_VERSION` is the Version of LDAP that should be used.
 * `SASLAUTHD_LDAP_METHOD` the mode, either 'bind' or 'search'.
 * `SASLAUTHD_LDAP_BINDDN` the dn to authenticate as.
 * `SASLAUTHD_LDAP_BINDPW` the password used for dn authentication.
 * `SASLAUTHD_LDAP_BASE` the path under which the user accounts can be found.
 * `SASLAUTHD_LDAP_FILTER` the filter searched for searching user accounts.

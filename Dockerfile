FROM debian:stretch

ENV \
    SASLAUTHD_LDAP_SERVER=ldap \
    SASLAUTHD_LDAP_STARTTLS=no \
    SASLAUTHD_LDAP_VERIFY=no \
    SASLAUTHD_LDAP_VERSION=3 \
    SASLAUTHD_LDAP_METHOD=bind \
    SASLAUTHD_LDAP_BINDDN=cn=admin,dc=example,dc=com \
    SASLAUTHD_LDAP_BINDPW=changeme \
    SASLAUTHD_LDAP_BASE=ou=People,dc=example,dc=com \
    SASLAUTHD_LDAP_FILTER=(uid=%U)

RUN \
    apt-get -q -y update && \
    apt-get install -q -y sasl2-bin && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD bin/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-a", "ldap", "-O", "/etc/saslauthd.conf"]

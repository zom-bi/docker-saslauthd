#!/bin/bash

cat > /etc/saslauthd.conf << EOF
# servers
ldap_servers: ldap://${SASLAUTHD_LDAP_SERVER}
#ldap_start_tls: ${SASLAUTHD_LDAP_STARTTLS}
ldap_tls_ciphers: HIGH
ldap_tls_check_peer: ${SASLAUTHD_LDAP_VERIFY}
ldap_version: ${SASLAUTHD_LDAP_VERSION}

# identity
ldap_auth_method: ${SASLAUTHD_LDAP_METHOD}
ldap_bind_dn: ${SASLAUTHD_LDAP_BINDDN}
ldap_password: ${SASLAUTHD_LDAP_BINDPW}

# Search
ldap_search_base: ${SASLAUTHD_LDAP_BASE}
ldap_filter: ${SASLAUTHD_LDAP_FILTER}
EOF

exec saslauthd -d "$@"

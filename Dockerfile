FROM debian:stretch-slim
MAINTAINER Alice Chen <alchen@apache.org>

ENV LDAP_DEBUG_LEVEL=256

# ADD run script
COPY ./run.sh /run.sh

# ADD bootstrap files
ADD ./bootstrap /bootstrap

# Install slapd and requirements
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get \
        install -y --no-install-recommends \
            slapd \
            ldap-utils \
            openssl \
            ca-certificates \
            vim-tiny \
            procps \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /etc/ldap/ssl

# Initialize LDAP with data
RUN /bin/bash /bootstrap/slapd-init.sh

VOLUME ["/etc/ldap/slapd.d", "/etc/ldap/ssl", "/var/lib/ldap", "/run/slapd"]

EXPOSE 389 636

CMD ["/bin/bash", "/run.sh"]
ENTRYPOINT []

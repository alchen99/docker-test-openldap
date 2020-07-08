# OpenLDAP Docker Image for testing

This fork adds more LDAP groups and more tools to the Docker container

[![DockerHub Badge](http://dockeri.co/image/alchen99/test-openldap)](https://hub.docker.com/r/alchen99/test-openldap/)

This image provides an OpenLDAP Server for testing LDAP applications, i.e. unit tests. The server is initialized with the example domain `planetexpress.com` with data from the [Futurama Wiki][futuramawikia].

Parts of the image are based on the work from Nick Stenning [docker-slapd][slapd] and Bertrand Gouny [docker-openldap][openldap].

The Flask extension [flask-ldapconn][flaskldapconn] use this image for unit tests.

[slapd]: https://github.com/nickstenning/docker-slapd
[openldap]: https://github.com/osixia/docker-openldap
[flaskldapconn]: https://github.com/rroemhild/flask-ldapconn
[futuramawikia]: http://futurama.wikia.com


## Features

* Initialized with data from Futurama
* Support for TLS (snake oil cert on build)
* NIS Style Groups support
* ~124MB images size (~40MB compressed)


## Usage

```
docker pull alchen99/test-openldap
docker run --privileged -d -p 389:389 alchen99/test-openldap
```

## Exposed ports

* 389
* 636

## Exposed volumes

* /etc/ldap/slapd.d
* /etc/ldap/ssl
* /var/lib/ldap
* /run/slapd


## LDAP structure

### dc=planetexpress,dc=com

| Admin            | Secret           |
| ---------------- | ---------------- |
| cn=admin,dc=planetexpress,dc=com | GoodNewsEveryone |

### ou=people,dc=planetexpress,dc=com

#### cn=Hubert J. Farnsworth,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| objectClass      | posixAccount |
| cn               | Hubert J. Farnsworth |
| sn               | Farnsworth |
| description      | Human |
| displayName      | Professor Farnsworth |
| employeeType     | Owner |
| employeeType     | Founder |
| givenName        | Hubert |
| jpegPhoto        | JPEG-Photo (630x507 Pixel, 26780 Bytes) |
| mail             | professor@planetexpress.com |
| mail             | hubert@planetexpress.com |
| title            | Professor |
| uid              | professor |
| userPassword     | professor |
| uidNumber        | 10006 |
| gidNumber        | 100 |
| homeDirectory    | /home/professor |
| loginShell       | /bin/bash |


### cn=Philip J. Fry,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| objectClass      | posixAccount |
| cn               | Philip J. Fry |
| sn               | Fry |
| description      | Human |
| displayName      | Fry |
| employeeType     | Delivery boy |
| givenName        | Philip |
| jpegPhoto        | JPEG-Photo (429x350 Pixel, 22132 Bytes) |
| mail             | fry@planetexpress.com |
| uid              | fry |
| userPassword     | fry |
| uidNumber        | 10003 |
| gidNumber        | 100 |
| homeDirectory    | /home/fry |
| loginShell       | /bin/bash |


### cn=John A. Zoidberg,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| objectClass      | posixAccount |
| cn               | John A. Zoidberg |
| sn               | Zoidberg |
| description      | Decapodian |
| displayName      | Zoidberg |
| employeeType     | Doctor |
| jpegPhoto        | JPEG-Photo (343x280 Pixel, 26438 Bytes) |
| mail             | zoidberg@planetexpress.com |
| title            | Ph. D. |
| uid              | zoidberg |
| userPassword     | zoidberg |
| uidNumber        | 10007 |
| gidNumber        | 100 |
| homeDirectory    | /home/zoidberg |
| loginShell       | /bin/bash |

### cn=Hermes Conrad,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| objectClass      | posixAccount |
| cn               | Hermes Conrad |
| sn               | Conrad |
| description      | Human |
| employeeType     | Bureaucrat |
| employeeType     | Accountant |
| mail             | hermes@planetexpress.com |
| uid              | hermes |
| userPassword     | hermes |
| uidNumber        | 10004 |
| gidNumber        | 100 |
| homeDirectory    | /home/hermes |
| loginShell       | /bin/bash |

### cn=Turanga Leela,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| objectClass      | posixAccount |
| cn               | Turanga Leela |
| sn               | Turanga |
| description      | Mutant |
| employeeType     | Captain |
| employeeType     | Pilot |
| jpegPhoto        | JPEG-Photo (429x350 Pixel, 26526 Bytes) |
| mail             | leela@planetexpress.com |
| uid              | leela |
| userPassword     | leela |
| uidNumber        | 10005 |
| gidNumber        | 100 |
| homeDirectory    | /home/leela |
| loginShell       | /bin/bash |

### cn=Bender Bending Rodríguez,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| objectClass      | posixAccount |
| cn               | Bender Bending Rodríguez |
| sn               | Rodríguez |
| description      | Robot |
| employeeType     | Ship's Robot |
| jpegPhoto        | JPEG-Photo (436x570 Pixel, 26819 Bytes) |
| mail             | bender@planetexpress.com |
| uid              | bender |
| userPassword     | bender |
| uidNumber        | 10002 |
| gidNumber        | 100 |
| homeDirectory    | /home/bender |
| loginShell       | /bin/bash |

### uid=amy,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| objectClass      | posixAccount |
| cn               | Amy Wong |
| sn               | Kroker |
| description      | Human |
| mail             | amy@planetexpress.com |
| uid              | amy |
| userPassword     | amy |
| uidNumber        | 10001 |
| gidNumber        | 100 |
| homeDirectory    | /home/amy |
| loginShell       | /bin/bash |

### cn=admin,ou=groups,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | posixGroup |
| cn               | admin |
| gid              | 10001 |
| memberUid        | professor |
| memberUid        | hermes |

### cn=crew,ou=groups,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | posixGroup |
| cn               | crew |
| gid              | 10002 |
| memberUid        | leela |
| memberUid        | fry |
| memberUid        | bender |

### cn=intern,ou=groups,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | posixGroup |
| cn               | intern |
| gid              | 10003 |
| memberUid        | amy |

### cn=ship,ou=groups,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | posixGroup |
| cn               | ship |
| gid              | 10000 |
| memberUid        | amy |
| memberUid        | bender | 
| memberUid        | fry |
| memberUid        | hermes |
| memberUid        | leela |
| memberUid        | professor |
| memberUid        | zoidberg |

## LDAP Search Tips

* Search for all groups
  ```
  ldapsearch -LLL -h localhost -p 389 \
  -D 'cn=admin,dc=planetexpress,dc=com' \
  -w GoodNewsEveryone \
  -b 'ou=groups,dc=planetexpress,dc=com' dn
  ```

* Search for groups a user is a member of 
  ```
  ldapsearch -LLL -h localhost -p 389 \
  -D 'cn=admin,dc=planetexpress,dc=com' \
  -w GoodNewsEveryone \
  -b 'ou=groups,dc=planetexpress,dc=com' \
  '(&(objectClass=posixGroup)(cn=admin))' dn memberUid
  ```

  Will result in the following:
  ```
  dn: cn=admin,ou=groups,dc=planetexpress,dc=com
  memberUid: professor
  memberUid: hermes
  ```

## JAAS configuration

In case you want to use this OpenLDAP server for testing with a Java-based
application using JAAS and the `LdapLoginModule`, here's a working configuration
file you can use to connect.

```
other {
  com.sun.security.auth.module.LdapLoginModule REQUIRED
    userProvider="ldap://localhost/ou=people,dc=planetexpress,dc=com"
    userFilter="(&(uid={USERNAME})(objectClass=inetOrgPerson))"
    useSSL=false
    java.naming.security.principal="cn=admin,dc=planetexpress,dc=com"
    java.naming.security.credentials="GoodNewsEveryone"
    debug=true
    ;
};
```

This config uses the admin credentials to connect to the OpenLDAP server and to
submit the search query for the user that enters their credentials. As username
the `uid` attribute of each entry is used.

# OpenLDAP Docker Image for testing

This fork adds more LDAP groups and more tools to the Docker container.

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
* memberOf overlay support
* MS-AD Style Groups support
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
| ou               | Office Management |
| title            | Professor |
| uid              | professor |
| userPassword     | professor |


### cn=Philip J. Fry,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Philip J. Fry |
| sn               | Fry |
| description      | Human |
| displayName      | Fry |
| employeeType     | Delivery boy |
| givenName        | Philip |
| jpegPhoto        | JPEG-Photo (429x350 Pixel, 22132 Bytes) |
| mail             | fry@planetexpress.com |
| ou               | Delivering Crew |
| uid              | fry |
| userPassword     | fry |


### cn=John A. Zoidberg,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | John A. Zoidberg |
| sn               | Zoidberg |
| description      | Decapodian |
| displayName      | Zoidberg |
| employeeType     | Doctor |
| givenName        | John |
| jpegPhoto        | JPEG-Photo (343x280 Pixel, 26438 Bytes) |
| mail             | zoidberg@planetexpress.com |
| ou               | Staff |
| title            | Ph. D. |
| uid              | zoidberg |
| userPassword     | zoidberg |

### cn=Hermes Conrad,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Hermes Conrad |
| sn               | Conrad |
| description      | Human |
| employeeType     | Bureaucrat |
| employeeType     | Accountant |
| givenName        | Hermes |
| mail             | hermes@planetexpress.com |
| ou               | Office Management |
| uid              | hermes |
| userPassword     | hermes |

### cn=Turanga Leela,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Turanga Leela |
| sn               | Turanga |
| description      | Mutant |
| employeeType     | Captain |
| employeeType     | Pilot |
| givenName        | Leela |
| jpegPhoto        | JPEG-Photo (429x350 Pixel, 26526 Bytes) |
| mail             | leela@planetexpress.com |
| ou               | Delivering Crew |
| uid              | leela |
| userPassword     | leela |

### cn=Bender Bending Rodríguez,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Bender Bending Rodríguez |
| sn               | Rodríguez |
| description      | Robot |
| employeeType     | Ship's Robot |
| givenName        | Bender |
| jpegPhoto        | JPEG-Photo (436x570 Pixel, 26819 Bytes) |
| mail             | bender@planetexpress.com |
| ou               | Delivering Crew |
| uid              | bender |
| userPassword     | bender |

### cn=Amy Wong+sn=Kroker,ou=people,dc=planetexpress,dc=com

Amy has a multi-valued DN

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Amy Wong |
| sn               | Kroker |
| description      | Human |
| givenName        | Amy |
| mail             | amy@planetexpress.com |
| ou               | Intern |
| uid              | amy |
| userPassword     | amy |

### cn=dir_mgr,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | Group |
| cn               | dir_mgr |
| member           | cn=admin,dc=planetexpress,dc=com |

### cn=admin,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | Group |
| cn               | admin |
| member           | cn=Hubert J. Farnsworth,ou=people,dc=planetexpress,dc=com |
| member           | cn=Hermes Conrad,ou=people,dc=planetexpress,dc=com |

### cn=crew,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | Group |
| cn               | crew |
| member           | cn=Turanga Leela,ou=people,dc=planetexpress,dc=com |
| member           | cn=Philip J. Fry,ou=people,dc=planetexpress,dc=com |
| member           | cn=Bender Bending Rodríguez,ou=people,dc=planetexpress,dc=com |

### cn=intern,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | Group |
| cn               | intern |
| member           | cn=Amy Wong+sn=Kroker,ou=people,dc=planetexpress,dc=com |

### cn=ship,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | Group |
| cn               | ship |
| member           | cn=Hubert J. Farnsworth,ou=people,dc=planetexpress,dc=com |
| member           | cn=Philip J. Fry,ou=people,dc=planetexpress,dc=com |
| member           | cn=John A. Zoidberg,ou=people,dc=planetexpress,dc=com |
| member           | cn=Hermes Conrad,ou=people,dc=planetexpress,dc=com |
| member           | cn=Turanga Leela,ou=people,dc=planetexpress,dc=com |
| member           | cn=Bender Bending Rodríguez,ou=people,dc=planetexpress,dc=com |
| member           | cn=Amy Wong+sn=Kroker,ou=people,dc=planetexpress,dc=com |

## LDAP Search Tips

* Search for all groups
  ```
  ldapsearch -LLL -h localhost -p 389 \
  -D 'cn=admin,dc=planetexpress,dc=com' \
  -w GoodNewsEveryone \
  -b 'ou=people,dc=planetexpress,dc=com' \
  '(&(objectclass=Group))' dn
  ```

* Search for groups a user is a member of 
  ```
  ldapsearch -LLL -h localhost -p 389 \
  -D 'cn=admin,dc=planetexpress,dc=com' \
  -w GoodNewsEveryone \
  -b 'ou=people,dc=planetexpress,dc=com' \
  '(&(description=Human)(sn=Fry)(objectclass=inetorgperson))' dn memberof
  ```

  Will result in the following:
  ```
  dn: cn=Philip J. Fry,ou=people,dc=planetexpress,dc=com
  memberOf: cn=ship_crew,ou=people,dc=planetexpress,dc=com
  memberOf: cn=ship,ou=people,dc=planetexpress,dc=com
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

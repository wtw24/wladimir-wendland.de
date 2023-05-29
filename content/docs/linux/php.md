---
title: "PHP"
date: 2022-02-06
tags: ["linux", "php"]
---

# PHP

## Links:

- https://tecadmin.net/install-php-ubuntu-20-04/
- https://tecadmin.net/enable-disable-php-modules-ubuntu/
- https://tecadmin.net/install-multiple-php-version-apache-ubuntu/


## Uninstall php 7
~~~shell
sudo apt-get purge php7.*
~~~

~~~shell
sudo apt-get autoclean
~~~

~~~shell
sudo apt-get autoremove
~~~


## Add PHP PPA
~~~shell
sudo apt install software-properties-common
~~~

~~~shell
sudo add-apt-repository ppa:ondrej/php
~~~

~~~shell
sudo apt update
~~~


## Install Required PHP Version
~~~shell
sudo apt install -y php8.1
~~~

~~~shell
sudo apt install -y php8.0
~~~

~~~shell
sudo apt install -y php7.4
~~~

~~~shell
sudo apt install -y php7.3
~~~

~~~shell
sudo apt install -y php7.2
~~~

~~~shell
sudo apt install -y php7.1
~~~

~~~shell
sudo apt install -y php7.0
~~~

~~~shell
sudo apt install -y php5.6
~~~


### Stop Apache from Starting on Linux
~~~shell
sudo systemctl status apache2
~~~

~~~shell
sudo systemctl disable apache2 && sudo systemctl stop apache2
~~~


## Check PHP Version
~~~shell
php -v
~~~


## Switch Between PHP Versions
~~~shell
sudo update-alternatives --config php
~~~


## Enable or disable PHP Modules

### Enable PHP Modules
~~~
phpenmod MODULE_NAME
~~~

~~~shell
phpenmod mbstring
~~~

~~~
phpenmod -v <PHP VERSION> <MODULE NAME>
~~~

~~~shell
phpenmod -v 5.6 mbstring
~~~


### Disable PHP Modules
~~~shell
phpdismod mbstring
~~~

~~~shell
phpdismod -v 7.4 mbstring
~~~


### To disable any module for specific SAPI on all PHP versions
~~~shell
phpdismod -s apache2 mbstring
~~~


### Install PHP Modules
~~~shell
sudo apt install php7.1-mbstring php7.1-gd php7.1-curl php7.1-imagick php7.1-imap php7.1-intl php7.1-json php7.1-mcrypt php7.1-mysql php7.1-opcache php7.1-soap php7.1-sqlite3 php7.1-ssh2 php7.1-xml php7.1-xsl php7.1-zip
~~~

~~~shell
sudo apt install php7.4-mysql php7.4-curl php7.4-json php7.4-cgi php7.4-xsl
~~~


### List all packages related to php
~~~shell
sudo apt-cache search php*
~~~

**Output:** 
~~~
...
php - server-side, HTML-embedded scripting language (default)
php-amqp-all-dev - AMQP extension for PHP
php-apcu-all-dev - APC User Cache for PHP
php-apcu-bc-all-dev - APCu Backwards Compatibility Module
php-ast-all-dev - AST extension for PHP 7
php-bcmath - Bcmath module for PHP [default]
php-bz2 - bzip2 module for PHP [default]
php-cgi - server-side, HTML-embedded scripting language (CGI binary) (default)
php-cli - command-line interpreter for the PHP scripting language (default)
php-curl - CURL module for PHP [default]
php-decimal - Arbitrary precision floating-point decimal for PHP
php-decimal-all-dev - Arbitrary precision floating-point decimal for PHP
php-dev - Files for PHP module development (default)
php-ds-all-dev - PHP extension providing efficient data structures for PHP 7
php-enchant - Enchant module for PHP [default]
php-facedetect - Detect faces with PHP
php-facedetect-all-dev - Detect faces with PHP
php-fpm - server-side, HTML-embedded scripting language (FPM-CGI binary) (default)
php-gd - GD module for PHP [default]
php-gearman-all-dev - PHP wrapper to libgearman
php-geoip-all-dev - GeoIP module for PHP
php-gmagick-all-dev - Provides a wrapper to the GraphicsMagick library
php-gmp - GMP module for PHP [default]
php-gnupg-all-dev - PHP wrapper around the gpgme library
php-grpc - High performance, open source, general RPC framework for PHP
php-grpc-all-dev - High performance, open source, general RPC framework for PHP
php-http-all-dev - PECL HTTP module for PHP Extended HTTP Support
php-igbinary-all-dev - igbinary PHP serializer
php-imagick - Provides a wrapper to the ImageMagick library
php-imagick-all-dev - Provides a wrapper to the ImageMagick library
php-imap - IMAP module for PHP [default]
php-inotify - Inotify bindings for PHP
php-inotify-all-dev - Inotify bindings for PHP
php-interbase - Interbase module for PHP [default]
php-intl - Internationalisation module for PHP [default]
php-json - JSON module for PHP [default]
php-ldap - LDAP module for PHP [default]
php-lua-all-dev - PHP Embedded lua interpreter
php-lz4 - LZ4 Extension for PHP
php-lz4-all-dev - LZ4 Extension for PHP
php-mailparse-all-dev - Email message manipulation for PHP
php-maxminddb - Reader for the MaxMind DB file format for PHP
php-maxminddb-all-dev - Reader for the MaxMind DB file format for PHP
php-mbstring - MBSTRING module for PHP [default]
php-mcrypt - PHP bindings for the libmcrypt library
php-mcrypt-all-dev - PHP bindings for the libmcrypt library
php-memcache-all-dev - memcache extension module for PHP
php-memcached-all-dev - memcached extension module for PHP, uses libmemcached
php-mongo - MongoDB database driver
php-mongo-all-dev - MongoDB database driver
php-mongodb-all-dev - MongoDB driver for PHP
php-msgpack-all-dev - PHP extension for interfacing with MessagePack
php-mysql - MySQL module for PHP [default]
php-mysqlnd-ms - MySQL replication and load balancing module for PHP
php-mysqlnd-ms-all-dev - MySQL replication and load balancing module for PHP
php-oauth-all-dev - OAuth 1.0 consumer and provider extension
php-odbc - ODBC module for PHP [default]
php-pcov-all-dev - Code coverage driver
php-pear - PEAR Base System
php-pgsql - PostgreSQL module for PHP [default]
php-phalcon3 - full-stack PHP framework delivered as a C-extension
php-phalcon3-all-dev - full-stack PHP framework delivered as a C-extension
php-phalcon4 - full-stack PHP framework delivered as a C-extension
php-phalcon4-all-dev - full-stack PHP framework delivered as a C-extension
php-phpdbg - server-side, HTML-embedded scripting language (PHPDBG binary) (default)
php-pinba-all-dev - Pinba module for PHP
php-propro-all-dev - propro module for PHP
php-protobuf - Protocol buffers bindings for PHP
php-protobuf-all-dev - Protocol buffers bindings for PHP
php-ps-all-dev - ps module for PHP
php-pspell - pspell module for PHP [default]
php-psr-all-dev - PSR interfaces for PHP
php-radius-all-dev - radius client library for PHP
php-raphf - raphf module for PHP
php-raphf-all-dev - raphf module for PHP
php-readline - readline module for PHP [default]
php-redis-all-dev - PHP extension for interfacing with Redis
php-rrd-all-dev - PHP bindings to rrd tool system
php-smbclient - PHP wrapper for libsmbclient
php-smbclient-all-dev - PHP wrapper for libsmbclient
php-snmp - SNMP module for PHP [default]
php-soap - SOAP module for PHP [default]
php-sodium - PHP wrapper for the Sodium cryptographic library
php-sodium-all-dev - PHP wrapper for the Sodium cryptographic library
php-solr-all-dev - PHP extension for communicating with Apache Solr server
php-sqlite3 - SQLite3 module for PHP [default]
php-ssh2-all-dev - Bindings for the libssh2 library
php-stomp-all-dev - Streaming Text Oriented Messaging Protocol (STOMP) client module for PHP
php-swoole - Swoole Coroutine Fiber Async Programming Framework for PHP
php-swoole-all-dev - Swoole Coroutine Fiber Async Programming Framework for PHP
php-sybase - Sybase module for PHP [default]
php-tideways-all-dev - Tideways PHP Profiler Extension
php-tidy - tidy module for PHP [default]
php-uopz - UOPZ extension for PHP 7
php-uopz-all-dev - UOPZ extension for PHP 7
php-uploadprogress-all-dev - file upload progress tracking extension for PHP
php-uuid-all-dev - PHP UUID extension
php-vips - PHP extension for interfacing with libvips
php-vips-all-dev - PHP extension for interfacing with libvips
php-xcache - fast, stable PHP opcode cacher
php-xcache-all-dev - fast, stable PHP opcode cacher
php-xdebug - Xdebug Module for PHP
php-xdebug-all-dev - Xdebug Module for PHP
php-xhprof - Hierarchical Profiler for PHP 5.x
php-xhprof-all-dev - Hierarchical Profiler for PHP 5.x
php-xml - DOM, SimpleXML, WDDX, XML, and XSL module for PHP [default]
php-xmlrpc - XML-RPC servers and clients functions for PHP
php-xmlrpc-all-dev - XML-RPC servers and clients functions for PHP
php-yac-all-dev - YAC (Yet Another Cache) for PHP
php-yaml-all-dev - YAML-1.1 parser and emitter for PHP
php-zip - Zip module for PHP [default]
php-zmq-all-dev - ZeroMQ messaging bindings for PHP
php-zstd - Zstandard extension for PHP
php-zstd-all-dev - Zstandard extension for PHP
php5.6 - server-side, HTML-embedded scripting language (metapackage)
php5.6-amqp - AMQP extension for PHP
php5.6-apcu - APC User Cache for PHP
php5.6-bcmath - Bcmath module for PHP
php5.6-bz2 - bzip2 module for PHP
php5.6-cgi - server-side, HTML-embedded scripting language (CGI binary)
php5.6-cli - command-line interpreter for the PHP scripting language
php5.6-common - documentation, examples and common module for PHP
php5.6-curl - CURL module for PHP
php5.6-dba - DBA module for PHP
php5.6-dev - Files for PHP5.6 module development
php5.6-enchant - Enchant module for PHP
php5.6-fpm - server-side, HTML-embedded scripting language (FPM-CGI binary)
php5.6-gd - GD module for PHP
php5.6-gearman - PHP wrapper to libgearman
php5.6-geoip - GeoIP module for PHP
php5.6-gmagick - Provides a wrapper to the GraphicsMagick library
php5.6-gmp - GMP module for PHP
php5.6-gnupg - PHP wrapper around the gpgme library
php5.6-grpc - High performance, open source, general RPC framework for PHP
php5.6-http - PECL HTTP module for PHP Extended HTTP Support
php5.6-igbinary - igbinary PHP serializer
php5.6-imagick - Provides a wrapper to the ImageMagick library
php5.6-imap - IMAP module for PHP
php5.6-inotify - Inotify bindings for PHP
php5.6-interbase - Interbase module for PHP
php5.6-intl - Internationalisation module for PHP
php5.6-json - JSON module for PHP
php5.6-ldap - LDAP module for PHP
php5.6-lua - PHP Embedded lua interpreter
php5.6-lz4 - LZ4 Extension for PHP
php5.6-mailparse - Email message manipulation for PHP
php5.6-mbstring - MBSTRING module for PHP
php5.6-mcrypt - libmcrypt module for PHP
php5.6-memcache - memcache extension module for PHP
php5.6-memcached - memcached extension module for PHP, uses libmemcached
php5.6-mongo - MongoDB database driver
php5.6-mongodb - MongoDB driver for PHP
php5.6-msgpack - PHP extension for interfacing with MessagePack
php5.6-mysql - MySQL module for PHP
php5.6-mysqlnd-ms - MySQL replication and load balancing module for PHP
php5.6-oauth - OAuth 1.0 consumer and provider extension
php5.6-odbc - ODBC module for PHP
php5.6-opcache - Zend OpCache module for PHP
php5.6-pgsql - PostgreSQL module for PHP
php5.6-phalcon3 - full-stack PHP framework delivered as a C-extension
php5.6-phpdbg - server-side, HTML-embedded scripting language (PHPDBG binary)
php5.6-propro - propro module for PHP
php5.6-protobuf - Protocol buffers bindings for PHP
php5.6-ps - ps module for PHP
php5.6-pspell - pspell module for PHP
php5.6-radius - radius client library for PHP
php5.6-raphf - raphf module for PHP
php5.6-readline - readline module for PHP
php5.6-recode - recode module for PHP
php5.6-redis - PHP extension for interfacing with Redis
php5.6-rrd - PHP bindings to rrd tool system
php5.6-smbclient - PHP wrapper for libsmbclient
php5.6-snmp - SNMP module for PHP
php5.6-soap - SOAP module for PHP
php5.6-solr - PHP extension for communicating with Apache Solr server
php5.6-sqlite3 - SQLite3 module for PHP
php5.6-ssh2 - Bindings for the libssh2 library
php5.6-stomp - Streaming Text Oriented Messaging Protocol (STOMP) client module for PHP
php5.6-sybase - Sybase module for PHP
php5.6-tidy - tidy module for PHP
php5.6-uploadprogress - file upload progress tracking extension for PHP
php5.6-xcache - fast, stable PHP opcode cacher
php5.6-xdebug - Xdebug Module for PHP
php5.6-xhprof - Hierarchical Profiler for PHP 5.x
php5.6-xml - DOM, SimpleXML, WDDX, XML, and XSL module for PHP
php5.6-xmlrpc - XMLRPC-EPI module for PHP
php5.6-xsl - XSL module for PHP (dummy)
php5.6-yac - YAC (Yet Another Cache) for PHP
php5.6-yaml - YAML-1.1 parser and emitter for PHP
php5.6-zip - Zip module for PHP
php5.6-zmq - ZeroMQ messaging bindings for PHP
php5.6-zstd - Zstandard extension for PHP
php7.0 - server-side, HTML-embedded scripting language (metapackage)
php7.0-amqp - AMQP extension for PHP
php7.0-apcu - APC User Cache for PHP
php7.0-apcu-bc - APCu Backwards Compatibility Module
php7.0-ast - AST extension for PHP 7
php7.0-bcmath - Bcmath module for PHP
php7.0-bz2 - bzip2 module for PHP
php7.0-cgi - server-side, HTML-embedded scripting language (CGI binary)
php7.0-cli - command-line interpreter for the PHP scripting language
php7.0-common - documentation, examples and common module for PHP
php7.0-curl - CURL module for PHP
php7.0-dba - DBA module for PHP
php7.0-decimal - Arbitrary precision floating-point decimal for PHP
php7.0-dev - Files for PHP7.0 module development
php7.0-ds - PHP extension providing efficient data structures for PHP 7
php7.0-enchant - Enchant module for PHP
php7.0-facedetect - Detect faces with PHP
php7.0-fpm - server-side, HTML-embedded scripting language (FPM-CGI binary)
php7.0-gd - GD module for PHP
php7.0-gearman - PHP wrapper to libgearman
php7.0-geoip - GeoIP module for PHP
php7.0-gmagick - Provides a wrapper to the GraphicsMagick library
php7.0-gmp - GMP module for PHP
php7.0-gnupg - PHP wrapper around the gpgme library
php7.0-grpc - High performance, open source, general RPC framework for PHP
php7.0-http - PECL HTTP module for PHP Extended HTTP Support
php7.0-igbinary - igbinary PHP serializer
php7.0-imagick - Provides a wrapper to the ImageMagick library
php7.0-imap - IMAP module for PHP
php7.0-inotify - Inotify bindings for PHP
php7.0-interbase - Interbase module for PHP
php7.0-intl - Internationalisation module for PHP
php7.0-json - JSON module for PHP
php7.0-ldap - LDAP module for PHP
php7.0-lua - PHP Embedded lua interpreter
php7.0-lz4 - LZ4 Extension for PHP
php7.0-mailparse - Email message manipulation for PHP
php7.0-mbstring - MBSTRING module for PHP
php7.0-mcrypt - libmcrypt module for PHP
php7.0-memcache - memcache extension module for PHP
php7.0-memcached - memcached extension module for PHP, uses libmemcached
php7.0-mongodb - MongoDB driver for PHP
php7.0-msgpack - PHP extension for interfacing with MessagePack
php7.0-mysql - MySQL module for PHP
php7.0-oauth - OAuth 1.0 consumer and provider extension
php7.0-odbc - ODBC module for PHP
php7.0-opcache - Zend OpCache module for PHP
php7.0-pgsql - PostgreSQL module for PHP
php7.0-phalcon3 - full-stack PHP framework delivered as a C-extension
php7.0-phpdbg - server-side, HTML-embedded scripting language (PHPDBG binary)
php7.0-pinba - Pinba module for PHP
php7.0-propro - propro module for PHP
php7.0-protobuf - Protocol buffers bindings for PHP
php7.0-ps - ps module for PHP
php7.0-pspell - pspell module for PHP
php7.0-psr - PSR interfaces for PHP
php7.0-radius - radius client library for PHP
php7.0-raphf - raphf module for PHP
php7.0-readline - readline module for PHP
php7.0-recode - recode module for PHP
php7.0-redis - PHP extension for interfacing with Redis
php7.0-rrd - PHP bindings to rrd tool system
php7.0-smbclient - PHP wrapper for libsmbclient
php7.0-snmp - SNMP module for PHP
php7.0-soap - SOAP module for PHP
php7.0-sodium - PHP wrapper for the Sodium cryptographic library
php7.0-solr - PHP extension for communicating with Apache Solr server
php7.0-sqlite3 - SQLite3 module for PHP
php7.0-ssh2 - Bindings for the libssh2 library
php7.0-stomp - Streaming Text Oriented Messaging Protocol (STOMP) client module for PHP
php7.0-sybase - Sybase module for PHP
php7.0-tideways - Tideways PHP Profiler Extension
php7.0-tidy - tidy module for PHP
php7.0-uploadprogress - file upload progress tracking extension for PHP
php7.0-uuid - PHP UUID extension
php7.0-vips - PHP extension for interfacing with libvips
php7.0-xdebug - Xdebug Module for PHP
php7.0-xhprof - Hierarchical Profiler for PHP 5.x
php7.0-xml - DOM, SimpleXML, WDDX, XML, and XSL module for PHP
php7.0-xmlrpc - XMLRPC-EPI module for PHP
php7.0-xsl - XSL module for PHP (dummy)
php7.0-yac - YAC (Yet Another Cache) for PHP
php7.0-yaml - YAML-1.1 parser and emitter for PHP
php7.0-zip - Zip module for PHP
php7.0-zmq - ZeroMQ messaging bindings for PHP
php7.0-zstd - Zstandard extension for PHP
php7.1 - server-side, HTML-embedded scripting language (metapackage)
php7.1-amqp - AMQP extension for PHP
php7.1-apcu - APC User Cache for PHP
php7.1-apcu-bc - APCu Backwards Compatibility Module
php7.1-ast - AST extension for PHP 7
php7.1-bcmath - Bcmath module for PHP
php7.1-bz2 - bzip2 module for PHP
php7.1-cgi - server-side, HTML-embedded scripting language (CGI binary)
php7.1-cli - command-line interpreter for the PHP scripting language
php7.1-common - documentation, examples and common module for PHP
php7.1-curl - CURL module for PHP
php7.1-dba - DBA module for PHP
php7.1-decimal - Arbitrary precision floating-point decimal for PHP
php7.1-dev - Files for PHP7.1 module development
php7.1-ds - PHP extension providing efficient data structures for PHP 7
php7.1-enchant - Enchant module for PHP
php7.1-facedetect - Detect faces with PHP
php7.1-fpm - server-side, HTML-embedded scripting language (FPM-CGI binary)
php7.1-gd - GD module for PHP
php7.1-gearman - PHP wrapper to libgearman
php7.1-geoip - GeoIP module for PHP
php7.1-gmagick - Provides a wrapper to the GraphicsMagick library
php7.1-gmp - GMP module for PHP
php7.1-gnupg - PHP wrapper around the gpgme library
php7.1-grpc - High performance, open source, general RPC framework for PHP
php7.1-http - PECL HTTP module for PHP Extended HTTP Support
php7.1-igbinary - igbinary PHP serializer
php7.1-imagick - Provides a wrapper to the ImageMagick library
php7.1-imap - IMAP module for PHP
php7.1-inotify - Inotify bindings for PHP
php7.1-interbase - Interbase module for PHP
php7.1-intl - Internationalisation module for PHP
php7.1-json - JSON module for PHP
php7.1-ldap - LDAP module for PHP
php7.1-lua - PHP Embedded lua interpreter
php7.1-lz4 - LZ4 Extension for PHP
php7.1-mailparse - Email message manipulation for PHP
php7.1-mbstring - MBSTRING module for PHP
php7.1-mcrypt - libmcrypt module for PHP
php7.1-memcache - memcache extension module for PHP
php7.1-memcached - memcached extension module for PHP, uses libmemcached
php7.1-mongodb - MongoDB driver for PHP
php7.1-msgpack - PHP extension for interfacing with MessagePack
php7.1-mysql - MySQL module for PHP
php7.1-oauth - OAuth 1.0 consumer and provider extension
php7.1-odbc - ODBC module for PHP
php7.1-opcache - Zend OpCache module for PHP
php7.1-pcov - Code coverage driver
php7.1-pgsql - PostgreSQL module for PHP
php7.1-phalcon3 - full-stack PHP framework delivered as a C-extension
php7.1-phpdbg - server-side, HTML-embedded scripting language (PHPDBG binary)
php7.1-pinba - Pinba module for PHP
php7.1-propro - propro module for PHP
php7.1-protobuf - Protocol buffers bindings for PHP
php7.1-ps - ps module for PHP
php7.1-pspell - pspell module for PHP
php7.1-psr - PSR interfaces for PHP
php7.1-radius - radius client library for PHP
php7.1-raphf - raphf module for PHP
php7.1-readline - readline module for PHP
php7.1-recode - recode module for PHP
php7.1-redis - PHP extension for interfacing with Redis
php7.1-rrd - PHP bindings to rrd tool system
php7.1-smbclient - PHP wrapper for libsmbclient
php7.1-snmp - SNMP module for PHP
php7.1-soap - SOAP module for PHP
php7.1-sodium - PHP wrapper for the Sodium cryptographic library
php7.1-solr - PHP extension for communicating with Apache Solr server
php7.1-sqlite3 - SQLite3 module for PHP
php7.1-ssh2 - Bindings for the libssh2 library
php7.1-stomp - Streaming Text Oriented Messaging Protocol (STOMP) client module for PHP
php7.1-sybase - Sybase module for PHP
php7.1-tideways - Tideways PHP Profiler Extension
php7.1-tidy - tidy module for PHP
php7.1-uopz - UOPZ extension for PHP 7
php7.1-uploadprogress - file upload progress tracking extension for PHP
php7.1-uuid - PHP UUID extension
php7.1-vips - PHP extension for interfacing with libvips
php7.1-xdebug - Xdebug Module for PHP
php7.1-xhprof - Hierarchical Profiler for PHP 5.x
php7.1-xml - DOM, SimpleXML, WDDX, XML, and XSL module for PHP
php7.1-xmlrpc - XMLRPC-EPI module for PHP
php7.1-xsl - XSL module for PHP (dummy)
php7.1-yac - YAC (Yet Another Cache) for PHP
php7.1-yaml - YAML-1.1 parser and emitter for PHP
php7.1-zip - Zip module for PHP
php7.1-zmq - ZeroMQ messaging bindings for PHP
php7.1-zstd - Zstandard extension for PHP
php7.2 - server-side, HTML-embedded scripting language (metapackage)
php7.2-amqp - AMQP extension for PHP
php7.2-apcu - APC User Cache for PHP
php7.2-apcu-bc - APCu Backwards Compatibility Module
php7.2-ast - AST extension for PHP 7
php7.2-bcmath - Bcmath module for PHP
php7.2-bz2 - bzip2 module for PHP
php7.2-cgi - server-side, HTML-embedded scripting language (CGI binary)
php7.2-cli - command-line interpreter for the PHP scripting language
php7.2-common - documentation, examples and common module for PHP
php7.2-curl - CURL module for PHP
php7.2-dba - DBA module for PHP
php7.2-decimal - Arbitrary precision floating-point decimal for PHP
php7.2-dev - Files for PHP7.2 module development
php7.2-ds - PHP extension providing efficient data structures for PHP 7
php7.2-enchant - Enchant module for PHP
php7.2-facedetect - Detect faces with PHP
php7.2-fpm - server-side, HTML-embedded scripting language (FPM-CGI binary)
php7.2-gd - GD module for PHP
php7.2-gearman - PHP wrapper to libgearman
php7.2-geoip - GeoIP module for PHP
php7.2-gmagick - Provides a wrapper to the GraphicsMagick library
php7.2-gmp - GMP module for PHP
php7.2-gnupg - PHP wrapper around the gpgme library
php7.2-grpc - High performance, open source, general RPC framework for PHP
php7.2-http - PECL HTTP module for PHP Extended HTTP Support
php7.2-igbinary - igbinary PHP serializer
php7.2-imagick - Provides a wrapper to the ImageMagick library
php7.2-imap - IMAP module for PHP
php7.2-inotify - Inotify bindings for PHP
php7.2-interbase - Interbase module for PHP
php7.2-intl - Internationalisation module for PHP
php7.2-json - JSON module for PHP
php7.2-ldap - LDAP module for PHP
php7.2-lua - PHP Embedded lua interpreter
php7.2-lz4 - LZ4 Extension for PHP
php7.2-mailparse - Email message manipulation for PHP
php7.2-maxminddb - Reader for the MaxMind DB file format for PHP
php7.2-mbstring - MBSTRING module for PHP
php7.2-mcrypt - PHP bindings for the libmcrypt library
php7.2-memcache - memcache extension module for PHP
php7.2-memcached - memcached extension module for PHP, uses libmemcached
php7.2-mongodb - MongoDB driver for PHP
php7.2-msgpack - PHP extension for interfacing with MessagePack
php7.2-mysql - MySQL module for PHP
php7.2-oauth - OAuth 1.0 consumer and provider extension
php7.2-odbc - ODBC module for PHP
php7.2-opcache - Zend OpCache module for PHP
php7.2-pcov - Code coverage driver
php7.2-pgsql - PostgreSQL module for PHP
php7.2-phalcon3 - full-stack PHP framework delivered as a C-extension
php7.2-phalcon4 - full-stack PHP framework delivered as a C-extension
php7.2-phpdbg - server-side, HTML-embedded scripting language (PHPDBG binary)
php7.2-pinba - Pinba module for PHP
php7.2-propro - propro module for PHP
php7.2-protobuf - Protocol buffers bindings for PHP
php7.2-ps - ps module for PHP
php7.2-pspell - pspell module for PHP
php7.2-psr - PSR interfaces for PHP
php7.2-radius - radius client library for PHP
php7.2-raphf - raphf module for PHP
php7.2-readline - readline module for PHP
php7.2-recode - recode module for PHP
php7.2-redis - PHP extension for interfacing with Redis
php7.2-rrd - PHP bindings to rrd tool system
php7.2-smbclient - PHP wrapper for libsmbclient
php7.2-snmp - SNMP module for PHP
php7.2-soap - SOAP module for PHP
php7.2-solr - PHP extension for communicating with Apache Solr server
php7.2-sqlite3 - SQLite3 module for PHP
php7.2-ssh2 - Bindings for the libssh2 library
php7.2-stomp - Streaming Text Oriented Messaging Protocol (STOMP) client module for PHP
php7.2-swoole - Swoole Coroutine Fiber Async Programming Framework for PHP
php7.2-sybase - Sybase module for PHP
php7.2-tideways - Tideways PHP Profiler Extension
php7.2-tidy - tidy module for PHP
php7.2-uopz - UOPZ extension for PHP 7
php7.2-uploadprogress - file upload progress tracking extension for PHP
php7.2-uuid - PHP UUID extension
php7.2-vips - PHP extension for interfacing with libvips
php7.2-xdebug - Xdebug Module for PHP
php7.2-xhprof - Hierarchical Profiler for PHP 5.x
php7.2-xml - DOM, SimpleXML, WDDX, XML, and XSL module for PHP
php7.2-xmlrpc - XMLRPC-EPI module for PHP
php7.2-xsl - XSL module for PHP (dummy)
php7.2-yac - YAC (Yet Another Cache) for PHP
php7.2-yaml - YAML-1.1 parser and emitter for PHP
php7.2-zip - Zip module for PHP
php7.2-zmq - ZeroMQ messaging bindings for PHP
php7.2-zstd - Zstandard extension for PHP
php7.3 - server-side, HTML-embedded scripting language (metapackage)
php7.3-amqp - AMQP extension for PHP
php7.3-apcu - APC User Cache for PHP
php7.3-apcu-bc - APCu Backwards Compatibility Module
php7.3-ast - AST extension for PHP 7
php7.3-bcmath - Bcmath module for PHP
php7.3-bz2 - bzip2 module for PHP
php7.3-cgi - server-side, HTML-embedded scripting language (CGI binary)
php7.3-cli - command-line interpreter for the PHP scripting language
php7.3-common - documentation, examples and common module for PHP
php7.3-curl - CURL module for PHP
php7.3-dba - DBA module for PHP
php7.3-decimal - Arbitrary precision floating-point decimal for PHP
php7.3-dev - Files for PHP7.3 module development
php7.3-ds - PHP extension providing efficient data structures for PHP 7
php7.3-enchant - Enchant module for PHP
php7.3-facedetect - Detect faces with PHP
php7.3-fpm - server-side, HTML-embedded scripting language (FPM-CGI binary)
php7.3-gd - GD module for PHP
php7.3-gearman - PHP wrapper to libgearman
php7.3-geoip - GeoIP module for PHP
php7.3-gmagick - Provides a wrapper to the GraphicsMagick library
php7.3-gmp - GMP module for PHP
php7.3-gnupg - PHP wrapper around the gpgme library
php7.3-grpc - High performance, open source, general RPC framework for PHP
php7.3-http - PECL HTTP module for PHP Extended HTTP Support
php7.3-igbinary - igbinary PHP serializer
php7.3-imagick - Provides a wrapper to the ImageMagick library
php7.3-imap - IMAP module for PHP
php7.3-inotify - Inotify bindings for PHP
php7.3-interbase - Interbase module for PHP
php7.3-intl - Internationalisation module for PHP
php7.3-json - JSON module for PHP
php7.3-ldap - LDAP module for PHP
php7.3-lua - PHP Embedded lua interpreter
php7.3-lz4 - LZ4 Extension for PHP
php7.3-mailparse - Email message manipulation for PHP
php7.3-maxminddb - Reader for the MaxMind DB file format for PHP
php7.3-mbstring - MBSTRING module for PHP
php7.3-mcrypt - PHP bindings for the libmcrypt library
php7.3-memcache - memcache extension module for PHP
php7.3-memcached - memcached extension module for PHP, uses libmemcached
php7.3-mongodb - MongoDB driver for PHP
php7.3-msgpack - PHP extension for interfacing with MessagePack
php7.3-mysql - MySQL module for PHP
php7.3-oauth - OAuth 1.0 consumer and provider extension
php7.3-odbc - ODBC module for PHP
php7.3-opcache - Zend OpCache module for PHP
php7.3-pcov - Code coverage driver
php7.3-pgsql - PostgreSQL module for PHP
php7.3-phalcon3 - full-stack PHP framework delivered as a C-extension
php7.3-phalcon4 - full-stack PHP framework delivered as a C-extension
php7.3-phpdbg - server-side, HTML-embedded scripting language (PHPDBG binary)
php7.3-pinba - Pinba module for PHP
php7.3-propro - propro module for PHP
php7.3-protobuf - Protocol buffers bindings for PHP
php7.3-ps - ps module for PHP
php7.3-pspell - pspell module for PHP
php7.3-psr - PSR interfaces for PHP
php7.3-radius - radius client library for PHP
php7.3-raphf - raphf module for PHP
php7.3-readline - readline module for PHP
php7.3-recode - recode module for PHP
php7.3-redis - PHP extension for interfacing with Redis
php7.3-rrd - PHP bindings to rrd tool system
php7.3-smbclient - PHP wrapper for libsmbclient
php7.3-snmp - SNMP module for PHP
php7.3-soap - SOAP module for PHP
php7.3-solr - PHP extension for communicating with Apache Solr server
php7.3-sqlite3 - SQLite3 module for PHP
php7.3-ssh2 - Bindings for the libssh2 library
php7.3-stomp - Streaming Text Oriented Messaging Protocol (STOMP) client module for PHP
php7.3-swoole - Swoole Coroutine Fiber Async Programming Framework for PHP
php7.3-sybase - Sybase module for PHP
php7.3-tideways - Tideways PHP Profiler Extension
php7.3-tidy - tidy module for PHP
php7.3-uopz - UOPZ extension for PHP 7
php7.3-uploadprogress - file upload progress tracking extension for PHP
php7.3-uuid - PHP UUID extension
php7.3-vips - PHP extension for interfacing with libvips
php7.3-xdebug - Xdebug Module for PHP
php7.3-xhprof - Hierarchical Profiler for PHP 5.x
php7.3-xml - DOM, SimpleXML, WDDX, XML, and XSL module for PHP
php7.3-xmlrpc - XMLRPC-EPI module for PHP
php7.3-xsl - XSL module for PHP (dummy)
php7.3-yac - YAC (Yet Another Cache) for PHP
php7.3-yaml - YAML-1.1 parser and emitter for PHP
php7.3-zip - Zip module for PHP
php7.3-zmq - ZeroMQ messaging bindings for PHP
php7.3-zstd - Zstandard extension for PHP
php7.4-amqp - AMQP extension for PHP
php7.4-apcu - APC User Cache for PHP
php7.4-apcu-bc - APCu Backwards Compatibility Module
php7.4-ast - AST extension for PHP 7
php7.4-decimal - Arbitrary precision floating-point decimal for PHP
php7.4-ds - PHP extension providing efficient data structures for PHP 7
php7.4-facedetect - Detect faces with PHP
php7.4-gearman - PHP wrapper to libgearman
php7.4-geoip - GeoIP module for PHP
php7.4-gmagick - Provides a wrapper to the GraphicsMagick library
php7.4-gnupg - PHP wrapper around the gpgme library
php7.4-grpc - High performance, open source, general RPC framework for PHP
php7.4-http - PECL HTTP module for PHP Extended HTTP Support
php7.4-igbinary - igbinary PHP serializer
php7.4-imagick - Provides a wrapper to the ImageMagick library
php7.4-inotify - Inotify bindings for PHP
php7.4-lua - PHP Embedded lua interpreter
php7.4-lz4 - LZ4 Extension for PHP
php7.4-mailparse - Email message manipulation for PHP
php7.4-maxminddb - Reader for the MaxMind DB file format for PHP
php7.4-mcrypt - PHP bindings for the libmcrypt library
php7.4-memcache - memcache extension module for PHP
php7.4-memcached - memcached extension module for PHP, uses libmemcached
php7.4-mongodb - MongoDB driver for PHP
php7.4-msgpack - PHP extension for interfacing with MessagePack
php7.4-oauth - OAuth 1.0 consumer and provider extension
php7.4-pcov - Code coverage driver
php7.4-phalcon4 - full-stack PHP framework delivered as a C-extension
php7.4-pinba - Pinba module for PHP
php7.4-propro - propro module for PHP
php7.4-protobuf - Protocol buffers bindings for PHP
php7.4-ps - ps module for PHP
php7.4-psr - PSR interfaces for PHP
php7.4-radius - radius client library for PHP
php7.4-raphf - raphf module for PHP
php7.4-redis - PHP extension for interfacing with Redis
php7.4-rrd - PHP bindings to rrd tool system
php7.4-smbclient - PHP wrapper for libsmbclient
php7.4-solr - PHP extension for communicating with Apache Solr server
php7.4-ssh2 - Bindings for the libssh2 library
php7.4-stomp - Streaming Text Oriented Messaging Protocol (STOMP) client module for PHP
php7.4-swoole - Swoole Coroutine Fiber Async Programming Framework for PHP
php7.4-tideways - Tideways PHP Profiler Extension
php7.4-uopz - UOPZ extension for PHP 7
php7.4-uploadprogress - file upload progress tracking extension for PHP
php7.4-uuid - PHP UUID extension
php7.4-vips - PHP extension for interfacing with libvips
php7.4-xdebug - Xdebug Module for PHP
php7.4-xhprof - Hierarchical Profiler for PHP 5.x
php7.4-yac - YAC (Yet Another Cache) for PHP
php7.4-yaml - YAML-1.1 parser and emitter for PHP
php7.4-zmq - ZeroMQ messaging bindings for PHP
php7.4-zstd - Zstandard extension for PHP
php8.0 - server-side, HTML-embedded scripting language (metapackage)
php8.0-amqp - AMQP extension for PHP
php8.0-apcu - APC User Cache for PHP
php8.0-ast - AST extension for PHP 7
php8.0-bcmath - Bcmath module for PHP
php8.0-bz2 - bzip2 module for PHP
php8.0-cgi - server-side, HTML-embedded scripting language (CGI binary)
php8.0-cli - command-line interpreter for the PHP scripting language
php8.0-common - documentation, examples and common module for PHP
php8.0-curl - CURL module for PHP
php8.0-dba - DBA module for PHP
php8.0-decimal - Arbitrary precision floating-point decimal for PHP
php8.0-dev - Files for PHP8.0 module development
php8.0-ds - PHP extension providing efficient data structures for PHP 7
php8.0-enchant - Enchant module for PHP
php8.0-fpm - server-side, HTML-embedded scripting language (FPM-CGI binary)
php8.0-gd - GD module for PHP
php8.0-gearman - PHP wrapper to libgearman
php8.0-gmagick - Provides a wrapper to the GraphicsMagick library
php8.0-gmp - GMP module for PHP
php8.0-gnupg - PHP wrapper around the gpgme library
php8.0-grpc - High performance, open source, general RPC framework for PHP
php8.0-http - PECL HTTP module for PHP Extended HTTP Support
php8.0-igbinary - igbinary PHP serializer
php8.0-imagick - Provides a wrapper to the ImageMagick library
php8.0-imap - IMAP module for PHP
php8.0-inotify - Inotify bindings for PHP
php8.0-interbase - Interbase module for PHP
php8.0-intl - Internationalisation module for PHP
php8.0-ldap - LDAP module for PHP
php8.0-lz4 - LZ4 Extension for PHP
php8.0-mailparse - Email message manipulation for PHP
php8.0-maxminddb - Reader for the MaxMind DB file format for PHP
php8.0-mbstring - MBSTRING module for PHP
php8.0-mcrypt - PHP bindings for the libmcrypt library
php8.0-memcache - memcache extension module for PHP
php8.0-memcached - memcached extension module for PHP, uses libmemcached
php8.0-mongodb - MongoDB driver for PHP
php8.0-msgpack - PHP extension for interfacing with MessagePack
php8.0-mysql - MySQL module for PHP
php8.0-oauth - OAuth 1.0 consumer and provider extension
php8.0-odbc - ODBC module for PHP
php8.0-opcache - Zend OpCache module for PHP
php8.0-pcov - Code coverage driver
php8.0-pgsql - PostgreSQL module for PHP
php8.0-phpdbg - server-side, HTML-embedded scripting language (PHPDBG binary)
php8.0-protobuf - Protocol buffers bindings for PHP
php8.0-ps - ps module for PHP
php8.0-pspell - pspell module for PHP
php8.0-psr - PSR interfaces for PHP
php8.0-raphf - raphf module for PHP
php8.0-readline - readline module for PHP
php8.0-redis - PHP extension for interfacing with Redis
php8.0-rrd - PHP bindings to rrd tool system
php8.0-smbclient - PHP wrapper for libsmbclient
php8.0-snmp - SNMP module for PHP
php8.0-soap - SOAP module for PHP
php8.0-solr - PHP extension for communicating with Apache Solr server
php8.0-sqlite3 - SQLite3 module for PHP
php8.0-ssh2 - Bindings for the libssh2 library
php8.0-swoole - Swoole Coroutine Fiber Async Programming Framework for PHP
php8.0-sybase - Sybase module for PHP
php8.0-tidy - tidy module for PHP
php8.0-uopz - UOPZ extension for PHP 7
php8.0-uploadprogress - file upload progress tracking extension for PHP
php8.0-uuid - PHP UUID extension
php8.0-vips - PHP extension for interfacing with libvips
php8.0-xdebug - Xdebug Module for PHP
php8.0-xhprof - Hierarchical Profiler for PHP 5.x
php8.0-xml - DOM, SimpleXML, XML, and XSL module for PHP
php8.0-xmlrpc - XML-RPC servers and clients functions for PHP
php8.0-xsl - XSL module for PHP (dummy)
php8.0-yac - YAC (Yet Another Cache) for PHP
php8.0-yaml - YAML-1.1 parser and emitter for PHP
php8.0-zip - Zip module for PHP
php8.0-zmq - ZeroMQ messaging bindings for PHP
php8.0-zstd - Zstandard extension for PHP
php8.1 - server-side, HTML-embedded scripting language (metapackage)
php8.1-amqp - AMQP extension for PHP
php8.1-apcu - APC User Cache for PHP
php8.1-ast - AST extension for PHP 7
php8.1-bcmath - Bcmath module for PHP
php8.1-bz2 - bzip2 module for PHP
php8.1-cgi - server-side, HTML-embedded scripting language (CGI binary)
php8.1-cli - command-line interpreter for the PHP scripting language
php8.1-common - documentation, examples and common module for PHP
php8.1-curl - CURL module for PHP
php8.1-dba - DBA module for PHP
php8.1-decimal - Arbitrary precision floating-point decimal for PHP
php8.1-dev - Files for PHP8.1 module development
php8.1-ds - PHP extension providing efficient data structures for PHP 7
php8.1-enchant - Enchant module for PHP
php8.1-fpm - server-side, HTML-embedded scripting language (FPM-CGI binary)
php8.1-gd - GD module for PHP
php8.1-gearman - PHP wrapper to libgearman
php8.1-gmagick - Provides a wrapper to the GraphicsMagick library
php8.1-gmp - GMP module for PHP
php8.1-gnupg - PHP wrapper around the gpgme library
php8.1-grpc - High performance, open source, general RPC framework for PHP
php8.1-http - PECL HTTP module for PHP Extended HTTP Support
php8.1-igbinary - igbinary PHP serializer
php8.1-imagick - Provides a wrapper to the ImageMagick library
php8.1-imap - IMAP module for PHP
php8.1-inotify - Inotify bindings for PHP
php8.1-interbase - Interbase module for PHP
php8.1-intl - Internationalisation module for PHP
php8.1-ldap - LDAP module for PHP
php8.1-lz4 - LZ4 Extension for PHP
php8.1-mailparse - Email message manipulation for PHP
php8.1-maxminddb - Reader for the MaxMind DB file format for PHP
php8.1-mbstring - MBSTRING module for PHP
php8.1-mcrypt - PHP bindings for the libmcrypt library
php8.1-memcache - memcache extension module for PHP
php8.1-memcached - memcached extension module for PHP, uses libmemcached
php8.1-mongodb - MongoDB driver for PHP
php8.1-msgpack - PHP extension for interfacing with MessagePack
php8.1-mysql - MySQL module for PHP
php8.1-oauth - OAuth 1.0 consumer and provider extension
php8.1-odbc - ODBC module for PHP
php8.1-opcache - Zend OpCache module for PHP
php8.1-pcov - Code coverage driver
php8.1-pgsql - PostgreSQL module for PHP
php8.1-phpdbg - server-side, HTML-embedded scripting language (PHPDBG binary)
php8.1-protobuf - Protocol buffers bindings for PHP
php8.1-ps - ps module for PHP
php8.1-pspell - pspell module for PHP
php8.1-psr - PSR interfaces for PHP
php8.1-raphf - raphf module for PHP
php8.1-readline - readline module for PHP
php8.1-redis - PHP extension for interfacing with Redis
php8.1-rrd - PHP bindings to rrd tool system
php8.1-smbclient - PHP wrapper for libsmbclient
php8.1-snmp - SNMP module for PHP
php8.1-soap - SOAP module for PHP
php8.1-solr - PHP extension for communicating with Apache Solr server
php8.1-sqlite3 - SQLite3 module for PHP
php8.1-ssh2 - Bindings for the libssh2 library
php8.1-swoole - Swoole Coroutine Fiber Async Programming Framework for PHP
php8.1-sybase - Sybase module for PHP
php8.1-tidy - tidy module for PHP
php8.1-uopz - UOPZ extension for PHP 7
php8.1-uploadprogress - file upload progress tracking extension for PHP
php8.1-uuid - PHP UUID extension
php8.1-vips - PHP extension for interfacing with libvips
php8.1-xdebug - Xdebug Module for PHP
php8.1-xhprof - Hierarchical Profiler for PHP 5.x
php8.1-xml - DOM, SimpleXML, XML, and XSL module for PHP
php8.1-xmlrpc - XML-RPC servers and clients functions for PHP
php8.1-xsl - XSL module for PHP (dummy)
php8.1-yac - YAC (Yet Another Cache) for PHP
php8.1-yaml - YAML-1.1 parser and emitter for PHP
php8.1-zip - Zip module for PHP
php8.1-zmq - ZeroMQ messaging bindings for PHP
php8.1-zstd - Zstandard extension for PHP
...
~~~


# Setup a logrotate.d script.
Create a file called `php-cli` in `/etc/logrotate.d/` like this:
~~~shell
sudo nano /etc/logrotate.d/php-cli
~~~

And place the contents of this log rotate daemon script in there:
~~~
/var/log/php_errors.log {
    weekly
    missingok
    rotate 13
    compress
    delaycompress
    copytruncate
    notifempty
    create 664 root www-users
    sharedscripts
}
~~~
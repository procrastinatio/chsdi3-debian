#!/bin/bash


# Using package from c2c
if [[ -z  "$(grep mapserver /etc/apt/sources.list)" ]]
then
    ## Add camptocamp repositories <replace <component> by "aws" or "sysadmin" etc
    cat << EOF >> /etc/apt/sources.list
    deb http://pkg.camptocamp.net/apt wheezy/staging mapserver-7.0
    deb http://pkg.camptocamp.net/apt wheezy/staging postgresql-9.4
    deb http://pkg.camptocamp.net/apt wheezy/staging proj-4
EOF

    ## Install c2c packaging keys ##
    curl http://pkg.camptocamp.net/packages-c2c-key.gpg |apt-key add -
    apt-get update

## Preferences for several packages, list each package with its name (boring but necessary) repeat for each <component>
cat << EOF >> /etc/apt/preferences
Package: libproj-dev libproj9 proj proj-bin proj-data postgresql-client-9.4 postgresql-client-common postgresql-common postgresql-contrib-9.4 postgresql-9.4 libpq5	
Pin: release o=Camptocamp
Pin-Priority: 1100
EOF
fi


apt-get install -y build-essential autoconf automake autotools-dev dpkg-dev cdbs
apt-get install -y dh-make debhelper devscripts fakeroot xutils lintian pbuilder 
apt-get install -y git vim curl
apt-get install -y apache2 apache2-mpm-prefork libapache2-mod-wsgi
apt-get install -y libproj0  proj-bin  python-mapscript python-gdal


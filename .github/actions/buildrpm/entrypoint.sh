#!/bin/bash
cd /usr/src/packages

# $GITHUB_SERVER_URL (https://github.com)
# $GITHUB_REPOSITORY (mrcaique/bytecode)
git clone "$GITHUB_SERVER_URL/$GITHUB_REPOSITORY.git"
tar -czf SOURCES/python-bytecode.tar.gz bytecode

# Update release verion on spec file
sed -i -e "s/##RPMVERSION##/$RELEASE_VERSION/" SPECS/python-bytecode.spec

rpmbuild -bb SPECS/python-bytecode.spec
mv RPMS/noarch/*.rpm $GITHUB_WORKSPACE

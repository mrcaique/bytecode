#!/bin/bash
cd /usr/src/packages

# Update release verion on spec file
sed -i -e "s/##RPMVERSION##/$RELEASE_VERSION/" SPECS/python-bytecode.spec

rpmbuild -bb SPECS/python-bytecode.spec
mv RPMS/noarch/*.rpm $GITHUB_WORKSPACE

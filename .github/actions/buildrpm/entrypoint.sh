#!/bin/bash
cd /usr/src/packages

rpmbuild -bb SPECS/python-bytecode.spec
mv RPMS/noarch/*.rpm $GITHUB_WORKSPACE

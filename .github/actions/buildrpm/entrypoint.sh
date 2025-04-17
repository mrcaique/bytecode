#!/bin/bash
cd ~/rpmbuild/

rpmbuild -bb SPECS/python-bytecode.spec
mv RPMS/noarch/*.rpm $GITHUB_WORKSPACE

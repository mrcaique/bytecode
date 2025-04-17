#!/bin/bash

cd ~/

mv python-bytecode.spec rpmbuild/SPECS
mv python-bytecode.tar.gz rpmbuild/SOURCES

rpmbuild -bb rpmbuild/SPECS/python-bytecode.spec
mv rpmbuild/RPMS/noarch/*.rpm /github/workspace

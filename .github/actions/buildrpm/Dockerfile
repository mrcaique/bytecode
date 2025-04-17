FROM opensuse/tumbleweed:latest

# Update
RUN zypper patch -y

# Install necessary packages
RUN zypper in -y \
    rpm-build rpmdevtools dnf-plugins-core python3 git gcc fdupes \
    python311-pip python311-setuptools python311-setuptools_scm python311-wheel python311-pytest \
    python312-pip python312-setuptools python312-setuptools_scm python312-wheel python312-pytest \
    python313-pip python313-setuptools python313-setuptools_scm python313-wheel python313-pytest

RUN rpmdev-setuptree

WORKDIR /root/rpmbuild

# Copy necessary files to build a rpm package
COPY python-bytecode.spec SPECS/
COPY python-bytecode.tar.gz SOURCES/

# Set up the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

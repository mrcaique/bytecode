FROM opensuse/tumbleweed:latest

# Update
RUN zypper patch -y

# Install necessary packages
RUN zypper in -y \
    rpm-build rpmdevtools dnf-plugins-core python3 git gcc fdupes \
    python311-pip python311-setuptools python311-setuptools_scm python311-wheel python311-pytest \
    python312-pip python312-setuptools python312-setuptools_scm python312-wheel python312-pytest \
    python313-pip python313-setuptools python313-setuptools_scm python313-wheel python313-pytest

# Create an user named rpmbuild
RUN useradd rpmuser -u 5002 -g users -p rpmbuild

COPY python-bytecode.spec /home/rpmuser/python-bytecode.spec
COPY python-bytecode*.tar.gz /home/rpmuser/python-bytecode.tar.gz

# Set up the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER rpmuser

WORKDIR /home/rpmbuild

# Setup build directory
RUN rpmdev-setuptree
ENTRYPOINT ["/entrypoint.sh"]

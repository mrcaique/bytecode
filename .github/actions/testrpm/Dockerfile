FROM opensuse/tumbleweed:latest

# Update
RUN zypper patch -y

# Install necessary packages
RUN zypper in -y \
    python311 python312 python313

WORKDIR /tmp/

# Copy necessary files to build a rpm package
COPY *.noarch.rpm ./

# Set up the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

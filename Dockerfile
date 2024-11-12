FROM ubuntu:24.04

LABEL maintainer="soudasuwa@proton.me"
LABEL description="Unofficial containerized Hiveon ASIC Hub"

# Install dependencies and clean up
RUN apt update && \
    apt install -y --no-install-recommends ca-certificates sudo curl python3 && \
    rm -rf /var/lib/apt/lists/*

# Download and setup systemctl replacement
RUN curl -f -o /usr/bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py && \
    chmod +x /usr/bin/systemctl

# Download and prepare Hiveon ASIC Hub install script
RUN curl -f -o install.sh https://download.hiveos.farm/hub/install.sh && \
    chmod +x ./install.sh

# Define build arguments
ARG HUB_CHANNEL
ARG HUB_BUILD
ARG HUB_REPO_URL
ARG FARM_HASH

# Install Hiveon ASIC Hub
RUN ./install.sh

# Set default command to start the service
CMD ["systemctl", "init", "asic-hub.service"]

# Default port
EXPOSE 8800

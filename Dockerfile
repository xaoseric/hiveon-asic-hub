FROM ubuntu:24.04

RUN apt update
RUN apt install -y sudo
RUN apt install -y curl
RUN apt install -y python3

RUN curl -f -o /usr/bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py
RUN chmod +x /usr/bin/systemctl

RUN curl -f -o install.sh https://download.hiveos.farm/hub/install.sh
RUN chmod +x ./install.sh

ARG HUB_CHANNEL
ARG HUB_BUILD
ARG HUB_REPO_URL
ARG FARM_HASH

RUN ./install.sh

CMD systemctl init asic-hub.service

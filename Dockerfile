FROM ubuntu:18.04
MAINTAINER LABEL Rich Rose

# Add dependencies
RUN apt update -y && apt upgrade -y && \
  apt-get install -y \ 
  build-essential \
  libssl-dev \
  libffi-dev \
  python3-dev \
  python3 \
  software-properties-common \ 
  wget \
  xz-utils \
  xdg-utils

# Install calibre
RUN wget --no-check-certificate -nv https://download.calibre-ebook.com/linux-installer.sh && \
  chmod +x ./linux-installer.sh && \
  bash ./linux-installer.sh

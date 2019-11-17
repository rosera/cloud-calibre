FROM ubuntu:18.04
MAINTAINER LABEL Rich Rose

# Add dependencies
RUN apt update -y && apt upgrade -y && \
  apt-get install -y \ 
  build-essential \
  libnss3 \
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
  
# Setup user account
ENV HOME /home/library
RUN useradd --create-home --home-dir $HOME library \
        && chown -R library:library $HOME

# Switch to the user account
USER library

# Set the Work Directory
WORKDIR $HOME/docs


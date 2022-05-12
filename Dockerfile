FROM  nvidia/cuda:9.0-devel-ubuntu16.04

ENV PYTHON_VERSION=3.8

# Set relevant Paths

# Install relevant packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
      # essential
      build-essential \
      cmake \
      ffmpeg \
      g++-4.8 \
      git \
      curl \
      docker.io \
      vim \
      wget \
      unzip \
      htop \
      libjpeg-dev \
      libpng-dev \
      libavdevice-dev \
      pkg-config \
      # python
      python${PYTHON_VERSION} \
      python${PYTHON_VERSION}-dev \
      python3-tk \
      python${PYTHON_VERSION}-distutils \
      # opencv
      python3-opencv \
    # set python
    && ln -sf /usr/bin/python${PYTHON_VERSION} /usr/bin/python \
    && ln -sf /usr/bin/python${PYTHON_VERSION} /usr/bin/python3 \
    && rm -rf /var/lib/apt/lists/*

# Install conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda-3.6.0-Linux-x86_64.sh && bash Miniconda-3.6.0-Linux-x86_64.sh
RUN conda activate &&

# Install pytorch

# Install Requirements

# Copy working directory
ARG WORKSPACE
COPY . ${WORKSPACE}

ENV PYTHONPATH "${PYTHONPATH}:${WORKSPACE}/tridet/"

WORKDIR ${WORKSPACE}

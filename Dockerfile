FROM frolvlad/alpine-glibc

MAINTAINER Loic Gouarin "loic.gouarin@gmail.com"

# Configure environment
ENV CONDA_DIR=/opt/conda CONDA_VER=4.3.11
ENV PATH=$CONDA_DIR/bin:$PATH SHELL=/bin/bash LANG=C.UTF-8

# Install useful packages 
RUN apk --update add \
    bash \
    curl \
    git \
    ca-certificates \
    tini \
    libice \
    libsm \
    libstdc++ &&\
    rm -rf /var/cache/apk/*

# get and install miniconda
RUN curl https://repo.continuum.io/miniconda/Miniconda3-${CONDA_VER}-Linux-x86_64.sh  -o mconda.sh && \
    /bin/bash mconda.sh -f -b -p $CONDA_DIR && \
    rm mconda.sh && \
    rm -rf $CONDA_DIR/pkgs/*
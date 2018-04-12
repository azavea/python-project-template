
# Adapted from https://towardsdatascience.com/how-docker-can-help-you-become-a-more-effective-data-scientist-7fc048ef91d5
FROM ubuntu:16.04

# Adds metadata to the image as a key value pair example LABEL 
LABEL maintainer="Simon Kassel <skassel@azavea.com>"

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    build-essential \
    byobu \
    curl \
    git-core \
    htop \
    pkg-config \
    python3-dev \
    python-pip \
    python-setuptools \
    python-virtualenv \
    unzip \
    nano \
    gdal-bin \
    python-gdal \
    && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-5.0.0.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH

# Copying requirements.txt file
COPY requirements.txt requirements.txt

# pip install 
RUN pip install --upgrade pip
RUN pip install --no-cache -r requirements.txt &&\
    rm requirements.txt

RUN pip install requests==2.18.4
RUN conda install gdal==2.2.2
RUN conda install rasterio==0.36.0

# Open Ports for Jupyter
EXPOSE 8888

#Setup File System
RUN mkdir project
ENV HOME=/project
ENV SHELL=/bin/bash
VOLUME /project
WORKDIR /project

# Run a shell script
CMD ["/bin/bash"]

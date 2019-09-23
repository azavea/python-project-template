FROM python:3.6-slim-stretch

LABEL maintainer="Simon Kassel <skassel@azavea.com>"

ADD requirements.txt /tmp/requirements.txt

RUN apt-get update && \
    apt-get install -y \
        wget \
        build-essential \
        make \
        gcc \
        locales \
        libgdal20 libgdal-dev \
        python-dev \
        protobuf-compiler \
        libprotobuf-dev \
        libtokyocabinet-dev \
        python-psycopg2 \
        libspatialindex-dev && \
    python -m pip install numpy cython --no-binary numpy,cython && \
    python -m pip install \
        "rasterio>=1.0a12" fiona shapely rtree \
        --pre --no-binary rasterio,fiona,shapely && \
    python -m pip install -r /tmp/requirements.txt && \
    python -m pip uninstall -y cython && \
    rm -r /root/.cache/pip && \
    apt-get remove -y --purge libgdal-dev make gcc build-essential && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8
ENV PYTHONPATH="$PYTHONPATH:/home/user/"

# Open Ports for Jupyter
EXPOSE 8888

RUN useradd -d /home/user -m -s /bin/bash user && echo "user:user" | chpasswd && adduser user sudo

# start working in the "tester" home directory
WORKDIR /home/user

# Make the files owned by tester
RUN chown -R user:user /home/user

# Switch to your new user in the docker image
USER user

# Run a shell script
CMD  ["/bin/bash"]



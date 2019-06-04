FROM ubuntu:18.04

# Adds metadata to the image as a key value pair example LABEL 
LABEL maintainer="Simon Kassel <skassel@azavea.com>"

WORKDIR /opt/src/da-project/

RUN apt-get update --fix-missing
RUN apt-get install -y  wget\
    curl \
    git-core \
    python3-dev \
    python3-pip \
    tree \
    nano

# Copying requirements.txt file
COPY requirements.txt requirements.txt

# pip install 
RUN pip3 install --no-cache -r requirements.txt &&\
    rm requirements.txt

ENV PYTHONPATH="$PYTHONPATH:/opt/src/da-project/"

# Open Ports for Jupyter
EXPOSE 8888

# Run a shell script
CMD  ["/bin/bash"]



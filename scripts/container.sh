#!/bin/bash

# run container
docker run -it --rm --name da-project \
	-p 8888:8888 \
	-v $(pwd $1):/project:rw \
	da-project


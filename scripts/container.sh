#!/bin/bash

# run container
docker run -it --rm --name da-project \
	-p 8000:8000 \
	-v $(pwd $1):/project:rw \
	da-project-template


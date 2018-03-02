# Base image
FROM python:3.6

# Updating repository sources
RUN apt-get update

# Copying requirements.txt file
COPY requirements.txt requirements.txt

# pip install 
RUN pip install --no-cache -r requirements.txt

# Exposing ports
EXPOSE 8888

# Running jupyter notebook
# --NotebookApp.token ='demo' is the password
# CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token='demo'"]

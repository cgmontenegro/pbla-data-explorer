# set base image (host OS)
FROM jupyter/scipy-notebook

RUN export DEBIAN_FRONTEND=noninteractive

USER root
RUN apt-get update
RUN apt-get -y install libpq-dev

# RUN pip install pg_config
USER jovyan
RUN pip install psycopg2
RUN pip install openpyxl
# RUN pip install jupyterlab-git
# RUN conda install jupyterlab-git


# set the working directory in the container
# WORKDIR /jupyter

# copy the dependencies file to the working directory
# COPY requirements.txt .

# install dependencies
# RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
# COPY ./app ./app

# command to run on container start
# CMD [ "python", "./app/server.py" ]
# CMD [ "ls", "/app/server.py" ]
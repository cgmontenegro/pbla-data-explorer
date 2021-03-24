# set base image (host OS)
FROM jupyter/scipy-notebook

RUN export DEBIAN_FRONTEND=noninteractive

USER root
RUN apt-get update
RUN apt-get -y install libpq-dev
RUN apt-get -y install python-dev libxml2-dev libxslt1-dev antiword unrtf poppler-utils pstotext tesseract-ocr flac ffmpeg lame libmad0 libsox-fmt-mp3 sox libjpeg-dev swig
# Provide password-less sudo to NB_USER

RUN \
    sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g' && \
    sed -i /etc/sudoers -re 's/^root.*/root ALL=(ALL:ALL) NOPASSWD: ALL/g' && \
    sed -i /etc/sudoers -re 's/^#includedir.*/## **Removed the include directive** ##"/g' && \
    echo "${NB_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \  
    chmod g+w /etc/passwd

USER $NB_UID 

# RUN pip install pg_config
USER jovyan
    RUN pip install psycopg2 openpyxl Unidecode textract wordcloud nltk numpy plotly chart_studio

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
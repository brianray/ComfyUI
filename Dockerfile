# pull the official base image
FROM python:3.8.3-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set up base stuff
RUN apk update && apk add python3-dev \
                        gcc \
                        libc-dev \
                        libffi-dev \
                        zlib-dev \
                        jpeg-dev \ 
                        musl-dev
# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt

# copy project
COPY . /usr/src/app

EXPOSE 8080
CMD ["python", "comfy/main.py", "main.py", "0.0.0.0:8080"]

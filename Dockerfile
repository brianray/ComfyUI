FROM pytorch/pytorch:latest


# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV CUDA_VISIBLE_DEVICES 1

# set up base stuff

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt

RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118 xformers

# copy project
COPY . /usr/src/app

EXPOSE 8188
CMD ["python", "main.py"]
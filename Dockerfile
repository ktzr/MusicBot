FROM ubuntu:16.04

MAINTAINER kevin, https://github.com/thekevinchi/joinbot

#Install dependencies
RUN apt-get update \
    && apt-get install build-essential unzip -y \
    && apt-get install software-properties-common -y \
    && apt-get install ffmpeg -y \
    && apt-get install libopus-dev -y \
    && apt-get install libffi-dev -y \
    && apt-get install libsodium-dev -y \
    && apt-get install python3-pip -y \
    && apt-get upgrade -y


#Install PIP dependencies
#RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt


#Add musicBot
ADD . /musicBot
WORKDIR /musicBot


#Add volume for configuration
VOLUME /musicBot/config
VOLUME /musicBot/audio_cache

CMD bash run.sh

FROM debian:jessie
RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils apt-transport-https gnupg wget git
ADD wikimedia.key /root/
ADD wikimedia.list /etc/apt/sources.list.d/
ADD wikimedia.pref /etc/apt/preferences.d/
RUN apt-key add /root/wikimedia.key && rm -f /root/wikimedia.key && apt-get update && apt-get -y upgrade && apt-get -y install nodejs nodejs-legacy npm && rm -rf /var/lib/apt/lists/*
ENV HOME=/root/ LINK=g++
CMD ["/bin/bash"]


FROM node
MAINTAINER ukatama dev.ukatama@gmail.com

RUN npm install -g bower
RUN npm install -g grunt-cli

RUN apt-get update -y -q
RUN apt-get install ruby-sass -y -q

ADD board board

RUN cd board && npm install
RUN cd board && yes | bower install --allow-root
RUN cd board && grunt

RUN apt-get remove ruby-sass -y -q
RUN apt-get clean -y -q

ENTRYPOINT cd board && node .
EXPOSE 80

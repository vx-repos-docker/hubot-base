FROM killuavx/nodejs-alpine
MAINTAINER Ranger.Huang <killua.vx@gmail.com>
ENV REFRESH_AT 2016-09-01

USER root

#RUN npm config set registry https://registry.npm.taobao.org
RUN npm install -g coffee-script yo generator-hubot

RUN mkdir -p /home/hubot
RUN adduser -h /home/hubot -s /bin/sh -D hubot
RUN echo "hubot ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN apk add --no-cache tar curl --arch x86_64
RUN apk add --no-cache git --arch x86_64

WORKDIR /home/hubot
USER hubot

ENV BOT_NAME "hubot"
ENV BOT_OWNER "No owner specified"
ENV BOT_DESC "Hubot~"

RUN echo n | yo hubot --owner="$BOT_OWNER" --name="$BOT_NAME" --description="$BOT_DESC" --defaults


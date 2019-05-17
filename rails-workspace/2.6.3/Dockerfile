FROM ruby:2.6.3-alpine

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache \
        alpine-sdk tzdata mysql-client mysql-dev nodejs

RUN gem install bundler

RUN mkdir /app
WORKDIR /app

VOLUME /app
EXPOSE 3000

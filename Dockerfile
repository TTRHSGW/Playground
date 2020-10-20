FROM ruby:2.6.5-alpine
RUN apk add --update --no-cache \
  build-base \
  gmp-dev \
  libxslt-dev \
  libxml2-dev \
  postgresql-client \
  tzdata \
  yarn \
  bash

WORKDIR /myapp
COPY Gemfile .
COPY Gemfile.lock .

COPY package.json .
COPY yarn.lock .

RUN bundle install
RUN yarn install --check-files

COPY . /myapp

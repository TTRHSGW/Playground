FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential nodejs libpq-dev
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

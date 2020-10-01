FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY . /myapp
RUN bundle install

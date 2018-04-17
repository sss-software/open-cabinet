FROM ruby:2.2.9
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm vim

RUN mkdir /myapp

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /myapp
WORKDIR /myapp

# Eventually when issues are resolved, this should be here
# RUN bundle exec rake assets:precompile
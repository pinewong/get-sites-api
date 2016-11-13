FROM rails:5.0.0.1
MAINTAINER PineWong <pinewong@163.com>

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /app
WORKDIR /app

# RUN \
#   gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/ && \
#   bundle config mirror.https://rubygems.org https://gems.ruby-china.org

COPY Gemfile /app
COPY Gemfile.lock /app
RUN bundle install

COPY . /app

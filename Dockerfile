FROM rails:5.0.0.1
MAINTAINER PineWong <pinewong@163.com>

CMD ["/usr/bin/supervisord"]

# Supervisord
RUN apt-get install -y supervisor

# Bundle
ADD ./auroraWS/Gemfile Gemfile
ADD ./auroraWS/Gemfile.lock Gemfile.lock
RUN bundle install

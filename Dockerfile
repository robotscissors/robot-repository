FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libmagic-dev libpq-dev nodejs

COPY . /var/www/app
WORKDIR /var/www/app

RUN bundle install

CMD bin/rails server -b 0.0.0.0 -p 80

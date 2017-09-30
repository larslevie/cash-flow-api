FROM ruby:2.4.2-alpine3.6
MAINTAINER Lars Levie <larslevie@gmail.com>

RUN apk --update add \
      curl \
      postgresql-client \
      make

WORKDIR /code
COPY Gemfile Gemfile.* /code/
COPY docker/* /code/docker/
RUN chmod 655 /code/docker/*

ENV BUNDLE_GEMFILE=/code/Gemfile \
      BUNDLE_JOBS=4 \
      BUNDLE_RETRY=3 \
      BUNDLE_PATH=/bundle

RUN ./docker/install-gems
COPY . /code/
CMD ["bundle", "exec", "rails", "s", "Puma", "-b", "0.0.0.0"]

FROM ruby:2.7

# Install build deps
RUN apt-get update -q && apt-get install -qy \
  procps \
  curl \
  ca-certificates \
  gnupg2 \
  build-essential \
  libxml2-dev \
  libxslt-dev \
  libpq-dev \
  nodejs \
  postgresql \
  postgresql-contrib \
  imagemagick \
  --no-install-recommends \
  && apt-get clean

WORKDIR /app

COPY Gemfile ./

RUN gem install bundler -v 2.4.22 && bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]


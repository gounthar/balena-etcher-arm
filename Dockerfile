# I took everything from the build instructions found there: https://github.com/futurejones/balena-etcher-arm/blob/main/etcher-build/README.md
FROM debian

RUN apt update && \
  apt-get install -y git curl python gcc g++ make libx11-dev libxkbfile-dev fakeroot rpm libsecret-1-dev jq python2.7-dev python3-pip python-setuptools libudev-dev ruby-dev && \
  gem install fpm --no-document #tested with version 1.14.1 && \
  # install NodeJS && \
  curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
  apt-get install -y nodejs && \
  git clone --recursive https://github.com/balena-io/etcher && \
  cd etcher && \
  git checkout v1.7.8 # latest version available 2022/03/21

# I took everything from the build instructions found there: https://github.com/futurejones/balena-etcher-arm/blob/main/etcher-build/README.md
FROM debian:buster

RUN apt update && apt install libseccomp2
RUN apt update && \
  apt-get install -y git curl python gcc g++ make libx11-dev libxkbfile-dev \
   fakeroot rpm libsecret-1-dev jq python2.7-dev python3-pip python-setuptools \
   libudev-dev ruby-dev libseccomp2 && \
  gem install fpm --no-document #tested with version 1.14.1

# install NodeJS && \
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
  apt-get install -y nodejs

VOLUME ["/home/etching/etcher"]
WORKDIR /home/etching

RUN addgroup --system solution && adduser --system etching --ingroup solution && \
  mkdir -p /home/etching/ && chown -R etching:solution /home/etching

ADD etcher-build/build.sh /sbin

# USER etching:solution

RUN cd && git clone --recursive https://github.com/balena-io/etcher && \
  cd etcher && \
  git checkout v1.7.8 # latest version available 2022/03/21

ENTRYPOINT ["/sbin/build.sh"]
CMD ["pwd"]

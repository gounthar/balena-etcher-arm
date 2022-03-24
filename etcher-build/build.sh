#!/bin/bash
cd ~/etcher
pip3 install -r requirements.txt && \
  make electron-develop && \
  # restrict output to .deb package only to save build time && \
  sed -i 's/TARGETS="deb rpm appimage"/TARGETS="deb"/g' scripts/resin/electron/build.sh && \
# Note: run `make electron-develop` before running build. && \
# use USE_SYSTEM_FPM="true" to force the use of the installed FPM version && \
USE_SYSTEM_FPM="true" make electron-build && \
#  *.deb package will be in /etcher/dist/* && \
# filename will depend on which release version was checked out && \
# apt-get install ./dist/balena-etcher-electron_*.deb 

# https://stackoverflow.com/a/60487804/2938320
exec "$@"

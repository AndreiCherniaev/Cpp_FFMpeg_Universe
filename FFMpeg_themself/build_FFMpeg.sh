#!/bin/bash

#cd QT_FFMpeg_Universe/
export MyBaseDir=${PWD}
mkdir -p FFMpeg_themself
rm -Rf ${MyBaseDir}/FFMpeg_themself/build ${MyBaseDir}/FFMpeg_themself/build_artifacts && mkdir ${MyBaseDir}/FFMpeg_themself/build ${MyBaseDir}/FFMpeg_themself/build_artifacts
git clone https://git.ffmpeg.org/ffmpeg.git FFMpeg_themself/ffmpeg
cd ${MyBaseDir}/FFMpeg_themself/build
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="${MyBaseDir}/FFMpeg_themself/build/lib/pkgconfig" ${MyBaseDir}/FFMpeg_themself/ffmpeg/configure \
  --prefix="${MyBaseDir}/FFMpeg_themself/build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I${MyBaseDir}/FFMpeg_themself/build/include" \
  --extra-ldflags="-L${MyBaseDir}/FFMpeg_themself/build/lib" \
  --extra-libs="-lpthread -lm" \
  --ld="g++" \
  --bindir="${MyBaseDir}/FFMpeg_themself/build_artifacts" \
  --enable-gpl \
  --enable-libopenh264 \
  --enable-shared \
  --disable-static \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-swresample \
  --disable-decoders \
  --disable-doc \
  --disable-encoders \
  --enable-encoder=mjpeg
make -j16
make install

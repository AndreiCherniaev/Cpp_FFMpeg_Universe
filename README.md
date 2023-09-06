# QT_FFMpeg_Universe
 FFMpeg with Qt integration

Prepare and [build](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#FFmpeg) FFMpeg
```bash
git clone https://github.com/AndreiCherniaev/QT_FFMpeg_Universe.git && MyBaseDir=${PWD}/QT_FFMpeg_Universe cd QT_FFMpeg_Universe
chmod +x FFMpeg_themself/build_FFMpeg.sh
FFMpeg_themself/build_FFMpeg.sh
```
Now we are ready to build simplest C++ example with cmake build system... Build steps:
```bash
echo ${MyBaseDir} #check path
cd ${MyBaseDir}
cmake -S Qt_FFMpeg/src/ -B Qt_FFMpeg/build-host/ --fresh
```
Alternative (more console-like) build steps:
```bash
export PKG_CONFIG_PATH="${MyBaseDir}/FFMpeg_themself/ffmpeg_build/lib/pkgconfig/"
cmake -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=TRUE -DCMAKE_PREFIX_PATH=${MyBaseDir}/FFMpeg_themself/ffmpeg_build/lib/pkgconfig/ -S Qt_FFMpeg/src/ -B Qt_FFMpeg/build-host/
```

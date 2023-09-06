# QT_FFMpeg_Universe
 FFMpeg with Qt integration

0) git clone https://github.com/AndreiCherniaev/QT_FFMpeg_Universe.git && MyBaseDir=${PWD}/QT_FFMpeg_Universe cd QT_FFMpeg_Universe && 
1) chmod +x FFMpeg_themself/build_FFMpeg.sh
2) FFMpeg_themself/build_FFMpeg.sh
3
```cpp
cd ${MyBaseDir}
export PKG_CONFIG_PATH="/home/a/Downloads/myGitHub/QT_FFMpeg_Universe/FFMpeg_themself/ffmpeg_build/lib/pkgconfig/"
cmake -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=TRUE -DCMAKE_PREFIX_PATH=${MyBaseDir}/FFMpeg_themself/ffmpeg_build/lib/pkgconfig/ -S Qt_FFMpeg/src/ -B Qt_FFMpeg/build-host/
```
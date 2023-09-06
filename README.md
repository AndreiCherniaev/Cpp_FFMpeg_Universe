# QT_FFMpeg_Universe
 FFMpeg with Qt integration

0) git clone https://github.com/AndreiCherniaev/QT_FFMpeg_Universe.git && cd QT_FFMpeg_Universe && MyBaseDir=${PWD}
1) chmod +x FFMpeg_themself/build_FFMpeg.sh
2) FFMpeg_themself/build_FFMpeg.sh
3
```cpp
#cmake -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=TRUE -DCMAKE_PREFIX_PATH=${MyBaseDir}/FFMpeg_themself/build/libavcodec/ -S Qt_FFMpeg/src/ -B build-host/
cmake -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=TRUE -DCMAKE_PREFIX_PATH=${MyBaseDir}/FFMpeg_themself/build/lib/pkgconfig/ -S Qt_FFMpeg/src/ -B build-host/
```
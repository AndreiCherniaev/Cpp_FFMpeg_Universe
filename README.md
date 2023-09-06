This is C++ project that using FFMpeg, build system is cmake. 
## How build

Prepare and [build](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#FFmpeg) FFMpeg
```bash
git clone https://github.com/AndreiCherniaev/QT_FFMpeg_Universe.git && MyBaseDir=${PWD}/QT_FFMpeg_Universe cd QT_FFMpeg_Universe
chmod +x FFMpeg_themself/build_FFMpeg.sh
FFMpeg_themself/build_FFMpeg.sh
```
Build steps:
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

I found /home/a/Downloads/myGitHub/QT_FFMpeg_Universe/FFMpeg_themself/ffmpeg_build/lib/pkgconfig/

## Result
When Qt_FFMpeg/src/CMakeLists.txt use
```bash
#set(CMAKE_PREFIX_PATH ${pkgconfig_path}) #makes "A required package was not found"
set(ENV{PKG_CONFIG_PATH} ${pkgconfig_path}) #ok
```
then you should get ok result like this
```bash
~/QT_FFMpeg_Universe$ cmake -S Qt_FFMpeg/src/ -B Qt_FFMpeg/build-host/ --fresh
-- The CXX compiler identification is GNU 11.4.0
-- The C compiler identification is GNU 11.4.0
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
I found /home/user/QT_FFMpeg_Universe/FFMpeg_themself/ffmpeg_build/lib/pkgconfig/
-- Found PkgConfig: /usr/bin/pkg-config (found version "0.29.2") 
-- Checking for module 'libavcodec'
--   Found libavcodec, version 60.25.100
-- Configuring done (0.2s)
-- Generating done (0.0s)
-- Build files have been written to: /home/user/QT_FFMpeg_Universe/Qt_FFMpeg/build-host
```
But if you use
```bash
set(CMAKE_PREFIX_PATH ${pkgconfig_path}) #makes "A required package was not found"
#set(ENV{PKG_CONFIG_PATH} ${pkgconfig_path}) #ok
```
then you should get bad result like this
```bash
I found 
-- Found PkgConfig: /usr/bin/pkg-config (found version "0.29.2") 
-- Checking for module 'libavcodec'
--   No package 'libavcodec' found
CMake Error at /home/a/.local/lib/python3.10/site-packages/cmake/data/share/cmake-3.26/Modules/FindPkgConfig.cmake:607 (message):
  A required package was not found
Call Stack (most recent call first):
  /home/a/.local/lib/python3.10/site-packages/cmake/data/share/cmake-3.26/Modules/FindPkgConfig.cmake:829 (_pkg_check_modules_internal)
  CMakeLists.txt:19 (pkg_check_modules)
```
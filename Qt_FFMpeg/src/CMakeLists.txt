cmake_minimum_required(VERSION 3.26.4) #3.1 also ok

set(CMAKE_BUILD_TYPE Debug)

project(QT_FFMpeg_example LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

cmake_path(SET pkgconfig_path "${CMAKE_CURRENT_LIST_DIR}/../../FFMpeg_themself/ffmpeg_build/lib/pkgconfig/" NORMALIZE)

#use one string, comment another
#set(CMAKE_PREFIX_PATH ${pkgconfig_path}) #makes "A required package was not found"
set(ENV{PKG_CONFIG_PATH} ${pkgconfig_path}) #ok

message("I found $ENV{PKG_CONFIG_PATH}")

find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBAV REQUIRED IMPORTED_TARGET
    libavcodec
)

add_executable(${PROJECT_NAME}
    main.cpp
)

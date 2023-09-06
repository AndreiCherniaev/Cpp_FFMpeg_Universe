cmake_minimum_required(VERSION 3.16)

set(CMAKE_BUILD_TYPE Debug)

project(QT_FFMpeg_example LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#set(CMAKE_PREFIX_PATH "/home/a/Downloads/myGitHub/QT_FFMpeg_Universe/FFMpeg_themself/ffmpeg_build/lib/pkgconfig/")
set(ENV{PKG_CONFIG_PATH} "/home/a/Downloads/myGitHub/QT_FFMpeg_Universe/FFMpeg_themself/ffmpeg_build/lib/pkgconfig/")

#cmake_path(SET ENV{PKG_CONFIG_PATH} "/home/a/Downloads/myGitHub/QT_FFMpeg_Universe/FFMpeg_themself/ffmpeg_build/lib/pkgconfig/" NORMALIZE)
# not work cmake_path(SET ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_LIST_DIR}/../../FFMpeg_themself/ffmpeg_build/lib/pkgconfig/" NORMALIZE)
message("hello from ${CMAKE_PREFIX_PATH}")

find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBAV REQUIRED IMPORTED_TARGET
    libavcodec
)

add_executable(${PROJECT_NAME}
    main.cpp
)

install(TARGETS ${PROJECT_NAME}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

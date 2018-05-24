#!/usr/bin/env bash
# my system is openSUSE Leap 42.3

old_version=4.8
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$old_version \
                    10 \
                    --slave   /usr/bin/cc cc /usr/bin/gcc-$old_version \
                    --slave   /usr/bin/c++ c++ /usr/bin/g++-$old_version \
                    --slave   /usr/bin/g++ g++ /usr/bin/g++-$old_version \
                    --slave   /usr/bin/gcov gcov /usr/bin/gcov-$old_version \
                    --slave   /usr/bin/gcov-dump gcov-dump /usr/bin/gcov-dump-$old_version \
                    --slave   /usr/bin/gcov-tool gcov-tool /usr/bin/gcov-tool-$old_version \
                    --slave   /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-$old_version \
                    --slave   /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-$old_version \
                    --slave   /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-$old_version

new_version=7
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$new_version \
                    15 \
                    --slave   /usr/bin/cc cc /usr/bin/gcc-$new_version \
                    --slave   /usr/bin/c++ c++ /usr/bin/g++-$new_version \
                    --slave   /usr/bin/g++ g++ /usr/bin/g++-$new_version \
                    --slave   /usr/bin/gcov gcov /usr/bin/gcov-$new_version \
                    --slave   /usr/bin/gcov-dump gcov-dump /usr/bin/gcov-dump-$new_version \
                    --slave   /usr/bin/gcov-tool gcov-tool /usr/bin/gcov-tool-$new_version \
                    --slave   /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-$new_version \
                    --slave   /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-$new_version \
                    --slave   /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-$new_version

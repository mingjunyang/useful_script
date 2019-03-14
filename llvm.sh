#!/usr/bin/env bash
# set -x
# my system is openSUSE Leap 42.3

set -e

llvm_version=6.0.0
mkdir -p llvm_$llvm_version

cd llvm_$llvm_version || exit

wget https://releases.llvm.org/$llvm_version/llvm-$llvm_version.src.tar.xz
wget https://releases.llvm.org/$llvm_version/cfe-$llvm_version.src.tar.xz
wget https://releases.llvm.org/$llvm_version/compiler-rt-$llvm_version.src.tar.xz
wget https://releases.llvm.org/$llvm_version/libcxx-$llvm_version.src.tar.xz
wget https://releases.llvm.org/$llvm_version/libcxxabi-$llvm_version.src.tar.xz
wget https://releases.llvm.org/$llvm_version/libunwind-$llvm_version.src.tar.xz
wget https://releases.llvm.org/$llvm_version/lld-$llvm_version.src.tar.xz
wget https://releases.llvm.org/$llvm_version/lldb-$llvm_version.src.tar.xz
wget https://releases.llvm.org/$llvm_version/openmp-$llvm_version.src.tar.xz
wget https://releases.llvm.org/$llvm_version/polly-$llvm_version.src.tar.xz
wget https://releases.llvm.org/$llvm_version/clang-tools-extra-$llvm_version.src.tar.xz

tar_list=$(ls *.tar.xz)
echo "$(pwd)"

for item in $tar_list;
do
  echo "$item"
  tar xf ./"$item"
done

LLVMDIR=llvm-$llvm_version.src

mv cfe-$llvm_version.src    $LLVMDIR/tools/clang
mv lldb-$llvm_version.src    $LLVMDIR/tools/lldb
mv lld-$llvm_version.src    $LLVMDIR/tools/lld
mv clang-tools-extra-$llvm_version.src    $LLVMDIR/tools/clang/tools/extra

mv compiler-rt-$llvm_version.src    $LLVMDIR/projects/compiler-rt
mv libcxx-$llvm_version.src    $LLVMDIR/projects/libcxx
mv libcxxabi-$llvm_version.src    $LLVMDIR/projects/libcxxabi
mv libunwind-$llvm_version.src    $LLVMDIR/projects/libunwind

mv openmp-$llvm_version.src    $LLVMDIR/tools/openmp
mv polly-$llvm_version.src    $LLVMDIR/tools/polly



mkdir -p build
cd build

cmake ../$LLVMDIR -DPYTHON_EXECUTABLE:FILEPATH=/usr/local/bin/python3
cmake --build .
cmake -DCMAKE_INSTALL_PREFIX=/opt/llvm6 -P cmake_install.cmake

# install swig 3.0.12 replace old 3.0.10
# ln -s /usr/include/ncurses/panel.h  /usr/include/panel.h

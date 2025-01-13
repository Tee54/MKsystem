#!/usr/bin/env bash
echo "This Script is meant for x84_64 arquitecture Cross-Compiler\n By: Ciro Dario Sanchez Acosta"

PREFIX="$HOME/opt/cross"
TARGET="x86_64-elf"
PATH="$PREFIX/bin:$PATH"

mkdir -p $PREFIX
mkdir -p /tmp/src

cd /tmp/src
curl -O https://ftp.gnu.org/gnu/binutils/binutils-2.43.tar.gz #binutils
tar -xf binutils-2.43.tar.gz
mkdir build-binutils
cd build-binutils
../binutils-2.43/configure --target="$TARGET" --prefix="$PREFIX" --disable-nls --disable-werror
make -j$(nproc)
make install

cd /tmp/src
curl -O https://ftp.gnu.org/gnu/gcc/gcc-14.2.0/gcc-14.2.0.tar.gz #gcc
tar -xf gcc-14.2.0.tar.gz
cd gcc-14.2.0
./contrib/download_prerequisites
cd /tmp/src
mkdir build-gcc
cd build-gcc
../gcc-14.2.0/configure --target="$TARGET" --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers --disable-bootstrap
make -j$(nproc) all-gcc
make install-gcc
make -j$(nproc) all-target-libgcc
make install-target-libgcc

echo "\n DONE"

#!/bin/bash

set -ex

# From https://cpucycles.cr.yp.to/install.html --
# Compilers tried are listed in compilers/default. Each compiler includes -fPIC to
# create a shared library, -fvisibility=hidden to hide non-public symbols in the
# library, and -fwrapv to switch to a slightly less dangerous version of C.
echo "$CC $CFLAGS -fwrapv -fvisibility=hidden" > compilers/default

./configure --prefix=$PREFIX

make

make install

# Remove static libs
rm $PREFIX/lib/*.a

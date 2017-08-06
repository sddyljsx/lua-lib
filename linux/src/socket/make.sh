#!/bin/bash
cp -r ../../lua_lib/include src/
make linux
make install-unix
mkdir lib
cp -r src/lib .
cd lib
lua ../test/hello.lua
cd ..

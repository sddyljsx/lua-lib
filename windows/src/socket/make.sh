#!/bin/bash
cp -r ../../lua_lib/lib src/
cp -r ../../lua_lib/include src/
make mingw
make install
mkdir lib
cp -r src/lib .
cd lib
rm *.dll
cp ../../../lua_lib/bin/lua.exe lua52.exe
cp ../../../lua_lib/bin/lua52.dll lua52.dll
lua52 ../test/hello.lua
cd ..

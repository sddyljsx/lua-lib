#!/bin/bash
cp -r ../../lua_lib/lib .
cp -r ../../lua_lib/include .
cp -r ../../iconv_lib/lib .
cp -r ../../iconv_lib/include .
make
cp ../../lua_lib/bin/lua.exe lua52.exe
cp ../../lua_lib/bin/lua52.dll lua52.dll
make test

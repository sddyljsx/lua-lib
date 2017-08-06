#!/bin/bash
cp -r ../../lua_lib/lib .
cp -r ../../lua_lib/include .
cp -r ../../pcre_lib/lib .
cp -r ../../pcre_lib/include .
make
cp ../../lua_lib/bin/lua.exe lua52.exe
cp ../../lua_lib/bin/lua52.dll lua52.dll
make test

#!/bin/bash
cp -r ../../lua_lib/include .
cp -r ../../iconv_lib/lib .
cp -r ../../iconv_lib/include .
make
make test

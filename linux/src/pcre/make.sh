#!/bin/bash
cp -r ../../lua_lib/include .
cp -r ../../pcre_lib/lib .
cp -r ../../pcre_lib/include .
make
make test

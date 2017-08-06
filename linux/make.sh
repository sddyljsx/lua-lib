#!/bin/bash
CURRENT_PATH=$PWD
echo -e "begin compile lua..."
mkdir lua_lib
mkdir lua_lib/include
mkdir lua_lib/lib
mkdir lua_lib/bin
rm -rf lua-5.2.4
tar xvf lua-5.2.4.tar.gz
cd lua-5.2.4/src
make liblua.a MYCFLAGS=-fPIC
cp lua.h lua.hpp lualib.h lauxlib.h luaconf.h $CURRENT_PATH/lua_lib/include
cp liblua.a $CURRENT_PATH/lua_lib/lib/
#make linux
#cp lua luac $CURRENT_PATH/lua_lib/bin/
cd ../..
echo -e "lua compile done.\n"

echo -e "begin compile pcre..."
rm -rf pcre-8.39
tar xvf pcre-8.39.tar.gz
cd pcre-8.39
chmod 755 ./configure
./configure --prefix="$CURRENT_PATH/pcre_lib" --enable-utf=yes --enable-static=yes --enable-shared=no CFLAGS="-fPIC"
make
make install
cd ..
echo -e "pcre compile done."

echo -e "begin compile iconv..."
rm -rf libiconv-1.15
tar xvf libiconv-1.15.tar.gz
cd libiconv-1.15
chmod 755 ./configure
./configure --prefix="$CURRENT_PATH/iconv_lib" --enable-utf=yes --enable-static=yes --enable-shared=no CFLAGS="-fPIC"
make
make install
cd ..
echo -e "iconv compile done."

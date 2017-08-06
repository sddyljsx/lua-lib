PROJECT  = iconv
VERSION  = 1.0
# Target Lua version (51 for Lua 5.1; 52 for Lua 5.2).
LUAVERSION = 52
LUADOTVERSION = $(subst 5,5.,$(LUAVERSION))
# Target bitness: 32 or 64
DIRBIT = 64
INSTALLPATH = $(CURDIR)/output
LUALIB      = lua
PROLIB      = $(PROJECT)
INCPATH     = $(CURDIR)/include
LIBPATH     = $(CURDIR)/lib
OBJ         = $(PROJECT).o

ifeq ($(LUAVERSION),51)
  LUAEXE = lua
  CREATEGLOBAL = -DREX_CREATEGLOBALVAR
else
  LUAEXE = lua
endif

ifeq ($(LUAVERSION),53)
  LUA_COMPAT = -DLUA_COMPAT_5_2
endif
# --------------------------------------------------------------------------

BIN        = $(PROJECT).so
CC         = gcc
CFLAGS     = -W -Wall -O2 $(INCS) -DREX_OPENLIB=luaopen_$(PROJECT) \
             -DREX_LIBNAME=\"$(PROJECT)\" -DVERSION=\"$(VERSION)\" \
             -m$(DIRBIT) $(CREATEGLOBAL) $(LUA_COMPAT)
INCS       = -I$(INCPATH)
LIBS       = -m$(DIRBIT) -s -l$(PROLIB)

.PHONY: all

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(OBJ) -L$(LIBPATH) $(LIBS) -o $@ -shared -fPIC

$(OBJ): $(PROJECT).c
	$(CC) -o $@ -c $(CFLAGS) $(PROJECT).c -L$(LIBPATH) $(LIBS) -shared -fPIC

test:
	$(LUAEXE) test.lua

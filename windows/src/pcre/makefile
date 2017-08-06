PROJECT  = pcre
VERSION  = 1.0
# Target Lua version (51 for Lua 5.1; 52 for Lua 5.2).
LUAVERSION = 52
LUADOTVERSION = $(subst 5,5.,$(LUAVERSION))
# Target bitness: 32 or 64
DIRBIT = 32
INSTALLPATH = $(CURDIR)/output
LUADLL      = lua$(LUAVERSION)
PRODLL      = $(PROJECT)
INCPATH     = $(CURDIR)/include
LIBPATH     = $(CURDIR)/lib
OBJ         = $(PROJECT).o

ifeq ($(LUAVERSION),51)
  LUAEXE = lua.exe
  CREATEGLOBAL = -DREX_CREATEGLOBALVAR
else
  LUAEXE = lua$(LUAVERSION).exe
endif

ifeq ($(LUAVERSION),53)
  LUA_COMPAT = -DLUA_COMPAT_5_2
endif
# --------------------------------------------------------------------------

BIN        = $(PROJECT).dll
CC         = gcc
CFLAGS     = -W -Wall -O2 $(INCS) -DREX_OPENLIB=luaopen_$(PROJECT) \
             -DREX_LIBNAME=\"$(PROJECT)\" -DVERSION=\"$(VERSION)\" \
             -m$(DIRBIT) $(CREATEGLOBAL) $(LUA_COMPAT)
DEFFILE    = $(PROJECT).def
EXPORTED   = luaopen_$(PROJECT)
INCS       = -I$(INCPATH)
LIBS       = -l$(LUADLL) -m$(DIRBIT) -s -l$(PRODLL)

.PHONY: all

all: $(BIN)

$(BIN): $(OBJ) $(DEFFILE)
	$(CC) $(DEFFILE) $(OBJ) -L$(LIBPATH) $(LIBS) -o $@ -shared

$(DEFFILE):
	echo EXPORTS > $@
	echo "  "$(EXPORTED) >> $@

$(OBJ): $(PROJECT).c
	$(CC) -o $@ -c $(CFLAGS) $(PROJECT).c -L$(LIBPATH) $(LIBS)

test:
	$(LUAEXE) test.lua
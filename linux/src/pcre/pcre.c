#define PCRE_STATIC 1
#include "pcre.h"
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

static int lua_re_compile(lua_State *L) {
    pcre *compiled;
    const char *err_str;
    int err_offset;

    const char *str = luaL_checkstring(L, 1); 
    compiled = pcre_compile(str, PCRE_UTF8, &err_str, &err_offset, NULL);
    if (compiled == NULL) {
        return luaL_error(L, "%s (pattern offset: %d)\n", err_str, err_offset);
    }   
    pcre_free(compiled);
    return 0;
}

static int lua_re_match(lua_State *L) {
    pcre *compiled;
    pcre_extra *extra;
    const char *err_str;
    int err_offset;

    size_t strlen;
    const char *pat = luaL_checkstring(L, 1); 
    const char *str = luaL_checklstring(L, 2, &strlen);
    compiled = pcre_compile(pat, PCRE_UTF8, &err_str, &err_offset, NULL);
    if (compiled == NULL) {
        return luaL_error(L, "%s (pattern offset: %d)\n", err_str, err_offset);
    }   

    extra = pcre_study(compiled, 0, &err_str);

    if (err_str != NULL) {
        pcre_free(compiled);
        return luaL_error(L, "%s", err_str);
    }

    int exe_ret;
    exe_ret = pcre_exec(compiled, NULL, str, strlen, 0, 0, NULL, 0);
    pcre_free(compiled);
    lua_pushinteger(L, exe_ret);
    return 1;
}

int luaopen_pcre(lua_State *L) {
    const struct luaL_Reg relib[] = {
        {"compile", lua_re_compile},
        {"match", lua_re_match},
        {NULL, NULL}
    };
    luaL_newlib(L, relib);
    return 1;
}
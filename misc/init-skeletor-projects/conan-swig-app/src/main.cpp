
extern "C"
{
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
}
#include <filesystem>
#include "lib.h"

using namespace std;
using namespace std::filesystem;

const char LUA_LIB_NAME[] = "lib";
extern "C" int luaopen_lib(lua_State * L);

int run_lua(int argc, char* argv[]) {
    if(argc > 1)
    {
        const char *file_name = argv[1];

        lua_State* L = luaL_newstate();
        luaL_openlibs(L);
        luaL_requiref(L, LUA_LIB_NAME, luaopen_lib, 1);
        int rt = luaL_dofile(L, file_name);
        if (rt != LUA_OK) {
            printf("error %s\n", lua_tostring(L, -1));
            lua_pop(L, 1);
        }

        lua_close(L);
        return rt;
    }

    return LUA_OK;
}

int main(int argc, char* argv[]) {
    return run_lua(argc, argv);
}

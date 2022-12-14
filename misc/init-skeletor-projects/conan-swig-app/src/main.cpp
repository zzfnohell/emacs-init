#define DOCTEST_CONFIG_IMPLEMENT
#include <doctest/doctest.h>
extern "C"
{
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
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
    doctest::Context context;
    context.applyCommandLine(argc, argv);

    int res = context.run(); // run doctest

    // important - query flags (and --exit) rely on the user doing this
    if (context.shouldExit()) {
        // propagate the result of the tests
        return res;
    }

    return run_lua(argc, argv);
}

int factorial(const int number) {
    return number < 1 ? 1 : number <= 1 ? number : factorial(number - 1) * number;
}

TEST_CASE("testing the factorial function") {
    CHECK(factorial(0) == 1);
    CHECK(factorial(1) == 1);
    CHECK(factorial(2) == 2);
    CHECK(factorial(3) == 6);
    CHECK(factorial(10) == 3628800);
}

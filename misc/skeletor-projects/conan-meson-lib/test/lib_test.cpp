#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <doctest/doctest.h>

#include "lib.h"

TEST_CASE("score finds needle in haystack")
{
  CHECK(score("ell", "hello") == 1);
  CHECK(score("xyz", "hello") == 0);
}

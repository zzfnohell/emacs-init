#include "lib.h"

#include <cstring>

int score(const char *needle, const char *haystack)
{
  if (!needle || !haystack) {
    return 0;
  }
  return std::strstr(haystack, needle) != nullptr ? 1 : 0;
}

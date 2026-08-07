#include <cstdio>

#include <spdlog/spdlog.h>

int main()
{
  spdlog::info("Hello, {}!", "__PROJECT-NAME__");
  std::printf("Hello, World!\n");
  return 0;
}

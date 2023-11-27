#define DOCTEST_CONFIG_IMPLEMENT
#include <doctest/doctest.h>
#include "lib.h"

int main(int argc, char **argv) {
		int x = factorial(66);
		printf("%s, fact = %d\n", "Hello, World!", x );
		return 0;
}



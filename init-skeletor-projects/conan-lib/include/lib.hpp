#pragma once

#include <stdint.h>

#include "samplelib_export.h"

#ifdef __cplusplus
extern "C"
{
#endif // __cplusplus

    SAMPLELIB_EXPORT int __stdcall score(const char* needle, const char *hayjack);

#ifdef __cplusplus
}
#endif // __cplusplus

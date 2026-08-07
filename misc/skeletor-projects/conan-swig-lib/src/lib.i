%module lib

%include "std_string.i"

%{
#include "lib_export.h"
#include "lib.h"
%}

%include "lib.h"

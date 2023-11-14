%module samplelib
 
%include "std_string.i"
%include "windows.i" 

%{
#include "samplelib_export.h"
#include "lib.h"
%}


#include "lib.h" 

/* File : example.i */
%module example
%{
#include "sample.h"
%}

extern double My_variable;
extern int    fact(int);
extern int    my_mod(int n, int m);
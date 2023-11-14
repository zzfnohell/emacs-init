%module lib
  
%include <windows.i>
%include <exception.i>
%import <std_string.i>
%import <std_vector.i>


%{
#include "lib.h"
%}

 
%exception {
  try {
    $action
  } catch (const std::exception& e) {
    SWIG_exception(SWIG_RuntimeError, e.what());
  }
}


namespace std
{
  %template(StringVector) vector<string>; 
}

%naturalvar LibOptions::instrument_list;

class LibOptions {
public:
    LibOptions() = default;
    ~LibOptions() = default;  
    void Print();
    std::vector<std::string> *GetInstrumentList();
    std::vector<std::string> instrument_list ;
};


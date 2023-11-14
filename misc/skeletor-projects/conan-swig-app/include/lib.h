#ifndef LIB_H
#define LIB_H

#include <memory>
#include <string>
#include <vector>
#include <list>

int factorial(const int number);

class LibOptions{
public:
    LibOptions() = default;
    virtual ~LibOptions() = default;
    void Print();
    std::vector<std::string>* GetInstrumentList();
    std::vector<std::string> instrument_list {"A","B"};
private:
};

#endif

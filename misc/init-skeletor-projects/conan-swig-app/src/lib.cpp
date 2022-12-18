#include "lib.h"
#include <iostream>
#include <string>
#include <memory>

using namespace std;

void LibOptions::Print()
{
    cout << "Lib Print Sample." << endl;
}

vector<string> *LibOptions::GetInstrumentList()
{
    return &instrument_list;
}

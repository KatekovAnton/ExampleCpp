#include <stdio.h>
#include <iostream>
#include <sstream>
#include <fstream>
#include <math.h>
#include <assert.h>
#include "Platform.h"

#if defined PROJECTN_TARGET_OS_WIN
int main()
#else
int main(int argc, char **argv)
#endif
{
    std::cout << "Hello world!" << std::endl;

    std::ifstream t("file.txt");
    if (t.fail()) {
        std::cout << "File does not exist!" << std::endl;
        return 1;
    }
    
    std::stringstream buffer;
    buffer << t.rdbuf();
    std::string str = buffer.str();
    std::cout << str << std::endl;
    return 0;
}

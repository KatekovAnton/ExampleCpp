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
    Platform *p = Platform::CurrentPlatform();
    
    std::cout << "Hello world!" << std::endl;
    
    std::string filePath = p->GetWorkingDir() + "/file.txt";
    
    std::cout << filePath << std::endl;
    
    if (std::filesystem::exists(filePath)) {
        std::filesystem::remove(filePath);
    }

    {
        std::ofstream writing;
        writing.open(filePath);
        if (!writing.is_open()) {
            int a = 0;
            a++;
        }
        std::string data = "some string to write";
        writing.write(data.c_str(), data.length());
        writing.flush();
        writing.close();
    }
    
    std::string str;
    
    {
        std::ifstream reading(filePath);
        if (reading.fail()) {
            std::cout << "File does not exist!" << std::endl;
            return 1;
        }
        std::stringstream buffer;
        buffer << reading.rdbuf();
        str = buffer.str();
    }
    
    std::cout << str << std::endl;
    return 0;
}

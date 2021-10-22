#include <stdio.h>
#include <iostream>
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
    
    return 0;
}

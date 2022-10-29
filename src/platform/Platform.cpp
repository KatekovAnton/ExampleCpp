//
//  Platform.cpp
//  DispatchCpp
//
//  Created by Katekov Anton on 29/11/20.
//  Copyright © 2020 AntonKatekov. All rights reserved.
//

#include "Platform.h"
#include <filesystem>



std::string Platform::GetWorkingDir()
{
    return std::filesystem::current_path().string();
}

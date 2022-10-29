//
//  Platform_mac.h
//  DispatchCpp
//
//  Created by Katekov Anton on 29/11/20.
//  Copyright © 2020 AntonKatekov. All rights reserved.
//

#ifndef Platform_mac_h
#define Platform_mac_h

#include "Platform.h"
#include <string>



class Platform_mac: public Platform {
    
    std::string _workingDir;
    
public:
    
    Platform_mac();
 
    std::string GetWorkingDir() override;
    
};

#endif /* Platform_mac_h */

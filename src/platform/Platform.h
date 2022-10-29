//
//  Platform.h
//  DispatchCpp
//
//  Created by Katekov Anton on 29/11/20.
//  Copyright © 2020 AntonKatekov. All rights reserved.
//

#ifndef Platform_h
#define Platform_h

#include <string>



class Platform {
    
public:
    
    static Platform *CurrentPlatform();
    
    virtual std::string GetWorkingDir();
    
};

#endif /* Platform_h */

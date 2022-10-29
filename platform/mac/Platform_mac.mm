//
//  Platform_mac.mm
//  DispatchCpp
//
//  Created by Katekov Anton on 29/11/20.
//  Copyright © 2020 AntonKatekov. All rights reserved.
//

#include "Platform_mac.h"
#include <mutex>
#import <Foundation/Foundation.h>



Platform *Platform::CurrentPlatform()
{
    static std::mutex m;
    static Platform *p = nullptr;
    if (p) {
        return p;
    }
    m.lock();
    if (p) {
        m.unlock();
        return p;
    }
    p = new Platform_mac();
    m.unlock();
    return p;
}

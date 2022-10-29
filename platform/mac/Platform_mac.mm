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

Platform_mac::Platform_mac()
{
    NSFileManager* fileManager = [[NSFileManager alloc] init];
    NSString* bundleID = [[NSBundle mainBundle] bundleIdentifier];
    NSArray* urlPaths = [fileManager URLsForDirectory:NSApplicationSupportDirectory
                                            inDomains:NSUserDomainMask];
    if (bundleID == nullptr) {
        bundleID = @"test_app";
    }
    NSURL* appDirectory = [[urlPaths objectAtIndex:0] URLByAppendingPathComponent:bundleID isDirectory:YES];
    
    //TODO: handle the error
    if (![fileManager fileExistsAtPath:[appDirectory path]]) {
        [fileManager createDirectoryAtURL:appDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    NSString *result = [appDirectory path];
    _workingDir = std::string(result.UTF8String);
}

std::string Platform_mac::GetWorkingDir() 
{
    return _workingDir;
}

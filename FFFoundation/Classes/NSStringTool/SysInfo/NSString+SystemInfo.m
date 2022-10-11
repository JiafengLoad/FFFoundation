//
//  NSString+systemInfo.m
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//

#import "NSString+SystemInfo.h"

//#define kiOSSystemVersionString [[UIDevice currentDevice] systemVersion]
//#define kiOSSystemVersionInt [[kiOSSystemVersionString stringByReplacingOccurrencesOfString:@"." withString:@""] integerValue]



@implementation NSString (SystemInfo)

+ (NSString*)sysName{
    NSString *sysName =[[UIDevice currentDevice] systemName];
    return sysName;
}

+ (NSString*)sysVersion{
    NSString *sysVersion = [[UIDevice currentDevice] systemVersion];
    return sysVersion;
}


+ (NSString*)sysNameAndVersion{
    NSString *sysName =[[UIDevice currentDevice] systemName];
    NSString *sysVersion = [[UIDevice currentDevice] systemVersion];
    NSString *sysNameAndVersion = [sysName stringByAppendingFormat:@"%@", sysVersion];
    return sysNameAndVersion;
}


@end

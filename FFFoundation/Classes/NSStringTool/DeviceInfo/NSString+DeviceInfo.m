//
//  NSString+DeviceInfo.m
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//

#import "NSString+DeviceInfo.h"
#import <sys/utsname.h>




@implementation NSString (DeviceInfo)

+ (NSString*)deviceUUID{
    NSString *deviceUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return deviceUUID;
}

+ (NSString*)deviceName{
    NSString *deviceName = [[UIDevice currentDevice] name];
    return deviceName;
}

+ (NSString*)deviceModel{
    NSString *deviceModel =  [[UIDevice currentDevice] model];
    return deviceModel;
}



+ (NSString*)deviceModelName{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //-------------------------------模拟器-----------------------------------//
    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    
    //-------------------------------手机-----------------------------------//
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,1"] ||
        [deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
    if ([deviceModel isEqualToString:@"iPhone10,2"] ||
        [deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,3"] ||
        [deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([deviceModel isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([deviceModel isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([deviceModel isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    if ([deviceModel isEqualToString:@"iPhone12,8"])   return @"iPhone SE 2";
    if ([deviceModel isEqualToString:@"iPhone13,1"])  return  @"iPhone 12 Mini";
    if ([deviceModel isEqualToString:@"iPhone13,2"])  return  @"iPhone 12";
    if ([deviceModel isEqualToString:@"iPhone13,3"])  return  @"iPhone 12 Pro";
    if ([deviceModel isEqualToString:@"iPhone13,4"])  return  @"iPhone 12 Pro Max";
    if ([deviceModel isEqualToString:@"iPhone14,1"])  return  @"iPhone 13 Mini";
    if ([deviceModel isEqualToString:@"iPhone14,2"])  return  @"iPhone 13";
    if ([deviceModel isEqualToString:@"iPhone14,3"])  return  @"iPhone 13 Pro";
    if ([deviceModel isEqualToString:@"iPhone14,4"])  return  @"iPhone 13 Pro Max";
    
    //-------------------------------iPod-----------------------------------//
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([deviceModel isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    if ([deviceModel isEqualToString:@"iPod9,1"])      return @"iPod Touch 7G";
    
    
    
    //-------------------------------pad-----------------------------------//
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceModel isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceModel isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceModel isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    if ([deviceModel isEqualToString:@"iPad6,11"])     return @"iPad 5 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad6,12"])     return @"iPad 5 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9-inch (WiFi)";
    if ([deviceModel isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9-inch (Cellular)";
    if ([deviceModel isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5-inch (WiFi)";
    if ([deviceModel isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5-inch (Cellular)";
    if ([deviceModel isEqualToString:@"iPad7,5"])      return @"iPad 6 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad7,6"])      return @"iPad 6 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad7,11"])     return @"iPad 7 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad7,12"])     return @"iPad 7 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad8,1"])      return @"iPad Pro 11-inch (WiFi)";
    if ([deviceModel isEqualToString:@"iPad8,2"])      return @"iPad Pro 11-inch (WiFi, 1TB)";
    if ([deviceModel isEqualToString:@"iPad8,3"])      return @"iPad Pro 11-inch (Cellular)";
    if ([deviceModel isEqualToString:@"iPad8,4"])      return @"iPad Pro 11-inch (Cellular, 1TB)";
    if ([deviceModel isEqualToString:@"iPad8,5"])      return @"iPad Pro 12.9-inch 3 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad8,6"])      return @"iPad Pro 12.9-inch 3 (WiFi, 1TB)";
    if ([deviceModel isEqualToString:@"iPad8,7"])      return @"iPad Pro 12.9-inch 3 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad8,8"])      return @"iPad Pro 12.9-inch 3 (Cellular, 1TB)";
    if ([deviceModel isEqualToString:@"iPad8,9"])      return @"iPad Pro 11-inch 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad8,10"])     return @"iPad Pro 11-inch 2 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad8,11"])     return @"iPad Pro 12.9-inch 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad8,12"])     return @"iPad Pro 12.9-inch 4 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad11,1"])     return @"iPad Mini 5 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad11,2"])     return @"iPad Mini 5 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad11,3"])     return @"iPad Air 3 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad11,4"])     return @"iPad Air 3 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad13,1"])     return @"iPad Air 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad13,2"])     return @"iPad Air 4 (Cellular)";
    
    //-------------------------------TV-----------------------------------//
    if ([deviceModel isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2";
    if ([deviceModel isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3";
    if ([deviceModel isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3";
    if ([deviceModel isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4";
    
    //-------------------------------AirPods-----------------------------------//
    if ([deviceModel isEqualToString:@"AirPods1,1"])      return @"AirPods";
    if ([deviceModel isEqualToString:@"AirPods2,1"])      return @"AirPods 2";
    if ([deviceModel isEqualToString:@"AirPods8,1"])      return @"AirPods Pro";
    
    if ([deviceModel isEqualToString:@"AudioAccessory1,1"])      return @"HomePod";
    if ([deviceModel isEqualToString:@"AudioAccessory1,2"])      return @"HomePod";
    if ([deviceModel isEqualToString:@"AudioAccessory5,1"])      return @"HomePod mini";
    
    
    
    return deviceModel;
}





@end

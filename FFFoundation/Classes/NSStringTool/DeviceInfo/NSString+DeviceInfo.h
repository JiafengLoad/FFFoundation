//
//  NSString+DeviceInfo.h
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//




#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DeviceInfo)

/// 获取设备唯一标识符 例如：FBF2306E-A0D8-4F4B-BDED-9333B627D3E6
+ (NSString*)deviceUUID;

/// 获取设备名称 例如：梓辰的手机
+ (NSString*)deviceName;

/// 获取设备的型号 例如：iPhone
+ (NSString*)deviceModel;

/// 获取设备的具体型号 例如：iPhone11
+ (NSString*)deviceModelName;








@end

NS_ASSUME_NONNULL_END

//
//  NSString+systemInfo.h
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SystemInfo)

/// 获取系统名称 例如：iOS
+ (NSString*)sysName;

/// 获取系统版本 例如：9.2
+ (NSString*)sysVersion;


/// 获取系统名称和版本 例如iOS 13.2.2
+ (NSString*)sysNameAndVersion;


@end

NS_ASSUME_NONNULL_END

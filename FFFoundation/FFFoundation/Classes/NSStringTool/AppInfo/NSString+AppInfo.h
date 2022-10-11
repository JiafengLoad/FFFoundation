//
//  NSString+AppInfo.h
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (AppInfo)


/// app版本号
+ (NSString *)appVersion;

/// app build号
+ (NSString *)appBuildVersion;

/// app名称
+ (NSString *)appName;


/// app在商店的版本
//+ (NSString *)appleStoreAppVersion;

@end

NS_ASSUME_NONNULL_END

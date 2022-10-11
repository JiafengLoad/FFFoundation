//
//  NSString+Number.h
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Number)


/// 生成随机数
+ (NSString *)arc4randomToken;


/// 最多保留两位小数
/// @param number 需要传入的带两位小数的字符串
- (NSString *)filterDotWithNumber:(NSString *)number;





@end

NS_ASSUME_NONNULL_END

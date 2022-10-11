//
//  NSDictionary+Log.h
//  UIKit
//
//  Created by Aubrey on 2019/12/28.
//  Copyright © 2019 Aubrey. All rights reserved.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Log)

/**
 打印数组
 */
- (NSString*)descriptionWithLocale:(id)locale indent:(NSUInteger)level;

@end

NS_ASSUME_NONNULL_END

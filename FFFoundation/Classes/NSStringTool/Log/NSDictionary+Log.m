//
//  NSDictionary+Log.m
//  UIKit
//
//  Created by Aubrey on 2019/12/28.
//  Copyright © 2019 Aubrey. All rights reserved.
//

#import "NSDictionary+Log.h"


@implementation NSDictionary (Log)

- (NSString*)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
  
    NSMutableString *string  = [NSMutableString string];
    
    //拼接
    [string appendString:@"{"];
    //加入键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [string appendFormat:@"%@",key];
        [string appendFormat:@":%@",obj];
    }];
    //拼接
    [string appendString:@"}"];
    
    //删除字典最后一对键值对后面的逗号
    NSRange range  = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        [string deleteCharactersInRange:range];
    }
    return string;
    
}


@end

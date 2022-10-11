//
//  NSArray+Log.m
//  UIKit
//
//  Created by Aubrey on 2019/12/28.
//  Copyright © 2019 Aubrey. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

- (NSString*)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    
    NSMutableString *string = [NSMutableString string];
    //拼接[
    [string appendString:@"["];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [string appendFormat:@"%@,\n",obj];
    }];
    [string appendString:@"]"];
    
   //删除数组最后一个值后面的逗号
    NSRange range  = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        [string deleteCharactersInRange:range];
    }
    return string;
        
}


@end

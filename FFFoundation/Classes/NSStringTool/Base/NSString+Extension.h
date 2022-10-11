//
//  NSString+Extension.h
//  01-QQ聊天布局
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

/// 【开头】判断字符串是否以某个字符串开头
/// @param string 要验证是否开头的那个字符串
-(BOOL)isBeginsWith:(NSString *)string;


/// 【结尾】判断字符串是否以某个字符串结尾
/// @param string 要验证是否结尾的那个字符串
-(BOOL)isEndsWith:(NSString *)string;


/// 【包含】判断字符串是否包含某个字符串
/// @param subString 要验证是否包含的那个字符串
-(BOOL)containsString:(NSString *)subString;


/// 【添加】在主字符串末尾，添加字符串
/// @param string 要添加的字符串
-(NSString *)addString:(NSString *)string;


/// 【移除】在主字符串中，移除某个字符串
/// @param subString 要移除的文字
-(NSString *)removeSubString:(NSString *)subString;


/// 【截取】截取字符串
/// @param begin 开始截取的位置
/// @param end 停止截取的位置
-(NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;


/// 【替换】新字符串替换老字符串
/// @param olderChar 旧的字符串
/// @param newerChar 新的字符串
-(NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;


/// 【分割】分割字符串
/// @param seperateStr 以某个字符串为分隔符
- (NSArray *)seperateStringWithSeparator:(NSString *)seperateStr;


//【包含】
/// 判断字符串是否只包含字母
-(BOOL)containsOnlyLetters;
/// 判断字符串是否只包含数字
-(BOOL)containsOnlyNumbers;
/// 判断字符串是否只包含数字和字母
-(BOOL)containsOnlyNumbersAndLetters;



/// 获取某个字符在字符串中的位置和长度
/// @param string 指定的字符串
/// @param totalString 整个字符串
+ (NSRange)rangeOfString:(NSString*)string inTotalString:(NSString*)totalString;


//计算字符串中整数的个数
+ (int)CountNumberOfStrings:(NSString *)str;
- (int)CountNumberOfStrings;


//根据字符串长度获取字符串尺寸
- (CGSize)textSizeWithFont:(UIFont *)font
               constrainedToSize:(CGSize)size;



//把数组变成json数据
//+ (NSString *)jf_jsonStringCompactFormatForNSArray:(NSArray *)arrJson;






@end




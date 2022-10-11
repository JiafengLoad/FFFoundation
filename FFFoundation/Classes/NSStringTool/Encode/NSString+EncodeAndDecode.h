//
//  NSString+EncodeAndDecode.h
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSString (EncodeAndDecode)


#warning 对于emoji，😈发送给后台时要编码，拿到数据使用使要解码
/// emoji编码
- (NSString*)emojiEncodeing:(NSString*)string;
/// emoji解码
- (NSString*)emojiUncodeing:(NSString*)string;



/// URL编码
/// @param encodeString 要编码的URL
+ (NSString *)URLEncodedString:(NSString*)encodeString;
/// URL解码
/// @param decodeString 要解码的URL
+ (NSString *)URLDecodedString:(NSString*)decodeString;


/// MD5编码
/// @param str 要编码的URL
- (NSString *)MD5ForUpper16Bate:(NSString *)str;
/// MD5编码
/// @param str 要编码的URL
- (NSString *)MD5ForUpper32Bate:(NSString *)str;


- (NSString *)md5To32bit:(NSString *)input;

/// 64编码
/// @param str 要编码的字符串
+ (NSString*)base64Encode:(NSString*)str;
/// 64解码
/// @param str 要解码的字符串
+ (NSString*)base64Decode:(NSString*)str;


@end

NS_ASSUME_NONNULL_END

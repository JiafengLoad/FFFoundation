//
//  NSString+EncodeAndDecode.m
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//

#import "NSString+EncodeAndDecode.h"


#import <CommonCrypto/CommonDigest.h>


@implementation NSString (EncodeAndDecode)


#pragma mark -emoji编解码
//emoji编码
- (NSString*)emojiEncodeing:(NSString*)string{
    //编码
    NSData *encodeData = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [encodeData base64EncodedStringWithOptions:0];
}
//emoji解码
- (NSString*)emojiUncodeing:(NSString*)string{
    //解码
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:string options:0];
    return [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
}

#pragma mark -URL编解码(当含有中文的时候，只有GET请求需要转码，因为POST的参数放在请求体中)
// URL编码
+(NSString *)URLEncodedString:(NSString*)encodeString{
    
     return (NSString *)CFBridgingRelease((__bridge CFTypeRef _Nullable)([[encodeString description] stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@"!*'();:@&=+$,/?%#[]"] invertedSet]]));

}
//URL解码
+ (NSString *)URLDecodedString:(NSString*)decodeString{

return (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapes(kCFAllocatorDefault, (CFStringRef)decodeString, CFSTR("")));
}


#pragma mark - MD5加密、解密
//加密 16位 大写
- (NSString *)MD5ForUpper16Bate:(NSString *)str{
    
    NSString *md5Str = [self MD5ForUpper32Bate:str];
    
    NSString *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}
////加密16为小写
//- (NSString *)md5HashToLower16Bit {
//     NSString *md5Str = [self md5To32bit];
//
//     NSString *string;
//     for (int i=0; i<24; i++) {
//        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
//      }
//
//    return string;
//}


//加密 32位 大写
- (NSString *)MD5ForUpper32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    return digest;
}
//加密32小写
- (NSString *)md5To32bit:(NSString *)input {

    const char* str = [input UTF8String];

    unsigned char result[CC_MD2_DIGEST_LENGTH];

    CC_MD5(str, (CC_LONG)strlen(str), result);

     NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];

      for(int i = 0; i<CC_MD2_DIGEST_LENGTH;i++){

          [ret appendFormat:@"%02x",result[i]];

       }

      return ret;

}





#pragma mark -64加密、解密
+ (NSString*)base64Encode:(NSString*)str {

    // 1.把字符串转成二进制数据
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];

    // 2.将二进制进行base64加密(编码)
    return [data base64EncodedStringWithOptions:0];

}
// base64解码
+ (NSString*)base64Decode:(NSString*)str {

    // 1.先把base64编码后的字符串转成二进制数据
    NSData* data = [[NSData alloc] initWithBase64EncodedString:str options:0];

    // 2.把data转成字符串
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}



@end

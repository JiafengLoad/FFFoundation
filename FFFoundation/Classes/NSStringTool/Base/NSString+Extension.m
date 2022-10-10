//
//  NSString+Extension.m
//  01-QQ聊天布局
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NSString+Extension.h"


@implementation NSString (Extension)


#pragma mark 字符串基本处理
//【开头】判断字符串是否以某个字符串开头
-(BOOL)isBeginsWith:(NSString *)string{
    return ([self hasPrefix:string]) ? YES : NO;
}

//【结尾】判断字符串是否以某个字符串结尾
-(BOOL)isEndsWith:(NSString *)string{
    return ([self hasSuffix:string]) ? YES : NO;
}

//【包含】判断字符串是否包含某个字符串
-(BOOL)containsString:(NSString *)subString{
    return ([self rangeOfString:subString].location == NSNotFound) ? NO : YES;
}

//【添加】在主字符串末尾，添加字符串
-(NSString *)addString:(NSString *)string{
    if(!string || string.length == 0){
        return self; //如果添加的字符串为空，那么返回值还是调用者其本身
    }
    return [self stringByAppendingString:string];
}

//【移除】在主字符串中，移除某个字符串
-(NSString *)removeSubString:(NSString *)subString{
  
    if ([self containsString:subString]){  //移除某个字符串的前提，是包含该字符串
        NSRange range = [self rangeOfString:subString];
        return  [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}

//【截取】截取字符串
-(NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end{
    NSRange r;
    r.location = begin;      //开始截取的字符串所在的位置
    r.length = end - begin;//开始的位置数到截取到的数的长度
    return [self substringWithRange:r];
}

//【替换】新字符串替换老字符串
-(NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar{
    return  [self stringByReplacingOccurrencesOfString:olderChar withString:newerChar];
}
//【分割】分割字符串
- (NSArray *)seperateStringWithSeparator:(NSString *)seperateStr{
    NSArray *arr = [self componentsSeparatedByString:seperateStr];
    return  arr; //返回值为数组，数组中放两个字符串
}


//【包含】 判断字符串是否只包含字母
-(BOOL)containsOnlyLetters{
    NSCharacterSet *letterCharacterset = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:letterCharacterset].location == NSNotFound);
}

//判断字符串是否只包含数字
-(BOOL)containsOnlyNumbers{
    NSCharacterSet *numbersCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbersCharacterSet].location == NSNotFound);
}

//判断字符串是否只包含数字和字母
-(BOOL)containsOnlyNumbersAndLetters{
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}


//计算字符串中整数的个数
+ (int)CountNumberOfStrings:(NSString *)str{
    int count = 0;
    for (int i = 0; i < str.length; i++) {
        int temp = [str characterAtIndex:i];
        if (temp > '0' && temp < '9') {
            count++;
        }
    }
    return count;
}
- (int)CountNumberOfStrings{
    return [NSString CountNumberOfStrings:self];
}


//获取字符串尺寸
- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{

    CGSize textSize;

    if (CGSizeEqualToSize(size, CGSizeZero)) {
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        textSize = [self sizeWithAttributes:attributes];
        textSize = CGSizeMake(floor(size.width), floor(size.height));
   }
    else {
    NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
//NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（译者注：字体大小+行间距=行高）
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    
    CGRect rect = [self boundingRectWithSize:size options:option attributes:attributes context:nil];
    textSize = rect.size;
    
    //注意：当字符串同时存在@和&字符时，使用NSStringDrawingUsesLineFragmentOrigin时rect会变为零
    if (CGSizeEqualToSize(textSize, CGSizeZero)) {
        option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading;
        rect = [self boundingRectWithSize:size options:option attributes:attributes context:nil];
        textSize = rect.size;
    }
}
    return textSize;
}


/// 获取某个字符（串）在字符串中的位置和长度
/// @param string 指定的字符串
/// @param totalString 整个字符串
+ (NSRange)rangeOfString:(NSString*)string inTotalString:(NSString*)totalString{
    
    NSRange range = [totalString rangeOfString:string];

    if (range.location != NSNotFound) {
         NSLog(@"found at location = %lu, length = %lu",(unsigned long)range.location,(unsigned long)range.length);
         return range;
    }else{
        NSLog(@"Not Found");
        return range;
    }
    
}



#pragma 是否是手机号
//- (BOOL)isMobileNumber{

//    NSString * phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
//     NSString *emailRegex = @"^1(3[0-9]|4[56789]|5[0-9]|6[6]|7[0-9]|8[0-9]|9[89])\\d{8}$";
//    BOOL isMatch = [self isMatchedByRegex:emailRegex];
//    return isMatch;
//}
//- (BOOL)isEmail{
//    BOOL matchEmail = [self isMatchedByRegex:@"^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$"];
//    return matchEmail;
//}




//+ (NSString *)jf_jsonStringCompactFormatForNSArray:(NSArray *)arrJson{
//
//   if (![arrJson isKindOfClass:[NSArray class]] || ![NSJSONSerialization isValidJSONObject:arrJson]) {
//
//      return nil;
//
//    }
//
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrJson options:0 error:nil];
//
//    NSString *strJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//
//   return strJson;
//
//}

@end

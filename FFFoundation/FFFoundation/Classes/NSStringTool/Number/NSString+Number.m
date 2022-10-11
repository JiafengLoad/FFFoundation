//
//  NSString+Number.m
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//

#import "NSString+Number.h"
#import "NSString+Extension.h"




@implementation NSString (Number)


//生成随机数
+ (NSString *)arc4randomToken {
    
    NSArray *textArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
    
    NSString *str;
    
    for(NSInteger i = 0; i < 8; i++)
    {
        NSInteger index = arc4random() % ([textArray count] - 1);
        NSString *oneText = [textArray objectAtIndex:index];
        str = (i==0)?oneText:[str stringByAppendingString:oneText];
    }
    
    return str;
}

//最多保留两位小数
- (NSString *)filterDotWithNumber:(NSString *)number{
    
    NSString *numberStr= number;
    
    //传进来的时候就已经是两位小数了 1.012  1.101
    NSLog(@"%@",number);
    
    if ( [number containsString:@"."] ) {
        //切割第一次
        NSArray *str_arr_one = [number seperateStringWithSeparator:@"."];  //1和00
        NSString *temp_one = str_arr_one.lastObject;
        
        //十分位和百分位都是0，切割第一次
        if ([temp_one isEqualToString:@"00"] ) {
            numberStr =  str_arr_one.firstObject;  //末尾为00，则数量则为整数
        }else{
            //十分位不为0 ，百分位为0，需要切割第二次，并进行拼接
            NSLog(@"%@",temp_one);
            NSString *lastStr = [temp_one getSubstringFrom:1 to:2];
            if ([lastStr isEqualToString:@"0"]) {
                
                NSString *tempstr = [temp_one getSubstringFrom:0 to:1]; //十分位小数
                NSString *str  = [str_arr_one.firstObject addString:@"."]; //整数位+小数点
                NSString *finalStr  = [str addString:tempstr]; //整数位+小数点+十分位
                numberStr  =finalStr;
                
            }
            else{
                numberStr  =number;
            }
            
            NSLog(@"%@",lastStr);
            
        }
        
    }
    else{  }
    
    return numberStr;
}




@end

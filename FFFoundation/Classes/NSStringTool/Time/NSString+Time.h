//
//  NSString+Time.h
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger,TimeType) {
     TimeType_year =0,     //年
     TimeType_months=2, //月
     TimeType_day=3,      //日
     TimeType_hour = 4,   //时
     TimeType_min = 5,  //分
     TimeType_sec = 6,  //秒
};


@interface NSString (Time)


//---------------------------------时间格式转换-----------------------------------------//


/// NSString-->NSDate  时间字符串转换成时间NSDate
/// @param dateStr 时间字符串
/// @param format 转换格式
+ (NSDate *)getDateWithDateString:(NSString *)dateStr withFormat:(NSString *)format;


/// NSDate -> NSString  NSDate转换成时间字符串
/// @param date NSDate日期
/// @param format 转换格式
+ (NSString *)getDateStringWithDate:(NSDate*)date withFormat:(NSString*)format;

//-----------------------------------时间戳--------------------------------------//

/// NSDate-->NSString  将时间NSDate转换成的时间戳
/// @param date 将时间NSDate转换成时间戳
+ (long long )getTimeStampWithDate:(NSDate*)date;

/// NSString-->NSString 将时间戳转时间字符串
/// @param timeStamp 时间戳
+ (NSString*)getTimeStringWithTimeStamp:(NSString*)timeStamp format:(NSString*)format;

//-----------------------------------推算具体时间--------------------------------------//

/// 当前时间NSString
/// @param format 时间格式
+(NSString*)getCurrentTimeStringWithFormat:(nullable NSString*)format;

/// 获取当前时间往前,或往后推几天、几个月、几年的时间
/// @param num 往前、后推的数量
/// @param timeType 年、月、日
+ (NSString*)getTimeWithNum:(CGFloat)num StartDate:(NSDate*)startDate withTimeType:(TimeType)timeType format:(NSString *)format;


//-----------------------------------其他--------------------------------------//
/// 有效时间
/// @param deadline 有效的时间数，比如有效的秒数
+ (NSInteger)refreshTimeStampWithDeadline:(NSString *)deadline;


/// 转换后的时间字符串NSString
/// @param publishTime 社交类软件的时间转换
- (NSString*)coverPublicTime2Des:(NSInteger)publishTime;


//
//- (void)startLongLongStartStamp:(long long)strtLL longlongFinishStamp:(long long)finishLL;

//+ (void)countDownWithStratTimeStamp:(long long)starTimeStamp finishTimeStamp:(long long)finishTimeStamp completeBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))completeBlock;

@end

NS_ASSUME_NONNULL_END

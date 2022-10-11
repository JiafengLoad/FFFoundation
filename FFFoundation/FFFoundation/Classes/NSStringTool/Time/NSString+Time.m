//
//  NSString+Time.m
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//

#import "NSString+Time.h"



@implementation NSString (Time)

//---------------------------------时间格式转换-----------------------------------------//

/// NSString-->NSDate  时间字符串转换成时间NSDate
/// @param dateStr 时间字符串
/// @param format 转换格式
+(NSDate *)getDateWithDateString:(NSString *)dateStr withFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format]; //YYYY-MM-dd HH:mm:ss
  
    //设置时区  全球标准时间CUT 必须设置 我们要设置中国的时区
    NSTimeZone *zone = [[NSTimeZone alloc] initWithName:@"CUT"];
    [dateFormatter setTimeZone:zone];
                        
    NSDate *datestr = [dateFormatter dateFromString:dateStr];
    return datestr;
}

/// NSDate -> NSString  NSDate转换成时间字符串
/// @param date NSDate日期
/// @param format 转换格式
+ (NSString *)getDateStringWithDate:(NSDate*)date withFormat:(NSString*)format{
    //获取当前时间
//    NSDate *date = [NSDate date];
    //设置日期格式
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];//设置时区，北京时间(东八区)
    [formatter setTimeZone:timeZone];
    
    //变为数字
    NSString* str = [formatter stringFromDate:date];
    NSLog(@"dateString = %@",str);
    
    return str;
}


//-----------------------------------时间戳--------------------------------------//

/// 时间戳-->字符串 转换好的时间
/// @param timeStamp 时间戳
+ (NSString*)getTimeStringWithTimeStamp:(NSString*)timeStamp format:(NSString*)format{
    
    NSTimeInterval interval = [timeStamp doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateString = [formatter stringFromDate: date];
    
    return dateString;
}

/// 字符串-->时间戳
/// @param date 将时间NSDate转换成时间戳
+ (long long)getTimeStampWithDate:(NSDate*)date{
    long long timeSp =  (long)[date timeIntervalSince1970]*1000;
    return timeSp;
}





//-----------------------------------推算具体时间--------------------------------------//
//获取当前时间
+(NSString*)getCurrentTimeStringWithFormat:(nullable NSString*)format{
    //获取系统当前时间
    NSDate *currentDate = [NSDate date];
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    if (format==nil || !format) {
        format = @"YYYY-MM-dd HH:mm:ss";
    }
    [dateFormatter setDateFormat:format];   //HH:mm:ss   //@"YYYY-MM-dd HH:mm:ss"
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    //输出currentDateString
    return currentDateString;
}


/// 时间字符串
/// @param num 推算的数量，比如+1就是往后推算，-1就是往前推算
/// @param timeType 类型，看是年，还是月，还是日
/// @param format 格式
+ (NSString*)getTimeWithNum:(CGFloat)num StartDate:(NSDate*)startDate withTimeType:(TimeType)timeType format:(NSString *)format{
    
    //开始推算的时间点
    NSDate *startDatee;
    if (startDate) {
        startDatee  = startDate;
    }else{//没传入开始时间，默认开始时间为当前时间
         startDatee = [NSDate date];
    }
    

    //日历
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *lastDateComps = [[NSDateComponents alloc] init];
    
    //当前日期字符串
//     NSString *nowDateStr = [self getCurrentTimeStringWithFormat:format];
    
    if (timeType ==TimeType_day ) { //日
         [lastDateComps setDay:num];
    }
    else if (timeType ==TimeType_months ){ //月
         [lastDateComps setMonth:num];
    }
    else if(timeType ==TimeType_day){ //年
         [lastDateComps setYear:num];// year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    }
    else if (timeType ==TimeType_hour){ //时
        [lastDateComps setHour:num];
    }
    else if (timeType ==TimeType_min){
          [lastDateComps setMinute:num]; //分
    }
    else if (timeType ==TimeType_sec){
        [lastDateComps setSecond:num]; //秒
    }
    else{
        
    }
    
    NSDate *newdate = [calendar dateByAddingComponents:lastDateComps toDate:startDatee options:0];
    NSString *finalDateStr = [self getDateStringWithDate:newdate withFormat:format];

    return finalDateStr;
 
}




//-----------------------------------其他--------------------------------------//

//刷新有效时间的时间戳
+ (NSInteger)refreshTimeStampWithDeadline:(NSString *)deadline {
    
    
    //1、获取【现在时间】，并设置现在时间的时区、外加转换格式
    //获取现在时间
     NSDate *dateNow = [NSDate date];

     NSString *currentTimeString = [self getDateStringWithDate:dateNow withFormat:@"YYYY-MM-dd HH:mm:ss"];
     NSLog(@"设备当前的时间:%@",currentTimeString );
    
    //2、从defaults中获取“时间戳”【有效的截止时间】并转换时间戳的格式
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *endTime = [userDefault valueForKey:deadline];
    NSLog(@"授权码有效时间截止至：%@",endTime);
    
    
    //3、获取【有效时间】 = 现在时间——截止时间 ，并转换有效时间的格式
    NSDate* dateEnd = [NSDate dateWithTimeIntervalSince1970:[endTime doubleValue]];//截止时间
    NSLog(@"%@",dateEnd);
    
    NSString *dateString = [self getDateStringWithDate:dateEnd withFormat:@"YYYY-MM-dd HH:mm:ss"];//转化格式
    NSLog(@"授权码有效时间:%@",dateString);
    
    
    //4、输出将在 XX 秒之后失效
    NSTimeInterval seconds = [dateEnd timeIntervalSinceDate:dateNow];
    NSInteger sec = seconds;
    NSLog(@"授权码将在：%ld s 后失效", (long)sec);
    return sec;
    
    
}

//社交类软件的时间转换
- (NSString*)coverPublicTime2Des:(NSInteger)publishTime{
    NSInteger currentTime = [[NSDate date] timeIntervalSince1970];
    NSInteger tmp = currentTime - publishTime; //当前时间-发布时间
 
    //    X秒前，X分钟前，X小时前，X天前，X个月前，X年前
    NSString *des = @"";
    NSInteger one_second = 1; //一秒钟
    NSInteger one_minute = 60*1;  //一分钟
    NSInteger one_hour = 60*60 *1; //一小时
    NSInteger one_day= 60*60 *1*24;  //一天24小时
    NSInteger one_month = 60*60 *1*24*30; //一个月
    NSInteger one_year = 60*60*24*30*12; //一年
 

    if (tmp < one_minute) {
        NSInteger time =  tmp/one_second;
        des = [NSString stringWithFormat:@"%ld秒前",(long)time];
    }
    else if (tmp >= one_minute && tmp < one_hour){
        NSInteger time =  tmp/one_minute;
        des = [NSString stringWithFormat:@"%ld分钟前",(long)time];
    }
    else if (tmp >= one_hour && tmp < one_day){
        NSInteger time =  tmp/one_hour;
        des = [NSString stringWithFormat:@"%ld小时前",(long)time];
    }
    else if (tmp >= one_day && tmp < one_month){
        NSInteger time =  tmp/one_day;
        des = [NSString stringWithFormat:@"%ld天前",(long)time];
    }
    else if (tmp >= one_month && tmp < one_year){
        NSInteger time =  tmp/one_month;
        des = [NSString stringWithFormat:@"%ld个月前",(long)time];
    }
    else if (tmp >= one_year){
         NSInteger time =  tmp/one_year;
        des = [NSString stringWithFormat:@"%ld年前",(long)time];
    }
    else{
        des = @"暂时没有";
    }
    return des;
}


//抢购类倒计时转换


///用时间戳倒计时
//+ (void)countDownWithStratTimeStamp:(long long)starTimeStamp finishTimeStamp:(long long)finishTimeStamp completeBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))completeBlock{
//    
//    dispatch_source_t timer_t;
//
//    if (timer_t==nil) {
//          NSDate *finishDate = [NSString dateWithLongLong:finishTimeStamp];
//          NSDate *startDate  = [NSString dateWithLongLong:starTimeStamp];
//          NSTimeInterval timeInterval =[finishDate timeIntervalSinceDate:startDate];
//          __block int timeOut = timeInterval; //倒计时时间
//          if (timeOut!=0) {
//              dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//              timer_t = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
//              dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
//              dispatch_source_set_event_handler(timer, ^{
//                  if(timeOut<=0){ //倒计时结束，关闭
//                      dispatch_source_cancel(timer);
////                      timer = nil;
//                      dispatch_async(dispatch_get_main_queue(), ^{
//                          completeBlock(0,0,0,0);
//                      });
//                  }else{
//                      int days = (int)(timeOut/(3600*24));
//                      int hours = (int)((timeOut-days*24*3600)/3600);
//                      int minute = (int)(timeOut-days*24*3600-hours*3600)/60;
//                      int second = timeOut-days*24*3600-hours*3600-minute*60;
//                      dispatch_async(dispatch_get_main_queue(), ^{
//                          completeBlock(days,hours,minute,second);
//                      });
//                      timeOut--;
//                  }
//              });
//              dispatch_resume(timer_t);
//          }
//      }
//}
//
//+ (NSDate *)dateWithLongLong:(long long)longlongValue{
//    long long value = longlongValue/1000;
//    NSNumber *time = [NSNumber numberWithLongLong:value];
//    //转换成NSTimeInterval,用longLongValue，防止溢出
//    NSTimeInterval nsTimeInterval = [time longLongValue];
//    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:nsTimeInterval];
//    return date;
//}


@end

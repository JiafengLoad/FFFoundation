//
//  NSString+AppInfo.m
//  UIKit
//
//  Created by Aubrey on 2019/11/23.
//  Copyright © 2019 Aubrey. All rights reserved.
//

#import "NSString+AppInfo.h"


@implementation NSString (AppInfo)

+ (NSString *)appVersion{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return appVersion;
}
+ (NSString *)appBuildVersion{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appBuildVersion = [infoDic objectForKey:@"CFBundleVersion"];
     return appBuildVersion;
}
+ (NSString *)appName{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [infoDic objectForKey:@"CFBundleDisplayName"]; // 获取App的名称
    return appName;
}


//
//+(NSString*)appleStoreAppVersion{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//      [manager POST:@"https://itunes.apple.com/lookup?id=414478124" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//          NSArray *array = responseObject[@"results"];
//          NSDictionary *dict = [array lastObject];
//          NSLog(@"当前版本为：%@", dict[@"version"]);
//      } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//          [SVProgressHUD showErrorWithStatus:@"请求失败！" ];
//      }];
//}

@end

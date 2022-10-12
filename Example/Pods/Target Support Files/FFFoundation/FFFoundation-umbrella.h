#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSString+AppInfo.h"
#import "NSString+Extension.h"
#import "NSString+DeviceInfo.h"
#import "NSArray+Log.h"
#import "NSDictionary+Log.h"
#import "NSString+Number.h"
#import "NSString+SystemInfo.h"

FOUNDATION_EXPORT double FFFoundationVersionNumber;
FOUNDATION_EXPORT const unsigned char FFFoundationVersionString[];


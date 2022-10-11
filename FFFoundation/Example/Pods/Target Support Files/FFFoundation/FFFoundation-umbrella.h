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
#import "NSMutableAttributedStringTool.h"
#import "NSString+Extension.h"
#import "NSString+DeviceInfo.h"
#import "NSString+EncodeAndDecode.h"
#import "NSArray+Log.h"
#import "NSDictionary+Log.h"
#import "NSStringTool.h"
#import "NSString+Number.h"
#import "NSString+SystemInfo.h"
#import "NSString+Time.h"

FOUNDATION_EXPORT double FFFoundationVersionNumber;
FOUNDATION_EXPORT const unsigned char FFFoundationVersionString[];


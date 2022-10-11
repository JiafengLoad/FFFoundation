//
//  NSMutableAttributedStringTool.h
//  UIKit
//
//  Created by Aubrey on 2019/11/22.
//  Copyright © 2019 Aubrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedStringTool : NSObject

@property(nonatomic,strong,readonly)NSMutableAttributedString *attributedStr;


/// 富文本属性--字体
/// @param string label的整个字符串
/// @param font   要显示的富文本的字体
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForFontWithString:(NSString*)string font:(UIFont*)font Range:(NSRange)range;


///  富文本属性--字间距
/// @param string label的整个字符串
/// @param columnSpace 字间距
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForKernWithString:(NSString*)string columnDistance:(CGFloat)columnSpace Range:(NSRange)range;


///  富文本属性--行间距、段落之间间距
/// @param string label的整个字符串
/// @param lineSpacing 行间距
/// @param paragraphSpacing 段间距
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForParaStyleWithString:(NSString*)string lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing Range:(NSRange)range textAligement:(NSTextAlignment)textAligement;


/// 富文本属性--删除线（穿透线）
/// @param string label的整个字符串
/// @param lineColor 中划线颜色
/// @param lineStyle 线的样式
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForStrikethroughStyleWithString:(NSString*)string lineColor:(UIColor*)lineColor lineStyle:(NSUnderlineStyle)lineStyle Range:(NSRange)range;


/// 富文本属性--下划线
/// @param string label的整个字符串
/// @param lineColor 下划线颜色
/// @param lineStyle 线的样式
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForUnderlineStyleWithString:(NSString*)string lineColor:(UIColor*)lineColor lineStyle:(NSUnderlineStyle)lineStyle Range:(NSRange)range;



///  富文本属性--前景颜色
/// @param string label的整个字符串
/// @param foregroundColor 前景颜色
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForForegroundColorWithString:(NSString*)string foregroundColor:(UIColor*)foregroundColor Range:(NSRange)range;


///  富文本属性--背景颜色
/// @param string label的整个字符串
/// @param backgroundColor 背景颜色
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForBackgroundColorWithString:(NSString*)string backgroundColor:(UIColor*)backgroundColor Range:(NSRange)range;


///  富文本属性--文字倾斜量
/// @param string label的整个字符串
/// @param obliqueness 文字倾斜量
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForObliquenessWithString:(NSString*)string obliqueness:(CGFloat)obliqueness Range:(NSRange)range;


///  富文本属性--文字扩张
/// @param string label的整个字符串
/// @param expansion 文字扩张量
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForExpansionWithString:(NSString*)string expansion:(CGFloat)expansion Range:(NSRange)range;


///  富文本属性--画空心文字
/// @param string label的整个字符串
/// @param strokeColor 文字扩张量
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForStrokeWithString:(NSString*)string strokeColor:(UIColor*)strokeColor  strokeWidth:(CGFloat)strokeWidth Range:(NSRange)range;


/// 富文本属性--画阴影字
/// @param string label的整个字符串
/// @param shadowColor 阴影颜色
/// @param shadowBlurRadius 阴影圆角
/// @param shadowOffset 阴影偏移量
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForShadowWithString:(NSString*)string shadowColor:(UIColor*)shadowColor  shadowBlurRadius:(CGFloat)shadowBlurRadius shadowOffset:(CGSize)shadowOffset Range:(NSRange)range;


/// 富文本属性--文字效果(很少会用到,没啥卵用)
/// @param string label的整个字符串
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForTextEffectWithString:(NSString*)string Range:(NSRange)range;


/// 富文本属性--连字符（很少会用到,没啥卵用）
/// @param string label的整个字符串
/// @param number 传0或者1 （0表示没有连字符，而1是默认的连字符。）
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForLigatureWithString:(NSString*)string number:(NSNumber*)number Range:(NSRange)range;



/// 富文本属性--跳转链接
/// @param string label的整个字符串
/// @param urlString urlString 跳转链接要实现UITextView的这个委托方法 extView shouldInteractWithURL:
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForLinkWithString:(NSString*)string urlString:(NSString*)urlString Range:(NSRange)range;



/// 富文本属性--图文混排
/// @param string label的整个字符串
/// @param image 要插入的图片
/// @param attachBounds 图片附件的尺寸
/// @param index 要插入图片的位置
- (void)setAttributedStringForTextAttachmentWithString:(NSString*)string image:(UIImage*)image attachBounds:(CGRect)attachBounds index:(NSUInteger)index;


//首行缩进两字符
- (void)setAttributeStringWithString:(NSString *)string font:(UIFont *)font;



-(NSString *)filterHTML:(NSString *)html;

@end

NS_ASSUME_NONNULL_END

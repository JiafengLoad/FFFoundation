//
//  NSMutableAttributedStringTool.m
//  UIKit
//
//  Created by Aubrey on 2019/11/22.
//  Copyright © 2019 Aubrey. All rights reserved.
//

#import "NSMutableAttributedStringTool.h"



@interface NSMutableAttributedStringTool ()

@property(nonatomic,strong,readwrite)NSMutableAttributedString *attributedStr;

@end

@implementation NSMutableAttributedStringTool


- (NSMutableAttributedString *)attributedStr{
    if (!_attributedStr) {
        _attributedStr = [[NSMutableAttributedString alloc] init];
    }
    return _attributedStr;
}




/// 富文本属性--字体
/// @param string label的整个字符串
/// @param font   要显示的富文本的字体
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForFontWithString:(NSString*)string font:(UIFont*)font Range:(NSRange)range{
    
    //创建富文本
    NSMutableAttributedString *fontAttributeNameStr = [[NSMutableAttributedString alloc] initWithString:string];
  //创建富文本属性
    NSDictionary *dic = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    
    if (!self.attributedStr || self.attributedStr.length==0) {
        [fontAttributeNameStr addAttributes:dic range:range];
        self.attributedStr =fontAttributeNameStr;
//        NSLog(@"之前不存在的情况下，现在attributedStr==%@",self.attributedStr);
    }else{
        //给富文本添加富文本属性
         [self.attributedStr addAttributes:dic range:range];
//        NSLog(@"之前存在的情况下，现在attributedStr==%@",self.attributedStr);
    }
  
 
    
}


///  富文本属性--字间距
/// @param string label的整个字符串
/// @param columnSpace 字间距
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForKernWithString:(NSString*)string columnDistance:(CGFloat)columnSpace Range:(NSRange)range{
    
    //创建富文本
    NSMutableAttributedString *kernAttStr = [[NSMutableAttributedString alloc] initWithString:string];
   //创建富文本属性
   NSDictionary *dic = [NSDictionary dictionaryWithObject:@(20) forKey:NSKernAttributeName];
    
    if (!self.attributedStr || self.attributedStr.length==0) {
        [kernAttStr addAttributes:dic range:range];
        self.attributedStr =kernAttStr;
//         NSLog(@"之前不存在==%@",self.attributedStr);
    }else{
        //给富文本添加富文本属性
          [ self.attributedStr addAttributes:dic range:range];
//        NSLog(@"之前存在==%@",self.attributedStr);
//        [self.attributedStr appendAttributedString:kernAttStr]; //返回值为空；
//        NSLog(@"拼好以后==%@",self.attributedStr);
    }
 
  
    
}


///  富文本属性--行间距、段落之间间距
/// @param string label的整个字符串
/// @param lineSpacing 行间距
/// @param paragraphSpacing 段间距
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForParaStyleWithString:(NSString*)string lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing Range:(NSRange)range  textAligement:(NSTextAlignment)textAligement{
    
      //1、创建富文本实例
      NSMutableAttributedString *paraStyleStr = [[NSMutableAttributedString alloc] initWithString:string];
  
     //2、创建富文本属性实例
       NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
       paraStyle.lineSpacing = lineSpacing; //行间距是5
       paraStyle.paragraphSpacing = paragraphSpacing;//段落间距是20；
    
       paraStyle.alignment = textAligement;  //居中，居左，还是居右
    
//       paraStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *dic = [NSDictionary dictionaryWithObject:paraStyle forKey:NSParagraphStyleAttributeName];
    
    if (!self.attributedStr || self.attributedStr.length==0) {
        
//         NSLog(@"之前不存在==%@",self.attributedStr);
        //给富文本添加富文本属性
           [paraStyleStr addAttributes: dic range:range];
           self.attributedStr =paraStyleStr;
    }else{
//        NSLog(@"之前存在==%@",self.attributedStr);
//        NSLog(@"拼好以后==%@",self.attributedStr);
         [ self.attributedStr addAttributes:dic range:range];
    }
     
}



/// 富文本属性--删除线（穿透线）
/// @param string label的整个字符串
/// @param lineColor 中划线颜色
/// @param lineStyle 线的样式
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForStrikethroughStyleWithString:(NSString*)string lineColor:(UIColor*)lineColor lineStyle:(NSUnderlineStyle)lineStyle Range:(NSRange)range{
    //1、创建富文本实例
          NSMutableAttributedString *strikethronghAttStr = [[NSMutableAttributedString alloc] initWithString:string];
      
         //2、创建富文本属性实例
          //中划线颜色
        NSDictionary *dic1 = [NSDictionary dictionaryWithObject:lineColor forKey:NSStrikethroughColorAttributeName];
          //中划线样式
        NSDictionary*dic2 = [NSDictionary dictionaryWithObject:@(lineStyle) forKey:NSStrikethroughStyleAttributeName];
    
        if (!self.attributedStr || self.attributedStr.length==0) {
//             NSLog(@"之前不存在==%@",self.attributedStr);
            //给富文本添加富文本属性
               [strikethronghAttStr addAttributes: dic1 range:range];
               [strikethronghAttStr addAttributes: dic2 range:range];
               self.attributedStr =strikethronghAttStr;
        }
        else{
//            NSLog(@"之前存在==%@",self.attributedStr);
//            NSLog(@"拼好以后==%@",self.attributedStr);
            [ self.attributedStr addAttributes:dic1 range:range];
            [ self.attributedStr addAttributes:dic2 range:range];
        }
}



/// 富文本属性--下划线
/// @param string label的整个字符串
/// @param lineColor 下划线颜色
/// @param lineStyle 线的样式
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForUnderlineStyleWithString:(NSString*)string lineColor:(UIColor*)lineColor lineStyle:(NSUnderlineStyle)lineStyle Range:(NSRange)range{
    //1、创建富文本实例
          NSMutableAttributedString *underAttStr = [[NSMutableAttributedString alloc] initWithString:string];
      
         //2、创建富文本属性实例
          //中划线颜色
        NSDictionary *dic1 = [NSDictionary dictionaryWithObject:lineColor forKey:NSUnderlineColorAttributeName];
        //中划线样式(为枚举值)
        NSDictionary*dic2 = [NSDictionary dictionaryWithObject:@(lineStyle) forKey:NSUnderlineStyleAttributeName];
    
        if (!self.attributedStr || self.attributedStr.length==0) {
//             NSLog(@"之前不存在==%@",self.attributedStr);
            //给富文本添加富文本属性
               [underAttStr addAttributes: dic1 range:range];
               [underAttStr addAttributes: dic2 range:range];
               self.attributedStr =underAttStr;
        }
        else{
//            NSLog(@"之前存在==%@",self.attributedStr);
//            NSLog(@"拼好以后==%@",self.attributedStr);
            [ self.attributedStr addAttributes:dic1 range:range];
            [ self.attributedStr addAttributes:dic2 range:range];
        }
}



///  富文本属性--前景颜色
/// @param string label的整个字符串
/// @param foregroundColor 前景颜色
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForForegroundColorWithString:(NSString*)string foregroundColor:(UIColor*)foregroundColor Range:(NSRange)range{
    
    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *foregourndAttributeStr = [[NSMutableAttributedString alloc] initWithString:string];
         //1.2 创建副文本属性实例
     NSDictionary *dic = [NSDictionary dictionaryWithObject:foregroundColor forKey:NSForegroundColorAttributeName];
       
    if (!self.attributedStr || self.attributedStr.length==0) {
        //1.3 给富文本添加富文本属性实例
            [foregourndAttributeStr addAttributes:dic range:range];
            self.attributedStr =foregourndAttributeStr;
//            NSLog(@"之前不存在==%@",self.attributedStr);
      
       }else{
//           NSLog(@"之前存在==%@",self.attributedStr);
//           NSLog(@"拼好以后==%@",self.attributedStr);
           [self.attributedStr addAttributes:dic range:range];
           
       }
 
}

///  富文本属性--背景颜色
/// @param string label的整个字符串
/// @param backgroundColor 背景颜色
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForBackgroundColorWithString:(NSString*)string backgroundColor:(UIColor*)backgroundColor Range:(NSRange)range{
    
    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *backgroundColorAttnameStr = [[NSMutableAttributedString alloc] initWithString:string];
         //1.2 创建副文本属性实例
     NSDictionary *dic = [NSDictionary dictionaryWithObject:backgroundColor forKey:NSBackgroundColorAttributeName];
       
    if (!self.attributedStr || self.attributedStr.length==0) {
        //1.3 给富文本添加富文本属性实例
            [backgroundColorAttnameStr addAttributes:dic range:range];
            self.attributedStr =backgroundColorAttnameStr;
//            NSLog(@"之前不存在==%@",self.attributedStr);
      
       }else{
//           NSLog(@"之前存在==%@",self.attributedStr);
//           NSLog(@"拼好以后==%@",self.attributedStr);
           [self.attributedStr addAttributes:dic range:range];
           
       }
 
}

///  富文本属性--背景颜色
/// @param string label的整个字符串
/// @param baselineOffset 基于基准线的偏移量
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForBaselineOffsetWithString:(NSString*)string baselineOffset:(CGFloat)baselineOffset Range:(NSRange)range{

#warning 注意：baselineOffset为正值向上偏移，负值向下偏移，默认0（不偏移）
    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *baselineOffsetAttNameStr = [[NSMutableAttributedString alloc] initWithString:string];
         //1.2 创建副文本属性实例
     NSDictionary *dic = [NSDictionary dictionaryWithObject:@(baselineOffset) forKey:NSBaselineOffsetAttributeName];
       
    if (!self.attributedStr || self.attributedStr.length==0) {
        //1.3 给富文本添加富文本属性实例
            [baselineOffsetAttNameStr addAttributes:dic range:range];
            self.attributedStr =baselineOffsetAttNameStr;
       }else{
           [self.attributedStr addAttributes:dic range:range];
       }
}

///  富文本属性--文字倾斜量
/// @param string label的整个字符串
/// @param obliqueness 文字倾斜量
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForObliquenessWithString:(NSString*)string obliqueness:(CGFloat)obliqueness Range:(NSRange)range{
#warning 注意：正值向右倾斜，无偏移效果，负值向左倾斜
    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *obliquenessrAttNameStr = [[NSMutableAttributedString alloc] initWithString:string];
         //1.2 创建副文本属性实例
     NSDictionary *dic = [NSDictionary dictionaryWithObject:@(obliqueness) forKey:NSObliquenessAttributeName];
       
    if (!self.attributedStr || self.attributedStr.length==0) {
        //1.3 给富文本添加富文本属性实例
            [obliquenessrAttNameStr addAttributes:dic range:range];
            self.attributedStr =obliquenessrAttNameStr;
       }else{
           [self.attributedStr addAttributes:dic range:range];
       }
}

///  富文本属性--文字扩张
/// @param string label的整个字符串
/// @param expansion 文字扩张量
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForExpansionWithString:(NSString*)string expansion:(CGFloat)expansion Range:(NSRange)range{
#warning 注意：正值横向拉伸，无扁平效果，负值横向压缩
    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *expansionAttNameStr = [[NSMutableAttributedString alloc] initWithString:string];
         //1.2 创建副文本属性实例
     NSDictionary *dic = [NSDictionary dictionaryWithObject:@(expansion) forKey:NSObliquenessAttributeName];
       
    if (!self.attributedStr || self.attributedStr.length==0) {
        //1.3 给富文本添加富文本属性实例
            [expansionAttNameStr addAttributes:dic range:range];
            self.attributedStr =expansionAttNameStr;
       }else{
           [self.attributedStr addAttributes:dic range:range];
       }
}


///  富文本属性--画空心文字
/// @param string label的整个字符串
/// @param strokeColor 文字扩张量
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForStrokeWithString:(NSString*)string strokeColor:(UIColor*)strokeColor  strokeWidth:(CGFloat)strokeWidth Range:(NSRange)range{
#warning 描边颜色要搭配非0的描边宽度才会生效，如果只设置了描边颜色，描边宽度为0，则没有描边效果
#warning 描边宽度是正数，会对文字进行描边，但文字中心不填充（ 一种经典的空心文本样式是在该值为3.0）
#warning 描边宽度是负数，会对文字进行描边，而且会同时对文字中心进行填充（填充的颜色为文字本来的字体颜色）
    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *stokenAttNameStr = [[NSMutableAttributedString alloc] initWithString:string];
         //1.2 创建副文本属性实例
     NSDictionary *dic1= [NSDictionary dictionaryWithObject:strokeColor forKey:NSStrokeColorAttributeName];
     NSDictionary *dic2 = [NSDictionary dictionaryWithObject:@(strokeWidth) forKey:NSStrokeWidthAttributeName];
       
    if (!self.attributedStr || self.attributedStr.length==0) {
        //1.3 给富文本添加富文本属性实例
            [stokenAttNameStr addAttributes:dic1 range:range];
            [stokenAttNameStr addAttributes:dic2 range:range];
            self.attributedStr =stokenAttNameStr;
       }else{
           [self.attributedStr addAttributes:dic1 range:range];
           [self.attributedStr addAttributes:dic2 range:range];
       }
}



/// 富文本属性--画阴影字
/// @param string label的整个字符串
/// @param shadowColor 阴影颜色
/// @param shadowBlurRadius 阴影圆角
/// @param shadowOffset 阴影偏移量
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForShadowWithString:(NSString*)string shadowColor:(UIColor*)shadowColor  shadowBlurRadius:(CGFloat)shadowBlurRadius shadowOffset:(CGSize)shadowOffset Range:(NSRange)range{

    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *shadowAttNameStr = [[NSMutableAttributedString alloc] initWithString:string];
         // 创建NSShadow实例
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = shadowColor;
    shadow.shadowBlurRadius = shadowBlurRadius;
    shadow.shadowOffset = shadowOffset;
    //1.2 创建副文本属性实例
     NSDictionary *dic = [NSDictionary dictionaryWithObject:shadow forKey:NSStrokeColorAttributeName];
       
    if (!self.attributedStr || self.attributedStr.length==0) {
        //1.3 给富文本添加富文本属性实例
            [shadowAttNameStr addAttributes:dic range:range];
            self.attributedStr =shadowAttNameStr;
       }else{
           [self.attributedStr addAttributes:dic range:range];
           
       }
}



/// 富文本属性--文字效果(很少会用到,没啥卵用)
/// @param string label的整个字符串
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForTextEffectWithString:(NSString*)string Range:(NSRange)range{
    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *textEffectAttNameStr = [[NSMutableAttributedString alloc] initWithString:string];
         //1.2 创建副文本属性实例
     NSDictionary *dic = [NSDictionary dictionaryWithObject:NSTextEffectLetterpressStyle forKey:NSTextEffectAttributeName];
       
    if (!self.attributedStr || self.attributedStr.length==0) {
        //1.3 给富文本添加富文本属性实例
            [textEffectAttNameStr addAttributes:dic range:range];
            self.attributedStr =textEffectAttNameStr;
       }else{
           [self.attributedStr addAttributes:dic range:range];
       }
}


/// 富文本属性--连字符（很少会用到,没啥卵用）
/// @param string label的整个字符串
/// @param number 传0或者1 （0表示没有连字符，而1是默认的连字符。）
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForLigatureWithString:(NSString*)string number:(NSNumber*)number Range:(NSRange)range{
    #warning ios 中有 0 和 1 两个值：0表示没有连字符，而1是默认的连字符。（一般对连笔写的英文有效, 中文即使设置了连字符也很难表现出来）。
    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *lightureAttnameStr = [[NSMutableAttributedString alloc] initWithString:string];
         //1.2 创建副文本属性实例
     NSDictionary *dic = [NSDictionary dictionaryWithObject:number forKey:NSLigatureAttributeName];
       
    if (!self.attributedStr || self.attributedStr.length==0) {
        //1.3 给富文本添加富文本属性实例
            [lightureAttnameStr addAttributes:dic range:range];
            self.attributedStr =lightureAttnameStr;
       }else{
           [self.attributedStr addAttributes:dic range:range];
       }
}


/// 富文本属性--跳转链接
/// @param string label的整个字符串
/// @param urlString urlString 跳转链接要实现UITextView的这个委托方法 extView shouldInteractWithURL:
/// @param range 要显示的富文本的范围
- (void)setAttributedStringForLinkWithString:(NSString*)string urlString:(NSString*)urlString Range:(NSRange)range{
    #warning ios 注意：UILabel无法使用该属性, 但UITextView 控件可以使用
    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *linkAttnameStr = [[NSMutableAttributedString alloc] initWithString:string];
         //1.2 创建副文本属性实例
     NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSURL URLWithString:urlString] forKey:NSLinkAttributeName];
       
    if (!self.attributedStr || self.attributedStr.length==0) {
        //1.3 给富文本添加富文本属性实例
            [linkAttnameStr addAttributes:dic range:range];
            self.attributedStr =linkAttnameStr;
       }else{
           [self.attributedStr addAttributes:dic range:range];
       }
//      self.textView.attributedText = attributeStr;
}


/// 富文本属性--图文混排
/// @param string label的整个字符串
/// @param image 要插入的图片
/// @param attachBounds 图片附件的尺寸
/// @param index 要插入图片的位置
- (void)setAttributedStringForTextAttachmentWithString:(NSString*)string image:(UIImage*)image attachBounds:(CGRect)attachBounds index:(NSUInteger)index {
    //1、富文本部分
         //1.1 创建富文本
     NSMutableAttributedString *attachAttnameStr = [[NSMutableAttributedString alloc] initWithString:string];
         //1.2 创建图片图片附件
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = image;
    attach.bounds = attachBounds;
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];

    //将图片插入到合适的位置(所以插入)
    [attachAttnameStr insertAttributedString:attachString atIndex:index];
    
    self.attributedStr =attachAttnameStr;
  
}




/// 把html转成字符串
/// @param html html
-(NSString *)filterHTML:(NSString *)html{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
//    NSString * regEx = @"<([^>]*)>";
//    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}


- (void)setAttributeStringWithString:(NSString *)string font:(UIFont *)font{
        
//        NSString *_test  =  string ;
//        NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
//        paraStyle01.alignment = NSTextAlignmentLeft;  //对齐
//        paraStyle01.headIndent = 0.0f;//行首缩进
//        //参数：（字体大小17号字乘以2，34f即首行空出两个字符）
//        CGFloat emptylen = font.pointSize * 2;
//        paraStyle01.firstLineHeadIndent = emptylen;//首行缩进
//        paraStyle01.tailIndent = 0.0f;//行尾缩进
//        paraStyle01.lineSpacing = 2.0f;//行间距
        
 
//        NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:_test attributes:@{NSParagraphStyleAttributeName:paraStyle01}];

//    self.contentLabel.attributedText = attrText;
    
    
  
}



@end

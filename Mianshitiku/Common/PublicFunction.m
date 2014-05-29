//
//  PublicFunction.m
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "PublicFunction.h"

@implementation PublicFunction


// 计算UITextView内容的高度
+ (float)getTextContentHeight:(NSString *)text font:(UIFont *)font limitWidth:(float)limitWidth {
    float newSizeH = 0;
    CGSize textSize = CGSizeZero;
#ifdef __IPHONE_7_0
    // 7.0以上我们需要自己计算高度
    textSize = [text boundingRectWithSize:CGSizeMake(limitWidth, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                             attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                                context:nil].size;
    newSizeH = textSize.height;
#else
    newSizeH = [text sizeWithFont:font forWidth:limitWidth lineBreakMode:NSLineBreakByWordWrapping].height;
#endif
    
    return newSizeH;
}

@end

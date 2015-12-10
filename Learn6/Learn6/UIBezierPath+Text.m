//
//  UIBezierPath+Text.m
//  Learn6
//
//  Created by mac on 15/12/10.
//  Copyright (c) 2015年 dqy. All rights reserved.
//

#import "UIBezierPath+Text.h"
#import <CoreText/CoreText.h>



@implementation UIBezierPath (Text)


+ (UIBezierPath *)pathWithText:(NSString *)text attrs:(NSDictionary *)attrs {
    
    //断言
    NSAssert(text != nil && text != nil,@"参数不能为空");
    

    NSAttributedString *attrStrs = [[NSAttributedString alloc] initWithString:text attributes:attrs];
    
    //创建路径
    CGMutablePathRef paths = CGPathCreateMutable();
    
    //获得文字的行数
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrStrs);
    
    //获得所有行的最小绘制单元
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    //遍历
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        
        //取出最小绘制单元
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            {
                CGPathRef path = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(paths, &t,path);
                CGPathRelease(path);
            }
        }
    }
    CFRelease(line);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:paths]];
    
    CGPathRelease(paths);
    
    return path;
    
    
    
    
}
@end

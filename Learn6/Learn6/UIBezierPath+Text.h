//
//  UIBezierPath+Text.h
//  Learn6
//
//  Created by mac on 15/12/10.
//  Copyright (c) 2015年 dqy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (Text)

+ (UIBezierPath *)pathWithText:(NSString *) text attrs:(NSDictionary *) attrs;

@end

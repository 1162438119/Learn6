//
//  ViewController.m
//  Learn6
//
//  Created by mac on 15/12/10.
//  Copyright (c) 2015年 dqy. All rights reserved.
//

#import "ViewController.h"
#import "UIBezierPath+Text.h"
@interface ViewController ()

@property (nonatomic,strong) CAShapeLayer * textLayer;

@property (nonatomic,strong) NSMutableDictionary * attrs;


@end

@implementation ViewController

/*
  懒加载
 */
- (CAShapeLayer *)textLayer {
    
    if (_textLayer == nil) {
        
        _textLayer = [CAShapeLayer layer];
        
        _textLayer.frame = CGRectMake(20, 40, 200, 100);
        _textLayer.strokeColor = [UIColor redColor].CGColor;
        _textLayer.fillColor = [UIColor clearColor].CGColor;
        
        /*翻转*/
        _textLayer.geometryFlipped = YES;
        _textLayer.lineWidth = 2;
    
    }
    
    return _textLayer;
    
}

- (NSMutableDictionary *)attrs {
    
    if (_attrs == nil) {
        _attrs = [NSMutableDictionary dictionaryWithCapacity:1];
        [_attrs setValue:[UIFont systemFontOfSize:50] forKey:NSFontAttributeName];
    }
    
    return _attrs;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view.layer addSublayer:self.textLayer];
    
    
    //指定CAShapePath 的路径
    
    UIBezierPath * path =  [UIBezierPath pathWithText:@"戴庆云" attrs:self.attrs];
    
    self.textLayer.path = path.CGPath;
    
    
    //动画
    
    CABasicAnimation * basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    basicAnimation.duration = 2.0f;
    
    basicAnimation.fromValue = @(0.0f);
    basicAnimation.toValue = @(1.0f);
    
    [self.textLayer addAnimation:basicAnimation forKey:nil];
    
    
    
    
    

    
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

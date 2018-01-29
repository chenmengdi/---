//
//  UIButton+point.m
//  五角星按钮
//
//  Created by 陈孟迪 on 2018/1/24.
//  Copyright © 2018年 陈孟迪. All rights reserved.
//

#import "UIButton+point.h"

@implementation UIButton (point)

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    BOOL res = [super pointInside:point withEvent:event];
    if (res) {
        
        CGPoint o = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        CGFloat radius = o.x;
        CGPoint p1 = CGPointMake(o.x, o.y-radius);
        
       UIBezierPath *path1 = [UIBezierPath bezierPath];
        path1.lineCapStyle = kCGLineCapButt;
        [path1 moveToPoint:CGPointMake(p1.x, p1.y)];
        
        CGFloat angle = 4*M_PI/5.0;
        for (int i = 1; i<6; i++) {
            
            CGFloat x = o.x-sinf(i*angle)*radius;
            CGFloat y = o.y-cosf(i*angle)*radius;
            [path1 addLineToPoint:CGPointMake(x, y)];
            
        }
        if ([path1 containsPoint:point]) {
            return YES;
        }
        return NO;
    }
    return NO;
}
@end

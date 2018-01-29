//
//  ViewController.m
//  五角星按钮
//
//  Created by 陈孟迪 on 2018/1/23.
//  Copyright © 2018年 陈孟迪. All rights reserved.
//
/*
 以正东面为0度起点计算指定角度所对应的圆周上的点的坐标：
 
 float radian = AngleToRadian(angle);
 
 float x = center.x + cos(radian)*currentAdius;
 
 float y = center.y + sin(radian)*currentAdius;
 
 　 CGPoint point = CGPointMake(x, y);
 
 以正北面为0度起点计算指定角度所对应的圆周上的点的坐标：
 
 float radian = AngleToRadian(angle);
 
 float x = center.x + sinf(radian)*currentAdius;
 
 float y = center.y - cosf(radian)*currentAdius;
 
 CGPoint point = CGPointMake(x, y);
 
 
 */
#import "ViewController.h"
 //角度转弧度：
#define AngleToRadian(angle) (M_PI/180.0f)*angle
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}

- (void)createUI{
    
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-120)/2, (self.view.frame.size.height-120)/2, 120, 120)];
    v.backgroundColor = [UIColor grayColor];
    [self.view addSubview:v];
    
    UIButton *myButtton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButtton.frame = CGRectMake(20, 20, 80, 80);
    myButtton.backgroundColor = [UIColor redColor];
    [myButtton addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    [v addSubview:myButtton];
    
    //圆心
    CGPoint o = CGPointMake(myButtton.frame.size.width/2, myButtton.frame.size.height/2);
    //半径
    CGFloat radius = o.x;
    //顶点坐标
    CGPoint p1 = CGPointMake(o.x, o.y-radius);


    UIBezierPath *path1 = [UIBezierPath bezierPath];
    path1.lineCapStyle = kCGLineCapButt;
    [path1 moveToPoint:CGPointMake(p1.x, p1.y)];

    //五角星每个点之间点夹角，采用弧度计算。每两个点进行连线就可以画出五角星
    //点与点之间点夹角为2*M_PI/5.0，
    //因为是隔点连线，所以是2*2*M_PI/5.0
    CGFloat angle = 4*M_PI/5.0;
    for (int i = 1; i<6; i++) {
        
        CGFloat x = o.x-sinf(i*angle)*radius;
        CGFloat y = o.y-cosf(i*angle)*radius;
        [path1 addLineToPoint:CGPointMake(x, y)];

    }
    CAShapeLayer *layer1  = [[CAShapeLayer alloc]init];
    layer1.frame = myButtton.bounds;
    layer1.path = path1.CGPath;
    myButtton.layer.mask = layer1;

}

- (void)action:(UIButton*)sender{
    
    NSLog(@"点了五角星");
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  UibezierPathDemo
//
//  Created by 大家保 on 16/8/18.
//  Copyright © 2016年 大家保. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) DrawView *drawView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_drawView stroke];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _drawView=[[DrawView alloc]initWithFrame:CGRectMake((kScreenWidth-200)/2.0,(kScreenHeight-300)/2.0 , 200, 200) dataItems:@[@6,@12,@7] colorItems:@[[UIColor greenColor],[UIColor redColor],[UIColor blueColor]]];
    [self.view addSubview:_drawView];
    
    [_drawView stroke];
    
    
//    self.view.backgroundColor=[UIColor whiteColor];
//    DrawView *draw=[[DrawView alloc]init];
//    draw.frame=self.view.frame;
//    draw.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:draw];
//    
//    
//    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 100, 10, 10)];
//    imageView.backgroundColor=[UIColor redColor];
//    imageView.layer.cornerRadius=5;
//    imageView.clipsToBounds=YES;
//    [self.view addSubview:imageView];
//    
//    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:self.view.center radius:100 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    CAKeyframeAnimation *key=[CAKeyframeAnimation animationWithKeyPath:@"position"];
//    key.path=path.CGPath;
//    key.duration=10;
//    key.removedOnCompletion=NO;
//    key.repeatCount=HUGE_VAL;
//    key.fillMode=kCAFillModeForwards;
//    [imageView.layer addAnimation:key forKey:@"key"];
    
    /**
     *  创建阴影
     */
//    CALayer *sublayer =[CALayer layer];
//    sublayer.backgroundColor =[UIColor whiteColor].CGColor;
//    sublayer.shadowOffset = CGSizeMake(0, 0);
//    sublayer.frame = CGRectMake(100, 100, 200, 200);
//    sublayer.shadowRadius =5;
//    sublayer.shadowColor =[UIColor blackColor].CGColor;
//    sublayer.shadowOpacity =1;
//    sublayer.cornerRadius=100;
//    [self.view.layer addSublayer:sublayer];
    /**
     创建遮罩层
     */
//    UIImageView *imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
//    imageView2.image=[UIImage imageNamed:@"arlert门店照片"];
//    [self.view addSubview:imageView2];
//    imageView2.layer.mask=[self addCureMaskWithView:imageView2];
    
    
    
    
//    UIImageView *voiceImageView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
//    voiceImageView.image=[UIImage imageNamed:@"录音"];
//    voiceImageView.clipsToBounds=YES;
//    [self.view addSubview:voiceImageView];
//    
//    UIBezierPath *path=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 0, 100, 100) cornerRadius:0];
//    CAShapeLayer *shape=[CAShapeLayer layer];
//    shape.path=path.CGPath;
//    shape.fillColor=[UIColor lightGrayColor].CGColor;
//    [voiceImageView.layer addSublayer:shape];
    
//    CAShapeLayer *shapeLayer=[CAShapeLayer layer];
//    shapeLayer.frame=CGRectMake(100, 100, 200, 200);
//    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
//    shapeLayer.path=path.CGPath;
//    shapeLayer.fillColor=[UIColor clearColor].CGColor;
//    shapeLayer.lineWidth=2.0;
//    shapeLayer.strokeColor=[UIColor redColor].CGColor;
//    [self.view.layer addSublayer:shapeLayer];
//    
//    CABasicAnimation *basic=[CABasicAnimation animationWithKeyPath:@"strokeStart"];
//    basic.fromValue=[NSNumber numberWithFloat:0.0];
//    basic.toValue=[NSNumber numberWithFloat:1.0f];
//    basic.duration=3;
//    basic.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    basic.fillMode=kCAFillModeForwards;
//    basic.removedOnCompletion=NO;
//    [shapeLayer addAnimation:basic forKey:@"strokeAnimation"];
    
    
//    UIBezierPath *path=[UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(10, 100)];
//    [path addQuadCurveToPoint:CGPointMake(110, 100) controlPoint:CGPointMake(60, 0)];
//    [path moveToPoint:CGPointMake(110, 100)];
//    [path addQuadCurveToPoint:CGPointMake(210, 100) controlPoint:CGPointMake(170, 200)];
//    CAShapeLayer *layer=[CAShapeLayer layer];
//    layer.path=path.CGPath;
//    layer.fillColor=[UIColor clearColor].CGColor;
//    layer.lineWidth=1;
//    layer.strokeStart=0.5;
//    layer.strokeEnd=0.5;
//    layer.strokeColor=[UIColor redColor].CGColor;
//    [self.view.layer addSublayer:layer];
//    
//    CABasicAnimation *anim=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    anim.duration=3.0;
//    anim.fromValue=[NSNumber numberWithFloat:0.5f];
//    anim.toValue=[NSNumber numberWithFloat:1.0f];
//    anim.removedOnCompletion=NO;
//    anim.fillMode=kCAFillModeForwards;
//    
//    CABasicAnimation *anim2=[CABasicAnimation animationWithKeyPath:@"strokeStart"];
//    anim2.duration=3.0;
//    anim2.fromValue=[NSNumber numberWithFloat:0.5f];
//    anim2.toValue=[NSNumber numberWithFloat:0.0f];
//    anim2.removedOnCompletion=NO;
//    anim2.fillMode=kCAFillModeForwards;
//    
//    CABasicAnimation *anim3=[CABasicAnimation animationWithKeyPath:@"lineWidth"];
//    anim3.duration=3.0f;
//    anim3.fromValue=@1;
//    anim3.toValue=@10;
//    anim3.removedOnCompletion=NO;
//    anim3.fillMode=kCAFillModeForwards;
//    
//    CAAnimationGroup *group=[CAAnimationGroup animation];
//    group.duration=3.0;
//    group.animations=@[anim,anim2,anim3];
//
//    [layer addAnimation:group forKey:@"anim"];
    

    //扇形
//    CAShapeLayer *wai=[CAShapeLayer layer];
//    wai.lineWidth=120;
//    wai.strokeColor=[UIColor whiteColor].CGColor;
//    wai.fillColor=[UIColor clearColor].CGColor;
//    [self.view.layer addSublayer:wai];
//    
//    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:self.view.center radius:60 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    wai.path=path.CGPath;
//    
//    CAShapeLayer *nei=[CAShapeLayer layer];
//    nei.lineWidth=120;
////    nei.lineCap=kCALineCapRound;
////    nei.lineJoin=kCALineCapRound;
//    nei.strokeColor=[UIColor orangeColor].CGColor;
//    nei.fillColor=[UIColor clearColor].CGColor;
//    [self.view.layer addSublayer:nei];
//    
//    UIBezierPath *path2=[UIBezierPath bezierPathWithArcCenter:self.view.center radius:60 startAngle:0 endAngle:M_PI*2.0 clockwise:YES];
//    nei.path=path2.CGPath;
//    
//    CABasicAnimation *basic=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    basic.duration=3;
//    basic.fromValue=@0;
//    basic.toValue=@1;
//    basic.removedOnCompletion=NO;
//    basic.fillMode=kCAFillModeForwards;
//    [nei addAnimation:basic forKey:@"animate"];
}
/**
 *  创建遮罩层
 */
//- (CAShapeLayer *)addCureMaskWithView:(UIView *)view{
    //圆形
    //UIBezierPath *path2=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
//    UIBezierPath *path2=[UIBezierPath bezierPathWithArcCenter:CGPointMake(view.frame.size.width/2.0, view.frame.size.width/2.0) radius:view.frame.size.width/2.0 startAngle:0 endAngle:M_PI*2.0 clockwise:YES];
    //方形
//    UIBezierPath *path2=[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
//    UIBezierPath *path2=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) cornerRadius:10];
//    UIBezierPath *path2=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    //自定义
//    UIBezierPath *path2=[UIBezierPath bezierPath];
//    [path2 moveToPoint:CGPointMake(0, 0)];
//    [path2 addLineToPoint:CGPointMake(170, 0)];
//    [path2 addLineToPoint:CGPointMake(170, 30)];
//    [path2 addLineToPoint:CGPointMake(200, 30)];
//    [path2 addLineToPoint:CGPointMake(170, 60)];
//    [path2 addLineToPoint:CGPointMake(170, 200)];
//    [path2 addLineToPoint:CGPointMake(0,200)];
//    [path2 closePath];
//    CAShapeLayer *lay=[CAShapeLayer layer];
//    lay.path=path2.CGPath;
//    return lay;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

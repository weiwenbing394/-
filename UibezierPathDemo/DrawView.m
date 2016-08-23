//
//  DrawView.m
//  UibezierPathDemo
//
//  Created by 大家保 on 16/8/18.
//  Copyright © 2016年 大家保. All rights reserved.
//

#import "DrawView.h"
#define kAnimationDuration 1.0f
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kBackgroundColor [UIColor grayColor]
#define kFillColor [UIColor clearColor].CGColor
#define kRandColor [UIColor colorWithRed:arc4random() % 255 / 255.0f green:arc4random() % 255 / 255.0f blue:arc4random() % 255 / 255.0f alpha:1.0f]
#define kLabelLoctionRatio (1.2*bgRadius)

@interface DrawView ()

@property (nonatomic) CGFloat total;

@property (nonatomic) CAShapeLayer *bgCircleLayer;

@end

@implementation DrawView
/**
 *  初始化
 *
 */
- (instancetype)initWithFrame:(CGRect)frame dataItems:(NSArray *)dataItems colorItems:(NSArray *)colorItems{
    self=[super initWithFrame:frame];
    if (self) {
        self.hidden=YES;
        self.backgroundColor=kBackgroundColor;
        
        //中心点
        CGFloat centerWidth=self.frame.size.width*0.5f;
        CGFloat centerHeight=self.frame.size.height*0.5f;
        CGFloat centerX=centerWidth;
        CGFloat centerY=centerHeight;
        CGPoint centerPoint=CGPointMake(centerX, centerY);
        //半径
        CGFloat radiusBasic=centerWidth>centerHeight?centerHeight:centerWidth;
        //计算所有data的总和
        _total=0.0f;
        for (int i=0; i<dataItems.count; i++) {
            _total+=[dataItems[i] floatValue];
        }
        
        //背景路径
        CGFloat bgRadius=radiusBasic*0.5;
        UIBezierPath *bgPath=[UIBezierPath bezierPathWithArcCenter:centerPoint radius:bgRadius startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
        _bgCircleLayer=[CAShapeLayer layer];
        _bgCircleLayer.fillColor=[UIColor clearColor].CGColor;
        _bgCircleLayer.strokeColor=[UIColor lightGrayColor].CGColor;
        _bgCircleLayer.strokeStart=0.0f;
        _bgCircleLayer.strokeEnd=1.0f;
        _bgCircleLayer.zPosition=1;
        _bgCircleLayer.lineWidth=bgRadius*2;
        _bgCircleLayer.path=bgPath.CGPath;
        
        //子扇形路径
        CGFloat otherRadius=radiusBasic*0.5-3.0;
        UIBezierPath *otherPath=[UIBezierPath bezierPathWithArcCenter:centerPoint radius:otherRadius startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
        CGFloat start=0.0f;
        CGFloat end=0.0f;
        for (int i=0; i<dataItems.count; i++) {
            end=[dataItems[i] floatValue]/_total+start;
            //图层
            CAShapeLayer *dra=[CAShapeLayer layer];
            [self.layer addSublayer:dra];
            dra.fillColor=kFillColor;
            if (i>colorItems.count-1||!colorItems||colorItems.count==0) {
                //如果传过来的颜色数组少于item个数则随机填充颜色
                dra.strokeColor=kRandColor.CGColor;
            }else{
                dra.strokeColor=((UIColor *)colorItems[i]).CGColor;
            }
            dra.strokeStart=start;
            dra.strokeEnd=end;
            dra.lineWidth=otherRadius*2;
            dra.zPosition=2;
            dra.path=otherPath.CGPath;
            //计算百分比label的位置
            CGFloat centerAngle = M_PI * (start + end);
            CGFloat labelCenterX = kLabelLoctionRatio * sinf(centerAngle) + centerX;
            CGFloat labelCenterY = -kLabelLoctionRatio * cosf(centerAngle) + centerY;
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, radiusBasic * 0.7f, radiusBasic * 0.7f)];
            label.center = CGPointMake(labelCenterX, labelCenterY);
            label.text = [NSString stringWithFormat:@"%ld%%",(NSInteger)((end - start + 0.005) * 100)];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            label.layer.zPosition = 3;
            [self addSubview:label];
            //计算下一个start位置＝当前end位置
            start=end;
        }
        self.layer.mask=_bgCircleLayer;
    }
    return self;
};
/**
 *  旋转动画
 */
- (void)stroke{
    self.hidden=NO;
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration=kAnimationDuration;
    animation.fromValue=@0.0f;
    animation.toValue=@1.0f;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion=YES;
    [_bgCircleLayer addAnimation:animation forKey:@"circleAnimation"];
};

- (void)dealloc{
    [self.layer removeAllAnimations];
}

//- (void)drawRect:(CGRect)rect {
//    /**
//     *  直线
//     */
//    [[UIColor redColor] set];
//    UIBezierPath *path=[UIBezierPath bezierPath];
//    path.lineWidth=5;
//    path.lineCapStyle=kCGLineCapRound;
//    path.lineJoinStyle=kCGLineCapRound;
//    //起点
//    [path moveToPoint:CGPointMake(20, 100)];
//    //绘制线条
//    [path addLineToPoint:CGPointMake(200, 20)];
//    [path stroke];
//    
//    /**
//     *  直角juxing
//     */
//    [[UIColor redColor] set];
//    UIBezierPath *path2=[UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 150, 100)];
//    path2.lineWidth=5;
//    path2.lineCapStyle=kCGLineCapRound;
//    path2.lineJoinStyle=kCGLineCapRound;
//    [path2 stroke];
//    /**
//     *  圆角矩形
//     */
//    [[UIColor redColor] set];
//    UIBezierPath *path3=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 150, 100) cornerRadius:30];
//    path3.lineWidth=5;
//    path3.lineCapStyle=kCGLineCapRound;
//    path3.lineJoinStyle=kCGLineCapRound;
//    [path3 stroke];
//    /**
//     *  指定位置圆角矩形
//     */
//    [[UIColor redColor] set];
//    UIBezierPath* path4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 150, 100) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(30, 30)];
//    path4.lineWidth=5;
//    path4.lineCapStyle=kCGLineCapRound;
//    path4.lineJoinStyle=kCGLineCapRound;
//    [path4 stroke];
//    /**
//     *  圆形
//     */
//    [[UIColor redColor] set];
//    UIBezierPath *path5=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 100)];
//    path5.lineWidth=5;
//    path5.lineCapStyle=kCGLineCapRound;
//    path5.lineJoinStyle=kCGLineCapRound;
//    [path5 stroke];
//    /**
//     *  椭圆形
//     */
//    [[UIColor redColor] set];
//    UIBezierPath *path6=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 50)];
//    path6.lineWidth=5;
//    path6.lineJoinStyle=kCGLineCapRound;
//    path6.lineJoinStyle=kCGLineCapRound;
//    [path6 stroke];
//    
//}



@end

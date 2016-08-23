//
//  DrawView.h
//  UibezierPathDemo
//
//  Created by 大家保 on 16/8/18.
//  Copyright © 2016年 大家保. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView

/**
 *  初始化
 *
 */
- (instancetype)initWithFrame:(CGRect)frame dataItems:(NSArray *)dataItems colorItems:(NSArray *)colorItems;
/**
 *  旋转动画
 */
- (void)stroke;

@end

//
//  ZHTSlideViewController.h
//  ZHTSlider
//
//  Created by lizhanpeng on 2017/8/1.
//  Copyright © 2017年 hebccc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHTSlideViewController : UIViewController
//左边视图控制器
@property (nonatomic, strong) UIViewController *leftViewController;
//右边视图控制器 一般为UINavigationController 或者 UITabBarController
@property (nonatomic, strong) UIViewController *mainViewController;

//菜单的显示区域占屏幕宽度的百分比
@property (nonatomic, assign) CGFloat MenuWidthScale;
//遮罩层最高透明度
@property (nonatomic, assign) CGFloat MaxCoverAlpha ;
//遮罩
@property (nonatomic, strong) UIView *coverView;

//初始化方法
- (instancetype)initWithLeftVc:(UIViewController *)leftVc mainVc:(UIViewController *)mainVc;
//打开菜单视图
- (void)openLeftView;
//关闭菜单视图
- (void)closeLeftView;
@end

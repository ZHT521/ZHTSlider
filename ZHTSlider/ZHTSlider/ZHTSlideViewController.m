//
//  ZHTSlideViewController.m
//  ZHTSlider
//
//  Created by lizhanpeng on 2017/8/1.
//  Copyright © 2017年 hebccc. All rights reserved.
//

#import "ZHTSlideViewController.h"

@interface ZHTSlideViewController (){
    //记录起始位置
    CGPoint originalPoint;
    
}

@end

@implementation ZHTSlideViewController

-(instancetype)initWithLeftVc:(UIViewController *)leftVc mainVc:(UIViewController *)mainVc{
    if (self = [super init]) {
        [self addChildViewController:leftVc];
        [self addChildViewController:mainVc];
        self.leftViewController = leftVc;
        self.mainViewController = mainVc;
        [self.view addSubview:self.leftViewController.view];
        [self.view addSubview:self.mainViewController.view];
        
        self.leftViewController.view.frame = self.view.frame;
        self.mainViewController.view.frame = self.view.frame;
        
        self.coverView = [[UIView alloc]initWithFrame:self.view.bounds];
        self.coverView.backgroundColor = [UIColor blackColor];
        self.coverView.alpha = 0;
        self.coverView.hidden = YES;
        [self.mainViewController.view addSubview:self.coverView];
        UITapGestureRecognizer *oneTapGestureReognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTapGestureRecognizer:)];
//        oneTapGestureReognizer.numberOfTapsRequired = 1;//触摸次数
        [self.coverView addGestureRecognizer:oneTapGestureReognizer];
        
        self.MaxCoverAlpha = 0.25;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"主界面";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"left界面" style:UIBarButtonItemStylePlain target:self action:@selector(LeftBtnClick)];
    self.navigationItem.leftBarButtonItem = leftItem;

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
//    pan.delegate = self;
    [self.mainViewController.view addGestureRecognizer:pan];
    
}
-(void)LeftBtnClick{
    [self openLeftView];
}
-(void)oneTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer{
    [self closeLeftView];
}
//滑动手势
- (void)handlePan:(UIPanGestureRecognizer *)pan
{
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            //记录起始点
            originalPoint = CGPointMake(CGRectGetMinX(self.mainViewController.view.frame),CGRectGetMidY(self.mainViewController.view.frame));
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint point = [pan translationInView:self.view];
            CGFloat x = originalPoint.x + point.x;

            //最左侧边界x = 0
            x = x > 0 ? x : 0;
            //最右侧边界x = self.menuWidth
            x = x < self.view.bounds.size.width * self.MenuWidthScale ? x : self.view.bounds.size.width * self.MenuWidthScale;
            
            self.mainViewController.view.center = CGPointMake(x + CGRectGetWidth(self.mainViewController.view.frame)/2, CGRectGetMidY(self.mainViewController.view.frame));
            
//            //更新遮罩层的透明度
            self.coverView.hidden = NO;
            self.coverView.alpha = CGRectGetMinX(self.mainViewController.view.frame)/self.self.view.bounds.size.width * self.MenuWidthScale * self.MaxCoverAlpha;
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (CGRectGetMinX(self.mainViewController.view.frame) <= self.view.bounds.size.width * self.MenuWidthScale/4) {
                [self closeLeftView];
            }
            else{
                [self openLeftView];
            }
        }
            break;
        default:
            break;
    }
}
//打开菜单视图
- (void)openLeftView
{
//    self.coverView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.mainViewController.view.center = CGPointMake(self.view.frame.size.width/2 + self.view.bounds.size.width * self.MenuWidthScale, CGRectGetMidY(self.mainViewController.view.frame));
//        [self updateLeftViewFrame];
        self.coverView.alpha = self.MaxCoverAlpha;
    } completion:^(BOOL finished) {
        
    }];
}

//关闭菜单视图
- (void)closeLeftView
{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.mainViewController.view.center = CGPointMake(self.view.frame.size.width/2, CGRectGetMidY(self.mainViewController.view.frame));
//        [self updateLeftViewFrame];
        self.coverView.alpha = 0;
    } completion:^(BOOL finished) {
        self.coverView.hidden = YES;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

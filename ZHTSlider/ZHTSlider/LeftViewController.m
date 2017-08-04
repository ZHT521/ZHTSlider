//
//  LeftViewController.m
//  ZHTSlider
//
//  Created by lizhanpeng on 2017/8/1.
//  Copyright © 2017年 hebccc. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
    lab.text = @"leftView";
    lab.textColor = [UIColor redColor];
    [self.view addSubview:lab];
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

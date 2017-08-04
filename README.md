# ZHTSlider
侧滑栏

UINavigationController *main = [[UINavigationController alloc]initWithRootViewController:[mainViewController new]];
    ZHTSlideViewController *root = [[ZHTSlideViewController alloc]initWithLeftVc:[LeftViewController new] mainVc:main];
    root.MenuWidthScale = 0.75;
    self.window.rootViewController = root;
    
    //打开菜单视图
- (void)openLeftView;

//关闭菜单视图
- (void)closeLeftView;

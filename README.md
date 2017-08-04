侧滑栏
===== 
```oc
UINavigationController *main = [[UINavigationController alloc]initWithRootViewController:[mainViewController new]];<br>
ZHTSlideViewController *root = [[ZHTSlideViewController alloc]initWithLeftVc:[LeftViewController new] mainVc:main];<br>
root.MenuWidthScale = 0.75;<br>
self.window.rootViewController = root;
打开菜单视图
- (void)openLeftView;
关闭菜单视图
- (void)closeLeftView;

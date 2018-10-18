###弹出view

<pre>
/**
 弹出视图

 @param blocks 如果视图有操作按钮
 @return 返回操作结果 
 */
+ (instancetype)popViewblocks:(myBlock)blocks{
    PopView * popV = [[PopView alloc]init];
    popV = [[PopView alloc]initWithFrame:CGRectMake(0, 0, 275, 246)];
    popV.backgroundColor = [UIColor whiteColor];
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    [keyWindow addSubview:popV.popShaperView];
    [keyWindow addSubview:popV];
     popV.center = keyWindow.center;
    // 第一步：将view宽高缩至无限小（点）
    popV.transform = CGAffineTransformScale(CGAffineTransformIdentity,
                                                    CGFLOAT_MIN, CGFLOAT_MIN);
    [UIView animateWithDuration:0.3
                     animations:^{
                         // 第二步： 以动画的形式将view慢慢放大至原始大小的1.2倍
                         popV.popShaperView.alpha = 0.7;
                         popV.transform =
                         CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2
                                          animations:^{
                                              // 第三步： 以动画的形式将view恢复至原始大小
                                              popV.transform = CGAffineTransformIdentity;
                                          }];
                     }];
    popV.block = blocks;
    return popV;
}
- (void)touchOKBtn{
    [self hideWeatherPopView];
    self.block(YES);
}

/**
 隐藏视图
 */
- (void)hideWeatherPopView{
    [UIView animateWithDuration:0.2
                     animations:^{
                         // 第一步： 以动画的形式将view慢慢放大至原始大小的1.2倍
                         self.transform =
                         CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                              // 第二步： 以动画的形式将view缩小至原来的1/1000分之1倍
                                              self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
                                              self.popShaperView.alpha = 0.0;
                                          }
                                          completion:^(BOOL finished) {
                                              // 第三步： 移除
                                              [self.popShaperView removeFromSuperview];
                                              [self removeFromSuperview];
                                          }];
                     }];
    
}

// 弹出视图阴影view
- (UIView *)popShaperView{
    if (!_popShaperView) {
        
        _popShaperView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _popShaperView.backgroundColor = [UIColor blackColor];
        _popShaperView.alpha = 0.0;
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideWeatherPopView)];
        [_popShaperView addGestureRecognizer:tapGesture];
    }
    return _popShaperView;
}
</pre>

### 弹出viewcontroller
<pre>
/**
 弹出viewcontroller

 @param height 高度
 @return 视图view
 */
+ (instancetype)popViewControllerHeight:(CGFloat)height{
    PopViewController * popVC = [[PopViewController alloc]init];
    popVC.height = height;
    return popVC;
}
</pre>

### 弹出底部viewcontroller
<pre>
/**
 弹出底部viewcontroller
 */
- (PopFootViewController *)footVC{
    if (!_footVC) {
        _footVC = [[PopFootViewController alloc]init];
    }
    return _footVC;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hiddenFootViewController];
}
- (void)showFootViewController{
     self.footVC.view.frame = CGRectMake(20, self.view.frame.size.height , self.view.frame.size.width - 40 , 160);
     [self.view addSubview:self.footVC.view];
    [UIView animateWithDuration:0.5f animations:^{
        CGRect rect = self.footVC.view.frame;
        rect.origin.y -= rect.size.height;
        [self.footVC.view setFrame:rect];
    }];
}
- (void)hiddenFootViewController{
    [UIView animateWithDuration:0.5f animations:^{
        CGRect rect = self.footVC.view.frame;
        rect.origin.y += rect.size.height;
        [self.footVC.view setFrame:rect];
    }];
}
</pre>
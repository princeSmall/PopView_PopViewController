//
//  ViewController.m
//  PopView_ViewController
//
//  Created by iOS on 2018/7/25.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "ViewController.h"
#import "PopViewController.h"
#import "PopView.h"
#import "PopFootViewController.h"

@interface ViewController ()
@property (nonatomic , strong)UIButton *popVCBtn;
@property (nonatomic , strong)UIButton *popVBtn;
@property (nonatomic , strong)UIButton *popFootVC;
@property (nonatomic , strong)PopFootViewController *footVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.popVCBtn];
    [self.view addSubview:self.popVBtn];
    [self.view addSubview:self.popFootVC];
   
    // Do any additional setup after loading the view, typically from a nib.
}
- (UIButton *)popVCBtn{
    if (!_popVCBtn) {
        _popVCBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2.0 -100, 200, 100, 100)];
        _popVCBtn.backgroundColor = [UIColor redColor];
        [_popVCBtn addTarget:self action:@selector(showPopViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popVCBtn;
}
- (UIButton *)popVBtn{
    if (!_popVBtn) {
        _popVBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2.0 , 200, 100, 100)];
        _popVBtn.backgroundColor = [UIColor greenColor];
        [_popVBtn addTarget:self action:@selector(showPopView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popVBtn;
}
- (UIButton *)popFootVC{
    if (!_popFootVC) {
        _popFootVC = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2.0 - 100, 300, 100, 100)];
        _popFootVC.backgroundColor = [UIColor blueColor];
        [_popFootVC addTarget:self action:@selector(showFootViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popFootVC;
}

/**
 弹出view
 */
-(void)showPopView{
    [PopView popViewblocks:^(BOOL isLeft) {
        NSLog(@"%ld",(long)isLeft);
    }];
}

/**
 弹出viewcontroller
 */
- (void)showPopViewController{
    PopViewController * popVC = [PopViewController popViewControllerHeight:500];
    popVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:popVC animated:YES completion:nil];
}
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

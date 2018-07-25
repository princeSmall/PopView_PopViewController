//
//  ViewController.m
//  PopView_ViewController
//
//  Created by le tong on 2018/7/25.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "ViewController.h"
#import "PopViewController.h"
#import "PopView.h"

@interface ViewController ()
@property (nonatomic , strong)UIButton *popVCBtn;
@property (nonatomic , strong)UIButton *popVBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.popVCBtn];
    [self.view addSubview:self.popVBtn];
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end




//
//  PopViewController.m
//  ShowViewController
//
//  Created by iOS on 2018/7/24.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "PopViewController.h"
#import "PopViewCell.h"

@interface PopViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong)UITableView *popTV;
@property (nonatomic , strong)UIView *shadeV;
@property (nonatomic , strong)NSMutableArray *infoArray;

@end

@implementation PopViewController


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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.shadeV];
    [self.view addSubview:self.popTV];
    UITapGestureRecognizer *tapGesturre = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissPopViewController)];
    [self.shadeV addGestureRecognizer:tapGesturre];
    // Do any additional setup after loading the view.
}
- (void)dismissPopViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.infoArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PopViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kPopViewCell];
    cell.textLabel.text = self.infoArray[indexPath.row];
    return cell;
}
- (UITableView *)popTV{
    if (!_popTV) {
        _popTV = [[UITableView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - self.height, self.view.frame.size.width,self.height) style:UITableViewStylePlain];
        _popTV.delegate = self;
        _popTV.dataSource = self;
        _popTV.backgroundColor = [UIColor grayColor];
        _popTV.tableFooterView = [UIView new];
        [_popTV registerClass:[PopViewCell class] forCellReuseIdentifier:kPopViewCell];
    }
    return _popTV;
}
- (UIView *)shadeV{
    if (!_shadeV) { 
        _shadeV = [[UIView alloc]initWithFrame:self.view.bounds];
        _shadeV.backgroundColor = [UIColor blackColor];
        _shadeV.alpha = 0.7;
    }
    return _shadeV;
}
- (NSMutableArray *)infoArray{
    if (!_infoArray) {
        _infoArray = [[NSMutableArray alloc]init];
        [_infoArray addObject:@"1"];
        [_infoArray addObject:@"2"];
        [_infoArray addObject:@"3"];
        [_infoArray addObject:@"4"];
        [_infoArray addObject:@"5"];
        [_infoArray addObject:@"6"];
    }
    return _infoArray;
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

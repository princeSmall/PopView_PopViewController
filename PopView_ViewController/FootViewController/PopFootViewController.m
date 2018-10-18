//
//  PopFootViewController.m
//  PopView_ViewController
//
//  Created by iOS on 2018/9/20.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "PopFootViewController.h"
#import "PopFootCell.h"

@interface PopFootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong)UITableView *popFootTV;
@property (nonatomic , strong)NSMutableArray *infoArray;
@end

@implementation PopFootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
      [self.view addSubview:self.popFootTV];
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
    PopFootCell * cell = [tableView dequeueReusableCellWithIdentifier:kPopFootCell];
    cell.textLabel.text = self.infoArray[indexPath.row];
    return cell;
}
- (UITableView *)popFootTV{
    if (!_popFootTV) {
        _popFootTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStylePlain];
        _popFootTV.delegate = self;
        _popFootTV.dataSource = self;
        _popFootTV.backgroundColor = [UIColor grayColor];
        _popFootTV.tableFooterView = [UIView new];
        [_popFootTV registerClass:[PopFootCell class] forCellReuseIdentifier:kPopFootCell];
    }
    return _popFootTV;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

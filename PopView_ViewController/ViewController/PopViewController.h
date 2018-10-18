//
//  PopViewController.h
//  ShowViewController
//
//  Created by iOS on 2018/7/24.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PopViewController : UIViewController
@property (nonatomic , assign)CGFloat height;

+ (instancetype)popViewControllerHeight:(CGFloat)height;
@end

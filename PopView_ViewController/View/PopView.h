//
//  PopView.h
//  ShowViewController
//
//  Created by iOS on 2018/7/24.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^myBlock)(BOOL isLeft);
@interface PopView : UIView
@property (nonatomic , strong)myBlock block;
+ (instancetype)popViewblocks:(myBlock)blocks;

@end

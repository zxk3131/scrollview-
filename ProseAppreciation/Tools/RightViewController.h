//
//  RightViewController.h
//  WYApp
//
//  Created by chen on 14-7-17.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TypeSizeViewController.h"
@interface RightViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

//可以旋转的UIImage
@property (nonatomic,retain) UIImageView *headImageView;
/**
 *  旋转动画方法
 */
- (void)headPhotoAnimation;
/**
 *  表格视图
 */
@property(nonatomic,retain)UITableView * tableview;
/**
 *  字号设置
 */
@property(nonatomic,retain)NSString * typesizestring;
/**
 *  头部视图
 */
@property(nonatomic,retain)UIView *headerV;
@end

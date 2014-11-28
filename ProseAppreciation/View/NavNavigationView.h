//
//  NavNavigationView.h
//  NewsFourApp
//
//  Created by 李超峰 on 14-11-5.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavNavigationView : UIView
/**
 *  标题标签
 */
@property(nonatomic,strong) UILabel *titlelabel;
/**
 *  statusBar 视图
 */
@property(nonatomic,strong)UIView *statusBarView;
/**
 *  navView视图
 */
@property(nonatomic,strong)UIView * navView;
@end

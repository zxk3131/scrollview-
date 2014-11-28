//
//  DetailViewController.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
#import "NavNavigationView.h"
#import "Content.h"
@interface DetailViewController : UIViewController
@property(nonatomic,strong)NewsModel * model;//数据类
@property(nonatomic,strong)Content * content;//详情类
@property(nonatomic,strong)NavNavigationView * nav;//导航类
@property(nonatomic,strong)UIFont * typesizeFont;//字体属性
@property(nonatomic,strong)UILabel * timelabel;//时间标题属性
@property(nonatomic,strong)UILabel * authorlabel;//作者标签属性
@property(nonatomic,strong)UILabel * titlelabel;
@end

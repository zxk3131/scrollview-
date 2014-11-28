//
//  ArticleViewController.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/12.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavNavigationView.h"
@interface ArticleViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)UITableView * tableview;
@property(nonatomic,retain)NSString * urlstring;
@property(nonatomic,strong)NavNavigationView * nav;
@property (nonatomic,strong)NSString * titlestring;

@end

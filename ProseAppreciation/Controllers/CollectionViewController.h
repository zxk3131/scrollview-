//
//  CollectionViewController.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-8.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Theme.h"
#import "NavNavigationView.h"
@interface CollectionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)UITableView * tableview;
@property(nonatomic,retain)NavNavigationView * nav;
@end

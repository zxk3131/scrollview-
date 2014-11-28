//
//  TypeSizeViewController.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/10.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavNavigationView.h"
#import "Theme.h"
@interface TypeSizeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)UITableView * tableview;
@property(nonatomic,retain)NavNavigationView * nav;
@end

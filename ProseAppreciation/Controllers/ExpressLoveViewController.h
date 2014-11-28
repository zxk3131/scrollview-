//
//  ExpressLoveViewController.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpressLoveViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
/**
 *  表格视图属性
 */
@property(nonatomic,retain)UITableView * tableview;
/**
 *  网站地址属性
 */
@property(nonatomic,retain)NSString * urlstring;

@property (nonatomic,assign)int type;
-(void)headerRereshing;
@end

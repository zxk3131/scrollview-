//
//  ExpressLoveViewController.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "ExpressLoveViewController.h"
#import "TFHpple.h"
#import "Model.h"
#import "DetailViewController.h"
#import "QHSliderViewController.h"
#import "HtmlParse.h"
#import "ExpressLoveTableViewCell.h"
#import "Content.h"
#import "HtmlParse+DetailContent.h"
#import "HeaderURL.h"
#import "MJRefresh.h"
#import "MBProgressHUD+MJ.h"
#import "NewsModel.h"
#import "UIImageView+WebCache.h"
@interface ExpressLoveViewController ()
/**
 *  数据数组数组
 */
@property(nonatomic,retain)NSMutableArray * array;
/**
 *  详情页数组
 */
@property(nonatomic,retain)NSMutableArray * contentArray;

@end

@implementation ExpressLoveViewController
/**
 *  初始化方法
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _array = [[NSMutableArray alloc]init];
    }
    return self;
}
/**
 *  视图加载
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-104)];
    tableview.delegate =self;
    tableview.rowHeight = 100;
    tableview.dataSource =self;
    self.tableview =tableview;
    tableview.tableFooterView = [[UIView alloc]init];
    [self.tableview addFooterWithTarget:self action:@selector(footerRereshing)];
    [_tableview addHeaderWithTarget:self action:@selector(headerRereshing)];
    [_tableview headerBeginRefreshing];
    [self.view addSubview:tableview];
}
/**
 *  下拉刷新
 */
-(void)headerRereshing
{
    
    NSString * urlstr = [NSString stringWithFormat:@"%@0-20.html",_urlstring];
    HtmlParse_DetailContent * html = [[HtmlParse_DetailContent alloc]init];
    [html listContentWithlist_url:urlstr successRequest:^(id data) {
        [_array removeAllObjects];
        NSString * str = [self.urlstring substringWithRange:NSMakeRange(self.urlstring.length-15, 14)];
        NSDictionary * tempdic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray * array = [tempdic objectForKey:str];
        for (int i = 0; i<array.count; i++) {
            NSDictionary * dic = array[i];
            NewsModel * newsModel = [[NewsModel alloc]init];
            if (([dic objectForKey:@"imgextra"] == nil) && ([dic objectForKey:@"editor"]== nil) && ([dic objectForKey:@"skipType"]==nil)) {
                [newsModel setValuesForKeysWithDictionary:dic];
                [_array addObject:newsModel];
            }
        }
        
       dispatch_async(dispatch_get_main_queue(), ^{
           [_tableview headerEndRefreshing];
           [_tableview reloadData];
       });
    }];
}
/**
 *  上拉加载
 */
-(void)footerRereshing
{
    static int i = 0;
    i += 20;
    NSString * urlstr = [NSString stringWithFormat:@"%@%d-20.html",_urlstring,i];
    HtmlParse_DetailContent * html = [[HtmlParse_DetailContent alloc]init];
   [html listContentWithlist_url:urlstr successRequest:^(id data) {
       NSString * str = [self.urlstring substringWithRange:NSMakeRange(self.urlstring.length-15, 14)];
       NSDictionary * tempdic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
       NSArray * array = [tempdic objectForKey:str];
       for (int i = 0; i<array.count; i++) {
           NSDictionary * dic = array[i];
           NewsModel * newsModel = [[NewsModel alloc]init];
           if (([dic objectForKey:@"imgextra"] == nil) && ([dic objectForKey:@"editor"]== nil) && ([dic objectForKey:@"skipType"]==nil)) {
               [newsModel setValuesForKeysWithDictionary:dic];
               [_array addObject:newsModel];
           }
       }
       dispatch_async(dispatch_get_main_queue(), ^{
           [_tableview footerEndRefreshing];
           [_tableview reloadData];
       });
   }];
 
}
/**
 *  内存警告
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
/**
 *  对象个数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}
/**
 *  cell创建方法
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExpressLoveTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil)
    {
         cell = [[ExpressLoveTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NewsModel * model = [_array objectAtIndex:indexPath.row];
    cell.titlelabel.text = model.title;
    cell.contentlabel.text =model.digest;
    [cell.imgview sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"temp.png"]];
    return cell;
}
/**
 *  分组个数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
/**
 *  点击cell触发事件
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * aiqingVC = [[DetailViewController alloc]init];
    NewsModel* model = [_array objectAtIndex:indexPath.row];
    aiqingVC.model = model;
    [[QHSliderViewController sharedSliderController].navigationController pushViewController:aiqingVC animated:YES];
}

@end

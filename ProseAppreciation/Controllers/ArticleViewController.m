//
//  ArticleViewController.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/12.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "ArticleViewController.h"
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
@interface ArticleViewController ()

@property(nonatomic,retain)NSMutableArray * array;
@property(nonatomic,retain)NSMutableArray * contentArray;
@end

@implementation ArticleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _array = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NavNavigationView * nav = [[NavNavigationView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    nav.titlelabel.text = _titlestring;
    self.nav =nav;
    [self.view addSubview:nav];
    /**
     *  返回按钮
     */
    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lbtn setFrame:CGRectMake(20, 27, 30, 30)];
    [lbtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [lbtn setBackgroundImage:[UIImage imageNamed:@"back_highlighted"] forState:UIControlStateHighlighted];
    [lbtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [nav addSubview:lbtn];
    
    UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height-64)];
    tableview.delegate =self;
    tableview.rowHeight = 100;
    tableview.dataSource =self;
    self.tableview =tableview;
    [self.view addSubview:tableview];
    [self.tableview addFooterWithTarget:self action:@selector(footerRereshing)];
    [_tableview addHeaderWithTarget:self action:@selector(headerRereshing)];
    [_tableview headerBeginRefreshing];
}
- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)headerRereshing
{
    
    NSString * urlstr = [NSString stringWithFormat:@"%@&pageno=1",_urlstring];
    HtmlParse_DetailContent * html = [[HtmlParse_DetailContent alloc]init];
    [html listContentWithlist_url:urlstr successRequest:^(id data) {
        [_array removeAllObjects];
        self.array = data;
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableview headerEndRefreshing];
            [_tableview reloadData];
        });
    }];
}
-(void)footerRereshing
{
    static int i = 2;
    NSString * urlstr = [NSString stringWithFormat:@"%@&pageno=%d",_urlstring,i];
    HtmlParse_DetailContent * html = [[HtmlParse_DetailContent alloc]init];
    [html listContentWithlist_url:urlstr successRequest:^(id data) {
        i++;
        NSArray * array =[[NSArray alloc]init];
        array = data;
        for (int i = 0; i<array.count; i++)
        {
            Model * model =  [array objectAtIndex:i];
            [_array addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableview footerEndRefreshing];
            [_tableview reloadData];
        });
    }];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExpressLoveTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil)
    {
        cell = [[ExpressLoveTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    Model * model = [_array objectAtIndex:indexPath.row];
    cell.titlelabel.text = model.titile;
    cell.contentlabel.text =model.contant;
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * aiqingVC = [[DetailViewController alloc]init];
    Model * model = [_array objectAtIndex:indexPath.row];
    aiqingVC.model = model;
    [[QHSliderViewController sharedSliderController].navigationController pushViewController:aiqingVC animated:YES];
}
@end

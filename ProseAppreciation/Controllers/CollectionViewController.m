//
//  CollectionViewController.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-8.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "CollectionViewController.h"
#import "NavNavigationView.h"
#import "QHSliderViewController.h"
#import "ModelDBanager.h"
#import "Model.h"
#import "Theme.h"
#import "DetailViewController.h"
@interface CollectionViewController ()
@property(nonatomic,retain)NSMutableArray * dataArray;
@end

@implementation CollectionViewController
/**
 *  初始化
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
     
        self.view.backgroundColor = [UIColor whiteColor];
        NavNavigationView * nav = [[NavNavigationView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
        self.nav =nav;
        [nav.titlelabel setText:@"我的收藏"];
        [self.view addSubview:nav];
        UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [lbtn setFrame:CGRectMake(20, 27, 30, 30)];
        [lbtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [lbtn setBackgroundImage:[UIImage imageNamed:@"back_highlighted"] forState:UIControlStateHighlighted];
        [lbtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        [nav addSubview:lbtn];
        
        UIButton *rbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [rbtn setFrame:CGRectMake(260, 27, 40, 30)];
        [rbtn setTitle:@"编辑" forState:UIControlStateNormal];
        [rbtn addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
        [nav addSubview:rbtn];
    }
    return self;
}
/**
 *  将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
   self.dataArray=[[NSMutableArray alloc]init];
   self.dataArray = [NSMutableArray arrayWithArray:[ModelDBanager selectAllModels]];
    [Theme themeSettingWithNav:self.nav];
    [_tableview reloadData];
}
/**
 *  编辑按钮事件
 */
-(void)editAction:(UIButton *)sender
{
    if (!sender.selected)
    {
        [self.tableview setEditing:YES animated:YES];
        [sender setTitle:@"完成" forState:UIControlStateNormal];
    }else
    {
        [self.tableview setEditing:NO animated:YES];
        [sender setTitle:@"编辑" forState:UIControlStateNormal];
    }
    sender.selected = !sender.selected;
}
/**
 *  视图加载
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - _nav.frame.size.height)];
    tableview.delegate =self;
    tableview.dataSource =self;
    self.tableview =tableview;
    [self.view addSubview:tableview];
    
}
/**
 *  分组
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
/**
 *  多少个
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
/**
 *  cell创建
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    Model * model = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = model.titile;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}
/**
 *  内存警告
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
/**
 *  返回按钮
 */
- (void)backAction:(id)sender
{
   [self.navigationController popViewControllerAnimated:YES];
}
//删除cell
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //先删除cell中得数据
        //在对tableVIew进行删除操作时,一定要先删除数据在删除cell
        Model  * activity = [_dataArray objectAtIndex:indexPath.row];
        [ModelDBanager deleteModelWithTitle:activity.titile];
        [_dataArray removeObjectAtIndex:indexPath.row];
        //再删除cell对象
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }
}
/**
 *  cell触发事件
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * detailVC = [[DetailViewController alloc]init];
    detailVC.model = [_dataArray objectAtIndex:indexPath.row];
    [[QHSliderViewController sharedSliderController].navigationController pushViewController:detailVC animated:YES];
}

@end

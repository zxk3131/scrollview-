//
//  ThemeViewController.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/10.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "ThemeViewController.h"
#import "NavNavigationView.h"
#import "Theme.h"
#import "QHSliderViewController.h"
#import "MainAppViewController.h"


@interface ThemeViewController ()

@end

@implementation ThemeViewController
/**
 *  cell相应事件
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Theme currenttheme].index = indexPath.row;
    [tableView reloadData];
    NSString * typesizestring = [NSString stringWithFormat:@"%d",indexPath.row];
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:typesizestring forKey:@"theme"];
    [userdefaults synchronize];
    
    int j = [Theme currenttheme].index;
    _nav.navView.backgroundColor = [[Theme systemThemes] objectAtIndex:j];
    _nav.statusBarView.backgroundColor =[[Theme systemThemes] objectAtIndex:j];
//    MainAppViewController * main =  (MainAppViewController *)[QHSliderViewController sharedSliderController].MainVC;
//    [ Theme themeSettingWithNav:main.nav];
}
/**
 *  初始化
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        NavNavigationView * nav = [[NavNavigationView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
        self.nav =nav;
        [nav.titlelabel setText:@"主题设置"];
        [self.view addSubview:nav];
        UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [lbtn setFrame:CGRectMake(20, 27, 30, 30)];
        [lbtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [lbtn setBackgroundImage:[UIImage imageNamed:@"back_highlighted"] forState:UIControlStateHighlighted];
        [lbtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        [nav addSubview:lbtn];
    }
    return self;
}
/**
 *  将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    [Theme themeSettingWithNav:self.nav];
}
/**
 *  返回按钮
 */
- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
/**
 *  视图加载
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height- 44) style:UITableViewStyleGrouped];
    tableview.delegate =self;
    tableview.dataSource =self;
    self.tableview =tableview;
    [self.view addSubview:tableview];
}
/**
 *  rows
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
/**
 *  Sections
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
/**
 *  创建cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == [[[NSUserDefaults standardUserDefaults] valueForKey:@"theme"] intValue])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    NSArray * array = [NSArray arrayWithObjects:@"默认",@"淡蓝色",@"高级黑",@"橙色",nil];
    cell.textLabel.text =  [array objectAtIndex:indexPath.row];
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


@end

//
//  TypeSizeViewController.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/10.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "TypeSizeViewController.h"
#import "NavNavigationView.h"
#import "TypeSize.h"
@interface TypeSizeViewController ()
@property (nonatomic, retain) NSIndexPath *selectedIndexPath;


@end

@implementation TypeSizeViewController
/**
 *  cell触发事件
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  创建单例
     */
    [TypeSize currentTypeSize].index = indexPath.row;
    [tableView reloadData];//刷新
    NSString * typesizestring = [NSString stringWithFormat:@"%d",indexPath.row];
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:typesizestring forKey:@"typesize"];
    [userdefaults synchronize];
    

}
/**
 *  将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    [Theme themeSettingWithNav:self.nav];
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
        [nav.titlelabel setText:@"正文字号"];
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
    return 3;
}
/**
 *  分组
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
    if (indexPath.row == [[[NSUserDefaults standardUserDefaults] valueForKey:@"typesize"] intValue])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;

    }
    NSArray * array = [NSArray arrayWithObjects:@"小", @"中",@"大",nil];

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

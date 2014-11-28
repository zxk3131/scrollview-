//
//  AboutViewController.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/10.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "AboutViewController.h"
#import "NavNavigationView.h"
@interface AboutViewController ()

@end

@implementation AboutViewController
/**
 *  初始化
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        NavNavigationView * nav = [[NavNavigationView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
        self.nav = nav;
        [nav.titlelabel setText:@"关于我们"];
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
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 80)/2,124, 80, 80)];
    imageview.layer.masksToBounds = YES;
    imageview.layer.cornerRadius = 10;
    imageview.image = [UIImage imageNamed:@"icon_2x.png"];
    [self.view addSubview:imageview];
    
    UILabel * titlelabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 150)/2, 220, 150, 40)];
    titlelabel.text =@"诗歌散文";
    titlelabel.font = [UIFont systemFontOfSize:22];
    titlelabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titlelabel];
    
    UILabel * contentlabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 150)/2, 260, 150, 40)];
    contentlabel.text =@"陪你走向文学之路";
    contentlabel.textColor = [UIColor grayColor];
    contentlabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:contentlabel];
  
    UILabel * versionlabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2, self.view.frame.size.height - 50, 200, 40)];
    versionlabel.textColor = [UIColor grayColor];
    versionlabel.textAlignment = NSTextAlignmentCenter;
    versionlabel.text = @"Version1.0 Build in Lanou";
    versionlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:versionlabel];
    
    
}
/**
 *  将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    [Theme themeSettingWithNav:self.nav];
}
/**
 *  内存警告
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end

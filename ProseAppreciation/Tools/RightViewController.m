//
//  RightViewController.m
//  WYApp
//
//  Created by chen on 14-7-17.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "RightViewController.h"
#import "CollectionViewController.h"
#import "TypeSizeViewController.h"
#import "ThemeViewController.h"
#import "AboutViewController.h"
@implementation RightViewController
/**
 *  视图加载
 */
- (void)viewDidLoad
{
    /**
     *  背景颜色
     */
    [self.view setBackgroundColor:[UIColor clearColor]];
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*0.4)];
    self.headerV = headerV;
    headerV.backgroundColor = RGBA(212,25,38,1);
    [self.view addSubview:headerV];
    /**
     *  返回按钮
     */
    UIButton *backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backbtn setFrame:CGRectMake(20, 17, 50, 50)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_close"] forState:UIControlStateNormal];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_close_highlighted"] forState:UIControlStateHighlighted];
    [backbtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerV addSubview:backbtn];
    
    // 头像
    _headImageView = [[UIImageView alloc] init];
    _headImageView.backgroundColor = [UIColor clearColor];
    _headImageView.frame = CGRectMake(self.view.center.x - 25, 44, 50, 50);
    _headImageView.layer.cornerRadius = _headImageView.frame.size.width/2;
    _headImageView.layer.borderWidth = 1.0;
    _headImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _headImageView.layer.masksToBounds = YES;
    _headImageView.image = [UIImage imageNamed:@"head1.jpg"];
    [headerV addSubview:_headImageView];
    _headImageView.userInteractionEnabled = YES;
    /**
     *  标题标签
     */
    UILabel * collectionlabel = [[UILabel alloc] init];
    collectionlabel.frame = CGRectMake(40, headerV.frame.size.height - 70, 240, 40) ;
    collectionlabel.text = @"诗歌散文";
    collectionlabel.font = [UIFont systemFontOfSize:23];
    collectionlabel.textAlignment = NSTextAlignmentCenter;
    collectionlabel.textColor = [UIColor whiteColor];
    [headerV addSubview:collectionlabel];
    /**
     *  tap手势
     */
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] init];
    singleTapRecognizer.numberOfTapsRequired = 1;//点击一次
    [singleTapRecognizer addTarget:self action:@selector(headPhotoAnimation)];
    [_headImageView addGestureRecognizer:singleTapRecognizer];
    //中部视图的建立
    UIView *middleV = [[UIView alloc] initWithFrame:CGRectMake(0, headerV.frame.size.height, headerV.frame.size.width, self.view.frame.size.height* 0.5)];
    [middleV setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:middleV];
    /**
     *  中部视图贴了一个表格视图
     */
    UITableView * midtableview = [[UITableView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height*0.4, self.view.frame.size.width, CGRectGetHeight(self.view.frame) * 0.9 -self.view.frame.size.height*0.4)];
    self.tableview =midtableview;
    midtableview.scrollEnabled =NO;
    midtableview.delegate =self;
    midtableview.dataSource =self;
    midtableview.rowHeight = midtableview.frame.size.height/5;
    [self.view addSubview:midtableview];
    /**
     *  划了一条分割线
     */
    UIImageView *lineIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) * 0.9, CGRectGetWidth(self.view.frame), 0.5)];
    [lineIV setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:lineIV];
    /**
     *  尾部视图
     */
    UIView *footV = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineIV.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetMaxY(lineIV.frame))];
    [footV setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:footV];
}
/**
 *  视图将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    /**
     *  设置字体的label 值
     */
    int i = [[[NSUserDefaults standardUserDefaults] valueForKey:@"typesize"] intValue];
    switch (i) {
        case 0:
            _typesizestring = @"小";
            break;
        case 1:
           _typesizestring= @"中";
            break;
        case 2:
           _typesizestring = @"大";
            break;
        default:
            break;
    }
    //刷新
    [_tableview reloadData];
    /**
     *  主题设置
     */
    int j = [[[NSUserDefaults standardUserDefaults]valueForKey:@"theme"] intValue];
    _headerV.backgroundColor = [[Theme systemThemes] objectAtIndex:j];
    _headerV.backgroundColor =[[Theme systemThemes] objectAtIndex:j];

}
/**
 *  创建cell方法
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSArray * titileArray = [NSArray arrayWithObjects:@"我的收藏",@"正文字号",@"主题设置",@"关于我们",@"版本信息", nil];
    cell.textLabel.text = [titileArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    switch (indexPath.row)
    {
        case 0:
        {
            cell.imageView.image = [UIImage imageNamed:@"collection"];
        }
            break;
        case 1:
        {
            cell.detailTextLabel.text =_typesizestring;
            cell.imageView.image = [UIImage imageNamed:@"typesize"];
        }
            break;
        case 2:
        {
            cell.imageView.image = [UIImage imageNamed:@"theme"];
        }
            break;
        case 3:
        {
            cell.imageView.image = [UIImage imageNamed:@"about"];
        }
            break;
        case 4:
        {
            cell.imageView.image = [UIImage imageNamed:@"version"];
            cell.detailTextLabel.text = @"1.0";
        }
            break;
        default:
            break;
    }
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
/**
 *  头部动画方法
 */
- (void)headPhotoAnimation
{
    [self rotate360WithDuration:2.0 repeatCount:1];
    _headImageView.animationDuration = 2.0;
    _headImageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"head1.jpg"],
                                      [UIImage imageNamed:@"head2.jpg"],[UIImage imageNamed:@"head2.jpg"],
                                      [UIImage imageNamed:@"head2.jpg"],[UIImage imageNamed:@"head2.jpg"],
                                      [UIImage imageNamed:@"head1.jpg"], nil];
    _headImageView.animationRepeatCount = 1;
    [_headImageView startAnimating];
}
/**
 *  动画360旋转
 */
- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount
{
	CAKeyframeAnimation *theAnimation = [CAKeyframeAnimation animation];
	theAnimation.values = [NSArray arrayWithObjects:
						   [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
						   [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0,1,0)],
						   [NSValue valueWithCATransform3D:CATransform3DMakeRotation(2*M_PI, 0,1,0)],
						   nil];
	theAnimation.cumulative = YES;
	theAnimation.duration = aDuration;
	theAnimation.repeatCount = aRepeatCount;
	theAnimation.removedOnCompletion = YES;
	[_headImageView.layer addAnimation:theAnimation forKey:@"transform"];
}
/**
 *  返回按钮方法
 */
- (void)backAction:(id)sender
{
    [[QHSliderViewController sharedSliderController] closeSideBar];
}
/**
 *  点击cell触发事件
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
            /**
             *  我的收藏
             */
        case 0:
        {
            CollectionViewController * collectionVC = [[CollectionViewController alloc]init];
            [[QHSliderViewController sharedSliderController].navigationController pushViewController:collectionVC animated:YES];
        }
            break;
            /**
             *  正文字号
             */
        case 1:
        {
            TypeSizeViewController * typesizeVC = [[TypeSizeViewController alloc]init];
            [[QHSliderViewController sharedSliderController].navigationController pushViewController:typesizeVC animated:YES];
        }
            break;
            /**
             *  主题设置
             */
        case 2:
        {
            ThemeViewController * themeVC = [[ThemeViewController alloc]init];
            [[QHSliderViewController sharedSliderController].navigationController pushViewController:themeVC animated:YES];
        }
            break;
            /**
             *  关于我们
             */
        case 3:
        {
            AboutViewController * aboutVC = [[AboutViewController alloc]init];
            [[QHSliderViewController sharedSliderController].navigationController pushViewController:aboutVC animated:YES];
        }
            break;
        default:
            break;
    }
}
@end

//
//  LeftViewController.m
//  WYApp
//
//  Created by chen on 14-7-17.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "LeftViewController.h"
#import "CollectionViewController.h"
#import "ThemeViewController.h"
#import "ArticleViewController.h"
#import "MainAppViewController.h"
#import "HeaderURL.h"
@interface LeftViewController ()
{
    NSArray *_arData;
}

@end

@implementation LeftViewController
/**
 *  将要显示时刷新主题
 */
-(void)viewWillAppear:(BOOL)animated
{
    int j = [[[NSUserDefaults standardUserDefaults]valueForKey:@"theme"] intValue];
    self.view.backgroundColor = [[Theme systemThemes] objectAtIndex:j];
}
/**
 *  视图加载
 */
- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor blackColor]];
    /**
     *  列表标题
     */
    _arData = @[@"美文鉴赏",@"原创文章",@"原创诗歌",@"收藏",];
    /**
     *  主题按钮
     */
    UIButton *toNewViewbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [toNewViewbtn setFrame:CGRectMake(CGRectGetWidth(self.view.frame) - 190, CGRectGetHeight(self.view.frame) - 60, 80, 30)];
    [toNewViewbtn addTarget:self action:@selector(toNewViewbtn:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView * themeimageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    themeimageview.image = [UIImage imageNamed:@"theme"];
    [toNewViewbtn addSubview:themeimageview];
    UILabel * themlabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, 40, 30)];
    themlabel.text =@"换肤";
    themlabel.textColor = [UIColor whiteColor];
    themlabel.font = [UIFont systemFontOfSize:12];
    [toNewViewbtn addSubview:themlabel];
    [self.view addSubview:toNewViewbtn];
    /**
     *  创建按钮
     */
    __block float h = self.view.frame.size.height*0.7/[_arData count];
    __block float y = 0.15*self.view.frame.size.height;
    [_arData enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop)
    {
        UIButton *listV = [[UIButton alloc] initWithFrame:CGRectMake(69, y, 100, h-20)];
        listV.tag =idx;
        [listV addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [listV setBackgroundColor:[UIColor clearColor]];
        UILabel * l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, listV.frame.size.width, listV.frame.size.height)];
        [l setFont:[UIFont systemFontOfSize:16]];
        [l setTextColor:[UIColor whiteColor]];
        l.textAlignment = NSTextAlignmentCenter;
        [l setBackgroundColor:[UIColor clearColor]];
        [l setText:obj];
        [listV addSubview:l];
        [self.view addSubview:listV];
        y += h;
    }];
}
/**
 *  触发事件
 *
 *  @param sender tag值
 */
-(void)click:(UIButton *)sender
{
    switch (sender.tag)
    {
            /**
             *  默认首页
             */
        case 0:
        {
            [[QHSliderViewController sharedSliderController] closeSideBar];
        }
            break;
            /**
             *  原创文章首页
             */
        case 1:
        {
            ArticleViewController * articleVC = [[ArticleViewController alloc]init];
//            articleVC.urlstring  =LIST_URL_ORIGINAL_ARTILE;
            articleVC.titlestring =@"原创文章";
            [[QHSliderViewController sharedSliderController].navigationController pushViewController:articleVC animated:YES];
            [[QHSliderViewController sharedSliderController] closeSideBar];
            [[QHSliderViewController sharedSliderController] closeSideBar];
        }
            break;
            /**
             *  原创诗歌首页
             */
        case 2:
        {
            ArticleViewController * articleVC = [[ArticleViewController alloc]init];
            articleVC.titlestring =@"原创诗歌";
//            articleVC.urlstring  = LIST_URL_ORIGINAL_POETRY;
            [[QHSliderViewController sharedSliderController].navigationController pushViewController:articleVC animated:YES];
            [[QHSliderViewController sharedSliderController] closeSideBar];
        }
            break;
            /**
             *  收藏首页
             */
        case 3:
        {
            CollectionViewController * collectionVC = [[CollectionViewController alloc]init];
                [[QHSliderViewController sharedSliderController].navigationController pushViewController:collectionVC animated:YES];
                [[QHSliderViewController sharedSliderController] closeSideBar];
        }
            break;
        default:
            break;
            
    }
}
/**
 *  主题设置事件
 */
- (void)toNewViewbtn:(UIButton *)btn
{
    ThemeViewController * themeVC =[[ThemeViewController alloc]init];
    [[QHSliderViewController sharedSliderController].navigationController pushViewController:themeVC animated:YES];
    [[QHSliderViewController sharedSliderController] closeSideBar];

}

@end

//
//  NavNavigationView.m
//  NewsFourApp
//
//  Created by 李超峰 on 14-11-5.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "NavNavigationView.h"
#import "Theme.h"
@implementation NavNavigationView
/**
 *  视图初始化
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        UIView *statusBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.frame.size.width, 0.f)];
        self.statusBarView =statusBarView;
        /**
         *  系统适配
         */
        if (isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)
        {
            statusBarView.frame = CGRectMake(statusBarView.frame.origin.x, statusBarView.frame.origin.y, statusBarView.frame.size.width, 20.f);
            statusBarView.backgroundColor = [UIColor clearColor];
            ((UIImageView *)statusBarView).backgroundColor = RGBA(212,25,38,1);
            [self addSubview:statusBarView];
        }
        //导航View
        UIView * navView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, StatusbarSize, self.frame.size.width, 44.f)];
        self.navView =navView;
        ((UIImageView *)navView).backgroundColor = RGBA(212,25,38,1);
        [self insertSubview:navView belowSubview:statusBarView];
        navView.userInteractionEnabled = YES;
       //标题标签
        UILabel * titlelabel = [[UILabel alloc] initWithFrame:CGRectMake((navView.frame.size.width - 200)/2, (navView.frame.size.height - 40)/2, 200, 40)];
        self.titlelabel = titlelabel;
        [titlelabel setTextAlignment:NSTextAlignmentCenter];
        [titlelabel setTextColor:[UIColor whiteColor]];
        [titlelabel setFont:[UIFont boldSystemFontOfSize:16]];
        [titlelabel setBackgroundColor:[UIColor clearColor]];
        [navView addSubview:titlelabel];
        [self addSubview:navView];
        /**
         *  初始化主题
         */
//        int j = [[[NSUserDefaults standardUserDefaults]valueForKey:@"theme"] intValue];
//        self.navView.backgroundColor = [[Theme systemThemes] objectAtIndex:j];
//        self.statusBarView.backgroundColor =[[Theme systemThemes] objectAtIndex:j];
    }
    return self;
}

@end

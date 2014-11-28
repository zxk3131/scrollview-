//
//  Theme.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/10.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "Theme.h"
#import "HeaderURL.h"
@implementation Theme
/**
 *  创建单例
 */
+ (Theme *)currenttheme
{
    static Theme * theme = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        theme = [[self alloc] init];
    });
    return theme;
}
/**
 *  主题数组
 */
+(NSArray *)systemThemes {
	NSMutableArray * themeArray = [[NSMutableArray alloc] init];
	[themeArray addObject:ThemeNameDefault];
	[themeArray addObject:ThemeNameRed];
	[themeArray addObject:ThemeNameNight];
	[themeArray addObject:ThemeNameOrange];
	return themeArray;
}
/**
 *  更新主题类方法
 */
+(void)themeSettingWithNav:(NavNavigationView *)nav
{
    int j = [[[NSUserDefaults standardUserDefaults]valueForKey:@"theme"] intValue];
    nav.navView.backgroundColor = [[Theme systemThemes] objectAtIndex:j];
    nav.statusBarView.backgroundColor =[[Theme systemThemes] objectAtIndex:j];
}
@end

//
//  Theme.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/10.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavNavigationView.h"
@interface Theme : NSObject
/**
 *  创建单例
 */
+ (Theme *)currenttheme;
/**
 * 下标
 */
@property(nonatomic,assign) int index;
/**
 *  主题数组
 */
+ (NSArray *)systemThemes;
/**
 *  更新主题类方法
 */
+(void)themeSettingWithNav:(NavNavigationView *)nav;
@end

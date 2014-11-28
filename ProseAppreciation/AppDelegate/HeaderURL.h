//
//  HeaderURL.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-7.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#ifndef ProseAppreciation_HeaderURL_h
#define ProseAppreciation_HeaderURL_h



//全屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//全屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕减去navigationBar的高度
#define MAIN_NAV_HEIGHT (SCREEN_HEIGHT - 64)

#define CACHE_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define DIRECTORY_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0]

#define LIBRARY_PATH [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject]

//downloadConfig
#define DownLoadConfig [CACHE_PATH stringByAppendingPathComponent:@"downloadConfig"]

//收藏状态
#define ShouCangConfig [CACHE_PATH stringByAppendingPathComponent:@"shoucang"]

//无网状态缓存
#define NoNetWork_Caches [CACHE_PATH stringByAppendingPathComponent:@"NoNetWork"]


#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
/**
 *  头条
 */
#define LIST_URL_TOUTIAO @"http://c.m.163.com/nc/article/headline/T1348647853363/"
#define TOUTIAO @"T1348647853363"

/**
 *  娱乐
 */
#define LIST_URL_YULE @"http://c.m.163.com/nc/article/list/T1348648517839/"
#define YULE @"T1348648517839"
/**
 *  体育
 */
#define LIST_URL_TIYU @"http://c.m.163.com/nc/article/list/T1348649079062/"
#define TIYU @"T1348649079062"
/**
 *  财经
 */
#define LIST_URL_CAIJING @"http://c.m.163.com/nc/article/list/T1348648756099/"
#define CAIIJNG @"T1348648756099"
/**
 *  科技
 */
#define LIST_URL_KEJI @"http://c.m.163.com/nc/article/list/T1348649580692/"
#define KEJI @"T1348649580692"
/**
 *  汽车
 */
#define LIST_URL_QICHE @"http://c.m.163.com/nc/article/list/T1348654060988/"
#define QICHE @"T1348654060988"
/**
 *  时尚
 */
#define LIST_URL_SHISHANG @"http://c.m.163.com/nc/article/list/T1348650593803/"
#define SHISHANG @"T1348650593803"


/**
 *  轻松一刻
 */
#define LIST_URL_QINGSONG @"http://c.m.163.com/nc/article/list/T1350383429665/"
#define QINGSONG @"T1350383429665"
/**
 *  军事
 */
#define LIST_URL_JUNSHI @"http://c.m.163.com/nc/article/list/T1348648141035/"
#define JUNSHI @"T1348648141035"
/**
 *  历史
 */
#define LIST_URL_LISHI @"http://c.m.163.com/nc/article/list/T1368497029546/"
#define LISHI @"T1368497029546"
/**
 *  游戏
 */
#define LIST_URL_YOUXI @"http://c.m.163.com/nc/article/list/T1348654151579/"
#define YOUXI @"T1348654151579"

//精选
#define LIST_URL_JINGXUAN @"http://c.m.163.com/nc/article/list/T1370583240249/"
#define JINGXUAN @"T1370583240249"


//标题数组
#define BIAOTI_ARR @[@"头条", @"娱乐", @"体育", @"财经", @"科技", @"汽车", @"时尚",@"军事",@"历史",@"游戏",@"精选"]

#define TITLE_ARR @[LIST_URL_TOUTIAO,LIST_URL_YULE,LIST_URL_TIYU,LIST_URL_CAIJING,LIST_URL_KEJI,LIST_URL_QICHE,LIST_URL_SHISHANG,LIST_URL_JUNSHI,LIST_URL_LISHI,LIST_URL_YOUXI,LIST_URL_JINGXUAN]

//详情(ABH3MV4400031H2L/full.html)
#define XIANGQING_URL @"http://c.m.163.com/nc/article/"


/**
 *  字号设置
 */
#define NewsContentsFontSizeLittle 12.0
#define NewsContentsFontSizeNormal 16.0
#define NewsContentsFontSizeLarge 18.0
/**
 *  主题设置
 */
#define ThemeNameDefault [UIColor colorWithRed:212/255.f green:25/255.f blue:38/255.f alpha:1]
#define ThemeNameRed [UIColor colorWithRed:104/255.f green:213/255.f blue:247/255.f alpha:1]
#define ThemeNameNight [UIColor blackColor]
#define ThemeNameOrange  [UIColor orangeColor]


#endif

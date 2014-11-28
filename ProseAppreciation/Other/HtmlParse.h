//
//  HtmlParse.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
@interface HtmlParse : NSObject
@property(nonatomic,retain)NSArray * array;
/**
 *  返回TFHpple 所用的数组
 *
 *  @param urlstring   网址
 *  @param querystring 所要解析的全局搜索的标签 例如://div[@class='nav']/a
 *
 *  @return 数组 NSArray
 */
+(NSArray *)htmlParseWithtutorialsUrlString:(NSString *)urlstring  tutorialsXpathQueryString:(NSString *)querystring;
@end

//
//  HtmlParse.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "HtmlParse.h"

@implementation HtmlParse

/**
 *  返回TFHpple 所用的数组
 *
 *  @param urlstring   网址
 *  @param querystring 所要解析的全局搜索的标签 例如://div[@class='nav']/a
 *
 *  @return 数组 NSArray
 */
+(NSArray *)htmlParseWithtutorialsUrlString:(NSString *)urlstring  tutorialsXpathQueryString:(NSString *)querystring
{
 
        NSURL *tutorialsUrl = [NSURL URLWithString :urlstring];
        NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
        TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
        NSString *tutorialsXpathQueryString = querystring;
        NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    
    return tutorialsNodes;
}

@end

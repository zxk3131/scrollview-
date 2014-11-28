//
//  HtmlParse+DetailContent.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "Content.h"

typedef void(^NetWorkBlock)(id data);

@interface HtmlParse_DetailContent : NSObject

@property (nonatomic,copy)NetWorkBlock netWorkBlcok;

/**
 *  请求详情页的数据
 *
 *  @param detail_url 详情页的网址
 *
 *  @return NSString 正文;
 */
+(void)detailContentWithdetail_url:(NSString *)detail_url successRequest:(NetWorkBlock)netWorkBlock;
/**
 *  返回列表的数据
 *
 *  @param list_url 列表页的网址
 *
 *  @return NSMutableArray 数组
 */
-(void)listContentWithlist_url:(NSString *)list_url successRequest:(NetWorkBlock ) netWorkBlock;

@end

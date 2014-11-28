//
//  HtmlParse+DetailContent.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "HtmlParse+DetailContent.h"
#import "HtmlParse.h"
#import "Model.h"
#import "MBProgressHUD+MJ.h"


@implementation HtmlParse_DetailContent

/**
 *  请求详情页的数据
 *
 *  @param detail_url 详情页的网址
 *
 *  @return NSString 正文;
 */
+(void)detailContentWithdetail_url:(NSString *)detail_url successRequest:(NetWorkBlock)netWorkBlock
{
    Content * content = [[Content alloc]init];
    NSString * urlstr = [NSString stringWithFormat:@"http://m.duwenzhang.com/%@",detail_url];
    NSURL *tutorialsUrl = [NSURL URLWithString:urlstr];
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:tutorialsUrl];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:data];
        NSString * str = @"";
        NSString *tutorialsXpathQueryString = @"//p";
        NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
        for (TFHppleElement *element in tutorialsNodes)
        {
            for (TFHppleElement * secondelement in element.children)
            {
                if ([secondelement.tagName isEqualToString:@"text"])
                {
                    NSString * str1 = [NSString stringWithFormat:@"%@",secondelement.content];
                    str = [str stringByAppendingString:[NSString stringWithFormat:@"%@\n",str1]];
                }
            }
            NSString *tutorialsXpathQueryStringtimeandtapcout = @"//div[@class = 'con']";
            NSArray *tutorialsNodestimeandtapcout = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryStringtimeandtapcout];
            
            for (TFHppleElement *element in tutorialsNodestimeandtapcout)
            {
                static int index = 0;
                index = 0;
                for (TFHppleElement * secondelement in element.children)
                {
                    index++;
                    if ([secondelement.tagName isEqualToString:@"text"]) {
                        switch (index) {
                            case 1:
                                content.timeandtapcount = secondelement.content;
                                break;
                                
                            default:
                                break;
                        }
                    }
                    
                    for (TFHppleElement * threelement in secondelement.children)
                    {
                        if ([threelement.tagName isEqualToString:@"text"])
                        {
                            switch (index) {
                                case 2:
                                    content.author =threelement.content;                               break;
                                default:
                                    break;
                            }
                        }
                        
                    }
                }
            }
            content.content = str;
            
        }
        netWorkBlock(content);
    }];
}

/**
 *  返回列表的数据
 *
 *  @param list_url 列表页的网址
 *
 *  @return NSMutableArray 数组
 */
- (void)listContentWithlist_url:(NSString *)list_url successRequest:(NetWorkBlock)netWorkBlock
{
    
    NSURL * url = [NSURL URLWithString:list_url];
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (response == nil) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"网络连接中断" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
            netWorkBlock(nil);
            return;
        }else{
            netWorkBlock(data);
        }
    }];
}

@end

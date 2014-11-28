//
//  NewsModel.m
//  ProseAppreciation
//
//  Created by zz on 14/11/20.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"priority"]) {
        self.priority = [NSString stringWithFormat:@"%@",value];
    }
    if ([key isEqualToString:@"replyCount"]) {
        self.replyCount = [NSString stringWithFormat:@"%@",value];
    }
}
@end

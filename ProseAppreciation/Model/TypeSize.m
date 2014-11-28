//
//  TypeSize.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/10.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "TypeSize.h"
#import "HeaderURL.h"

@implementation TypeSize
/**
 *  创建单例
 */
+ (TypeSize *)currentTypeSize
{
    static TypeSize * typesize = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        typesize = [[self alloc] init];
    });
    return typesize;
}
/**
 *  字体数组
 */
+ (NSArray *)arrayOfContentFont {
	return [NSArray arrayWithObjects:[UIFont systemFontOfSize:NewsContentsFontSizeLittle],
            [UIFont systemFontOfSize:NewsContentsFontSizeNormal],
            [UIFont systemFontOfSize:NewsContentsFontSizeLarge],
            nil];
}

@end

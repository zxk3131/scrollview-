//
//  TypeSize.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/10.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TypeSize : NSObject
/**
 *  创建单例
 */
+ (TypeSize *)currentTypeSize;
/**
 *  下表属性
 */
@property(nonatomic,assign) int index;
/**
 *  字体数组
 */
+ (NSArray *)arrayOfContentFont;

@end

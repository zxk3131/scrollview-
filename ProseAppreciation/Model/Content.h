//
//  Content.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Content : NSObject
@property(nonatomic,strong)NSString * content;//详情页的内容
@property(nonatomic,strong)NSString * author;//详情页的作者
@property(nonatomic,strong)NSString * timeandtapcount;//详情页的作者和点击量
@property(nonatomic,strong)NSString * time;//详情页的时间
@end

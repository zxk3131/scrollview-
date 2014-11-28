//
//  Model.h
//  NewsFourApp
//
//  Created by 李超峰 on 14-11-4.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic,strong)NSString * titile; //标题
@property(nonatomic,strong)NSString * contant; //简介
@property(nonatomic,strong)NSString * time; //时间
@property(nonatomic,strong)NSString * tap_count; //点击量
@property(nonatomic,strong)NSString * author; //作者
@property(nonatomic,strong)NSString * image_url; //图片网址
@property(nonatomic,strong)NSString * detail_url; //详情页网址
@property(nonatomic,strong)NSString * detail_contont; //详情页呢荣
@property(nonatomic,strong)NSString * time_list; //详情页副标题
@end

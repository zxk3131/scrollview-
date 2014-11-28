//
//  ModelDBanager.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/10.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DB.h"
#import "Model.h"

@interface ModelDBanager : NSObject
//增加
+(void)insertModel:(Model *)model;
//删除
+(void)deleteModelWithTitle:(NSString * )title;
//查询
+(NSArray *)selectAllModels;
@end

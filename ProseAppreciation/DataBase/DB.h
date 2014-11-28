//
//  DB.h
//  123
//
//  Created by 李超峰 on 14-9-26.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DB : NSObject

//打开数据库
+(sqlite3 *)openDBWithSqlName:(NSString *)sqlname;

//关闭数据库
+(void)closeDB;

@end

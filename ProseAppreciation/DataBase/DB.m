//
//  DB.m
//  123
//
//  Created by 李超峰 on 14-9-26.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "DB.h"

@implementation DB

//定义数据库单例
static sqlite3 * db =nil;
//打开数据库
+(sqlite3 *)openDBWithSqlName:(NSString *)sqlname
{
    //如果数据库已经打开,则返回
    if (db!=nil)
    {
        return db;
    }
    //数据库bundle中得位置
    NSString * bundkePath =[[NSBundle mainBundle]pathForResource:sqlname ofType:@"sqlite"];
    //对应cache中的位置
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    cachePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@.sqlite",sqlname]];
 
    NSFileManager * fm = [NSFileManager defaultManager];
    //如果数据库文件已经存在则不拷贝,否则从bundle中拷贝到cache目录下
    if (![fm fileExistsAtPath:cachePath]) {
        //copy
        [fm copyItemAtPath:bundkePath toPath:cachePath error:nil];
    }
    //打开数据库,flag表示数据库打开操作错误表示
    int flag = sqlite3_open([cachePath UTF8String], &db);//强转
    if (flag == SQLITE_OK) {
        NSLog(@"数据库打开成功");
    }
    else{
        NSLog(@"数据库打开失败");
    }
    return db;
}
//关闭数据库
+(void)closeDB
{
 int flag = sqlite3_close(db);
    if (flag == SQLITE_OK) {
        NSLog(@"数据库关闭成功");
        db = nil;
    }
    else
    {
        NSLog(@"数据库关闭失败");
    }
    
}
@end

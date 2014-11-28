//
//  ModelDBanager.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14/11/10.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "ModelDBanager.h"

@implementation ModelDBanager
//增加
+(void)insertModel:(Model *)model
{
    //1,打开数据库
    sqlite3 * db = [DB openDBWithSqlName:@"mydatabase"];
    //2,准备SQL语句
    NSString * sqlStr = [NSString stringWithFormat:@"insert into model values('%@','%@','%@','%@','%@','%@','%@','%@','%@')",model.titile,model.contant, model.time,model.tap_count,model.author,model.image_url,model.detail_url,model.detail_contont,model.time_list];
    //3执行sql语句
    char * error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    NSLog(@"error=%s",error);
    if (result == SQLITE_OK) {
        NSLog(@"插入成功");
    }
    else
    {
        NSLog(@"插入失败");
    }
}
//删除
+(void)deleteModelWithTitle:(NSString * )title
{
    //打开数据库
    sqlite3 * db = [DB openDBWithSqlName:@"mydatabase"];
    //准备SQL数据
    NSString * sqlStr = [NSString stringWithFormat:@"delete from model where title='%@'",title];
    //执行语句
    char * error = nil;
    int result = sqlite3_exec(db, [sqlStr UTF8String], nil, nil, &error);
    NSLog(@"error=%s",error);
    if (result ==SQLITE_OK) {
        NSLog(@"删除成功");
    }
    else
    {
        NSLog(@"删除失败");
    }
}
//查询
+(NSArray *)selectAllModels
{
    NSMutableArray * checkins = [[NSMutableArray alloc]init];
    //打开数据库
    sqlite3 * db = [DB openDBWithSqlName:@"mydatabase"];
    //2,准备sql语句
    NSString * sqlStr = @"select * from model";
    //3跟随指针
    sqlite3_stmt * stmt =nil;
    int result = sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &stmt, nil);
    if (result == SQLITE_OK)
    {
        //5单步执行
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            const char * title = (const char *)sqlite3_column_text(stmt, 0);
            const char * content = (const char *)sqlite3_column_text(stmt, 1);
            const char * time = (const char *)sqlite3_column_text(stmt, 2);
            const char * tap_count = (const char *)sqlite3_column_text(stmt, 3);
            const char * author = (const char *)sqlite3_column_text(stmt, 4);
            const char * image_url = (const char *)sqlite3_column_text(stmt, 5);
            const char * detail_url = (const char *)sqlite3_column_text(stmt, 6);
             const char * detail_content = (const char *)sqlite3_column_text(stmt, 7);
             const char * time_list = (const char *)sqlite3_column_text(stmt, 8);
            Model * comment = [[Model alloc] init];
            comment.titile = [NSString stringWithUTF8String:title];
            comment.contant = [NSString stringWithUTF8String:content];
            comment.time = [NSString stringWithUTF8String:time];
            comment.tap_count = [NSString stringWithUTF8String:tap_count];
            comment.author = [NSString stringWithUTF8String:author];
            comment.image_url = [NSString stringWithUTF8String:image_url];
            comment.detail_url = [NSString stringWithUTF8String:detail_url];
            comment.detail_contont = [NSString stringWithUTF8String:detail_content];
            comment.time_list = [NSString stringWithUTF8String:time_list];
            [checkins addObject:comment];
        }
    }
    //释放查询中开辟的内存
    sqlite3_finalize(stmt);
    return checkins;
}
@end

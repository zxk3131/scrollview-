//
//  ExpressLoveTableViewCell.h
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpressLoveTableViewCell : UITableViewCell
/**
 *  标题标签属性
 */

@property(nonatomic,strong)UILabel * titlelabel;
/**
 *  内容标签内容属性
 */
@property(nonatomic,strong)UILabel * contentlabel;
/**
 *  时间标签属性
 */
@property(nonatomic,strong)UILabel * timelabel;

@property (nonatomic,strong)UIImageView * imgview;
@end

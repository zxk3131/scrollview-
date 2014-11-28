//
//  ExpressLoveTableViewCell.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "ExpressLoveTableViewCell.h"
#import "HeaderURL.h"

@implementation ExpressLoveTableViewCell
/**
 *  自定义cell初始化
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
        self.imgview = imageview;
        imageview.image = [UIImage imageNamed:@"item"];
        [self addSubview:imageview];
        
        UILabel * titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, SCREEN_WIDTH - 100-10, 20)];
        titlelabel.font = [UIFont systemFontOfSize:14];
        self.titlelabel = titlelabel;
        [self addSubview:titlelabel];
        
//        UILabel * timelabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 5, 50, 30)];
//        timelabel.font = [UIFont systemFontOfSize:12];
//        self.timelabel = timelabel;
//        [self addSubview:timelabel];
        
        UILabel * contentlabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 35, SCREEN_WIDTH-110, 55)];
        contentlabel.numberOfLines = 0 ;
        contentlabel.font = [UIFont systemFontOfSize:12];
        contentlabel.textColor = [UIColor lightGrayColor];
        self.contentlabel =contentlabel;
        [self addSubview:contentlabel];
    }
    return self;
}
- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end

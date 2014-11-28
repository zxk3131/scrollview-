//
//  DetailViewController.m
//  ProseAppreciation
//
//  Created by 李超峰 on 14-11-6.
//  Copyright (c) 2014年 ╰緣じ☆veの断弦. All rights reserved.
//

#import "DetailViewController.h"
#import "NavNavigationView.h"
#import "TFHpple.h"
#import "ModelDBanager.h"
#import "HeaderURL.h"
#import "TypeSize.h"
#import "Theme.h"
#import "MBProgressHUD+MJ.h"
#import "Content.h"
#import "HtmlParse+DetailContent.h"
#import "UMSocial.h"
@interface DetailViewController ()
/**
 *  内容标签
 */
@property(nonatomic,strong)UILabel * contentlabel;
/**
 *  内容滑动视图
 */
@property(nonatomic,strong)UIScrollView * scrollview;
/**
 *  收藏按钮
 */
@property(nonatomic,strong)UIButton *collectionbtn;

@end

@implementation DetailViewController
/**
 *  初始化
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {

    }
    return self;
}
/**
 *  视图加载
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor whiteColor];
    NavNavigationView * nav = [[NavNavigationView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    self.nav =nav;
    [nav.titlelabel setText:@"美文详情"];
    [self.view addSubview:nav];
    /**
     *  返回按钮
     */
    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lbtn setFrame:CGRectMake(20, 27, 30, 30)];
    [lbtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [lbtn setBackgroundImage:[UIImage imageNamed:@"back_highlighted"] forState:UIControlStateHighlighted];
    [lbtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [nav addSubview:lbtn];
    //收藏按钮
    UIButton *collectionbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [collectionbtn setFrame:CGRectMake(270, 27, 32, 32)];
    [collectionbtn setBackgroundImage:[UIImage imageNamed:@"icon_star"] forState:UIControlStateNormal];
    self.collectionbtn =collectionbtn;
    [collectionbtn addTarget:self action:@selector(collectionAction:) forControlEvents:UIControlEventTouchUpInside];
    [nav addSubview:collectionbtn];
    /**
     *  内容
     */
//    _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height- 64)];
//    [self.view addSubview:_scrollview];
    
   UILabel * titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 64, 280, 40)];
    self.titlelabel =titlelabel;
    titlelabel.numberOfLines =0 ;
    titlelabel.text =_model.title;
    titlelabel.font = [UIFont systemFontOfSize:14];
    titlelabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titlelabel];
    
//    UILabel * timelabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 215 , 40)];
//    self.timelabel =timelabel;
//    timelabel.textColor = [UIColor grayColor];
//    timelabel.font = [UIFont systemFontOfSize:12];
//    timelabel.textAlignment = NSTextAlignmentLeft;
//    [_scrollview addSubview:timelabel];
//    
//    UILabel * authorlabel = [[UILabel alloc]initWithFrame:CGRectMake(225, 50, 80 , 40)];
//    self.authorlabel =authorlabel;
//    authorlabel.textColor = [UIColor grayColor];
//    authorlabel.font = [UIFont systemFontOfSize:12];
//    authorlabel.textAlignment = NSTextAlignmentLeft;
//    [_scrollview addSubview:authorlabel];
    NSString * urlstr = [NSString stringWithFormat:@"%@%@/full.html",XIANGQING_URL,self.model.docid];
    HtmlParse_DetailContent * html = [[HtmlParse_DetailContent alloc]init];
    [html listContentWithlist_url:urlstr successRequest:^(id data)
     {
        NSDictionary * tempdic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary * dic = [tempdic objectForKey:self.model.docid];
        NSString * str = @"<meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">";
        str = [str stringByAppendingString:[dic objectForKey:@"body"]];
         
         UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 104, SCREEN_WIDTH, SCREEN_HEIGHT - 104)];
         [webView loadHTMLString:str baseURL:nil];
         [self.view addSubview:webView];
         
         UIView * view = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 20)];
         view.backgroundColor = [UIColor orangeColor];
         [webView addSubview:view];
    }];

    
    

    //判断是否收藏
    NSArray * array = [ModelDBanager selectAllModels];
    for (Model * tem in array)
    {
        if ([tem.titile isEqualToString:_model.title] )
        {
               [self.collectionbtn setBackgroundImage:[UIImage imageNamed:@"icon_star_full"] forState:UIControlStateNormal];
            self.collectionbtn.selected = !self.collectionbtn.selected;
        }
    }
//    [MBProgressHUD showMessage:@"加载中..."];
}
/**
 *  分享事件
 */
-(void)shareAction:(UIButton *)sender
{
    NSString * string = [NSString stringWithFormat:@"在@诗歌散文客户端上发现这篇文章:%@很不错哦!连接:http://m.duwenzhang.com/%@",_model.title,_model.url];
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5433d6a5fd98c5cb180207fb"
                                      shareText:string
                                     shareImage:nil
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,
                                                 UMShareToEmail,
                                                 nil]
                                       delegate:nil];
}
/**
 *  收藏按钮
 */
-(void)collectionAction:(UIButton *)sender
{
//    self.collectionbtn = sender;
//    if (!sender.selected)
//    {
//        [ModelDBanager insertModel:_model];
//    [sender setBackgroundImage:[UIImage imageNamed:@"icon_star_full"] forState:UIControlStateNormal];
//        [MBProgressHUD showSuccess:@"收藏成功"];
//    }
//    else
//    {
//        [ModelDBanager deleteModelWithTitle:_model.titile];
//    [sender setBackgroundImage:[UIImage imageNamed:@"icon_star"] forState:UIControlStateNormal];
//        [MBProgressHUD showSuccess:@"您已取消收藏"];
//    }
//    sender.selected =!sender.selected;
}
/**
 *  将要显示时更新主题
 */
-(void)viewWillAppear:(BOOL)animated
{
    [Theme themeSettingWithNav:self.nav];
}
/**
 *  返回按钮事件方法
 */
- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
/**
 *  内存警告
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

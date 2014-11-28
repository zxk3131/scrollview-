//
//  MainAppViewController.m
//  helloworld
//
//  Created by chen on 14/7/13.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "MainAppViewController.h"
#import "TouchPropagatedScrollView.h"
#import "ExpressLoveViewController.h"
#import "NavNavigationView.h"
#import "HeaderURL.h"
#import "Theme.h"
#define MENU_HEIGHT 50
#define MENU_BUTTON_WIDTH  80

#define MIN_MENU_FONT  12.f
#define MAX_MENU_FONT  16.f

@interface MainAppViewController ()<UIScrollViewDelegate>
{
    UIView *_topNaviV;//顶部导航视图
    UIScrollView *_scrollV;//滑动视图
    
    TouchPropagatedScrollView *_navScrollV;//选择视图
    float _startPointX;//开始的X坐标
    UIView *_selectTabV;//选择视图
    
    /**
     *  控制器重用,一个控制器创建3个对象
     */
    ExpressLoveViewController * shuqingVC;
    ExpressLoveViewController * loveVC;
    ExpressLoveViewController * friendshipVC;
    ExpressLoveViewController * thirdVC;
    float Pianyiliang;
    BOOL state;
}
@end

@implementation MainAppViewController

- (void)viewDidLoad
{
    /**
     *  自定义导航栏
     */
    visibleSet = [[NSMutableSet alloc]init];
    reusedSet = [[NSMutableSet alloc]init];
    

    

    self.nav = [[NavNavigationView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.nav.titlelabel setText:@"ZZNews"];
    [self.view addSubview:self.nav];
    /**
     *  主菜单按钮
     */
    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lbtn setFrame:CGRectMake(20, 27, 30, 30)];
    [lbtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_menuicon"] forState:UIControlStateNormal];
     [lbtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_menuicon_highlighted"] forState:UIControlStateHighlighted];
    [lbtn addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.nav addSubview:lbtn];
    /**
     *  返回按钮
     */
    UIButton *rbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rbtn setFrame:CGRectMake(self.nav.frame.size.width - 50, 27, 30, 30)];
    [rbtn setBackgroundImage:[UIImage imageNamed:@"setting_icon_normal"] forState:UIControlStateNormal];
    [rbtn setBackgroundImage:[UIImage imageNamed:@"setting_icon_highlight"] forState:UIControlStateHighlighted];
    [rbtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.nav addSubview:rbtn];
    /**
     *  滑动选择视图
     */
    _topNaviV = [[UIView alloc] initWithFrame:CGRectMake(0, self.nav.frame.size.height + self.nav.frame.origin.y, SCREEN_WIDTH, MENU_HEIGHT)];
    _topNaviV.backgroundColor = RGBA(236.f, 236.f, 236.f, 1);
    [self.view addSubview:_topNaviV];
    /**
     *  展示主视图滑动
     */
    _scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _topNaviV.frame.origin.y + _topNaviV.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - _topNaviV.frame.origin.y - _topNaviV.frame.size.height)];
    [_scrollV setPagingEnabled:YES];
    [_scrollV setShowsHorizontalScrollIndicator:NO];
    [self.view insertSubview:_scrollV belowSubview:self.nav];
    _scrollV.delegate = self;
    [_scrollV.panGestureRecognizer addTarget:self action:@selector(scrollHandlePan:)];
    /**
     *  选择司徒
     */
    _selectTabV = [[UIView alloc] initWithFrame:CGRectMake(0, _scrollV.frame.origin.y - _scrollV.frame.size.height, _scrollV.frame.size.width, _scrollV.frame.size.height)];
    [_selectTabV setBackgroundColor:RGBA(236.f, 236.f, 236.f, 1)];
    [_selectTabV setHidden:YES];
    [self.view insertSubview:_selectTabV belowSubview:self.nav];
    [self createTwo];
}
/**
 *  根据所要创建的视图个数来创建视图
 */
- (void)createTwo
{

    /**
     *  调用类方法实现动画
     */
    _navScrollV = [[TouchPropagatedScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MENU_HEIGHT)];
    [_navScrollV setShowsHorizontalScrollIndicator:NO];
    /**
     *  创建每个视图
     */
    for (int i = 0; i < [BIAOTI_ARR count]; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(MENU_BUTTON_WIDTH * i, 0, MENU_BUTTON_WIDTH, MENU_HEIGHT)];
        [btn setTitle:[BIAOTI_ARR objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = i + 1;
        if(i==0)
        {
            [self changeColorForButton:btn red:1];
            btn.titleLabel.font = [UIFont systemFontOfSize:MAX_MENU_FONT];
        }else
        {
            btn.titleLabel.font = [UIFont systemFontOfSize:MIN_MENU_FONT];
            [self changeColorForButton:btn red:0];
        }
        [btn addTarget:self action:@selector(actionbtn:) forControlEvents:UIControlEventTouchUpInside];
        [_navScrollV addSubview:btn];
    }
    [_navScrollV setContentSize:CGSizeMake(MENU_BUTTON_WIDTH * [BIAOTI_ARR count], MENU_HEIGHT)];
    [_topNaviV addSubview:_navScrollV];
    /**
     *  添加视图
     */
    [self addView2Page:_scrollV count:[BIAOTI_ARR count] frame:CGRectZero];
}
/**
 *  添加试图方法
 */
- (void)addView2Page:(UIScrollView *)scrollV count:(NSUInteger)pageCount frame:(CGRect)frame
{
    
    
    ExpressLoveViewController * firstVC = [[ExpressLoveViewController alloc]init];
    firstVC.view.tag = 10+0;
    firstVC.view.frame = CGRectMake(0, 0, _scrollV.frame.size.width, _scrollV.frame.size.height);
    [scrollV addSubview:firstVC.view];
    firstVC.urlstring = TITLE_ARR[0];
    [visibleSet addObject:firstVC];
    [self addChildViewController:firstVC];
    
    ExpressLoveViewController * secondVC = [[ExpressLoveViewController alloc]init];
    secondVC.view.tag = 10+1;
    secondVC.view.frame = CGRectMake(_scrollV.frame.size.width, 0, _scrollV.frame.size.width, _scrollV.frame.size.height);
    secondVC.urlstring = TITLE_ARR[1];
    [scrollV addSubview:secondVC.view];
    [visibleSet addObject:secondVC];
    [self addChildViewController:secondVC];
    
//    ExpressLoveViewController * thirdVC = [[ExpressLoveViewController alloc]init];
//    thirdVC.view.tag = 10+2;
//    thirdVC.view.frame = CGRectMake(_scrollV.frame.size.width * 2, 0, _scrollV.frame.size.width, _scrollV.frame.size.height);
//    thirdVC.urlstring = TITLE_ARR[2];
//    [scrollV addSubview:thirdVC.view];
//    [visibleSet addObject:thirdVC];
//    [self addChildViewController:thirdVC];
    
    [scrollV setContentSize:CGSizeMake(scrollV.frame.size.width * pageCount, scrollV.frame.size.height)];
}
/**
 *  改变试图方法
 *
 *  @param x float
 */
- (void)changeView:(float)x
{
    
    
    //button偏移量
    float xx = x * (MENU_BUTTON_WIDTH / SCREEN_WIDTH);
    
    float startX = xx;
    //滑动后页码
    int sT = (x)/_scrollV.frame.size.width + 1;
    
    if (sT <= 0)
    {
        return;
    }
    UIButton *btn = (UIButton *)[_navScrollV viewWithTag:sT];
    float percent = (startX - MENU_BUTTON_WIDTH * (sT - 1))/MENU_BUTTON_WIDTH;
    float value = [QHCommonUtil lerp:(1 - percent) min:MIN_MENU_FONT max:MAX_MENU_FONT];
    btn.titleLabel.font = [UIFont systemFontOfSize:value];
    [self changeColorForButton:btn red:(1 - percent)];
    
    
    if((int)xx%MENU_BUTTON_WIDTH == 0)
        return;
    UIButton *btn2 = (UIButton *)[_navScrollV viewWithTag:sT + 1];
    float value2 = [QHCommonUtil lerp:percent min:MIN_MENU_FONT max:MAX_MENU_FONT];
    btn2.titleLabel.font = [UIFont systemFontOfSize:value2];
    [self changeColorForButton:btn2 red:percent];
}
/**
 *  切换视图变换字体颜色方法
 */
- (void)changeColorForButton:(UIButton *)btn red:(float)nRedPercent
{
//    float value = [QHCommonUtil lerp:nRedPercent min:0 max:212];
//    [btn setTitleColor:RGBA(value,25,38,1) forState:UIControlStateNormal];
}

#pragma mark - action
/**
 *  点击按钮触发方法
 */
- (void)actionbtn:(UIButton *)btn
{
    [_scrollV scrollRectToVisible:CGRectMake(_scrollV.frame.size.width * (btn.tag - 1), _scrollV.frame.origin.y, _scrollV.frame.size.width, _scrollV.frame.size.height) animated:YES];

    float xx = _scrollV.frame.size.width * (btn.tag - 1) * (MENU_BUTTON_WIDTH / SCREEN_WIDTH) - MENU_BUTTON_WIDTH;
    Pianyiliang = _scrollV.frame.size.width * (btn.tag - 1);
    state = YES;
    [_navScrollV scrollRectToVisible:CGRectMake(xx, 0, _navScrollV.frame.size.width, _navScrollV.frame.size.height) animated:YES];

}
/**
 *  左按钮触发方法
 */
- (void)leftAction:(UIButton *)btn
{
    if ([_selectTabV isHidden] == NO)
    {
        [self showSelectView:btn];
        return;
    }
    [[QHSliderViewController sharedSliderController] showLeftViewController];
}
/**
 *  右按钮触发方法
 */
- (void)rightAction:(UIButton *)btn
{
    if ([_selectTabV isHidden] == NO)
    {
        [self showSelectView:btn];
        return;
    }
    
    [[QHSliderViewController sharedSliderController] showRightViewController];
}
/**
 *  选择按钮触发方法以及产生动画
 */
- (void)showSelectView:(UIButton *)btn
{
    if ([_selectTabV isHidden] == YES)
    {
        [_selectTabV setHidden:NO];
        [UIView animateWithDuration:0.6 animations:^
         {
             [_selectTabV setFrame:CGRectMake(0, _scrollV.frame.origin.y, _scrollV.frame.size.width, _scrollV.frame.size.height)];
         } completion:^(BOOL finished)
         {
         }];
    }else
    {
        [UIView animateWithDuration:0.6 animations:^
         {
             [_selectTabV setFrame:CGRectMake(0, _scrollV.frame.origin.y - _scrollV.frame.size.height, _scrollV.frame.size.width, _scrollV.frame.size.height)];
         } completion:^(BOOL finished)
         {
             [_selectTabV setHidden:YES];
         }];
    }
}
/**
 *  平移触发方法
 */
-(void)scrollHandlePan:(UIPanGestureRecognizer*) panParam
{
    BOOL isPaning = NO;
    if(_scrollV.contentOffset.x < 0)
    {
        isPaning = YES;

    }
    else if(_scrollV.contentOffset.x > (_scrollV.contentSize.width - _scrollV.frame.size.width))
    {
        isPaning = YES;
    }
    if(isPaning)
    {
        [[QHSliderViewController sharedSliderController] moveViewWithGesture:panParam];
    }
}


#pragma mark - UIScrollViewDelegate
/**
 *  开始滑动方法
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _startPointX = scrollView.contentOffset.x;
}
/**
 *  结束滑动方法
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self changeView:scrollView.contentOffset.x];

    CGPoint offset = _scrollV.contentOffset;
    
    NSLog(@"%lu",curPage);
    if (state == YES) {
        offset = CGPointMake(Pianyiliang, 0);
    }
    curPage = (offset.x + (320/2))/320;
    if (state == YES) {
        curPage +=1;
    }
    NSLog(@"%@",NSStringFromCGPoint(offset));
    
    NSLog(@"%lu",curPage);
    //向左滑动
    if (curPage> prePage) {
        //添加current+1页，删除currenPage-2页
        //先删
        //第一种删除方法，通过tag查找子试图，
        if (curPage>1) {
            thirdVC = (ExpressLoveViewController *)[[scrollView viewWithTag:10+(curPage-2)] nextResponder];
            if (thirdVC) {
                [reusedSet addObject:thirdVC];
            }
        }
        //后加
        if (curPage>0 && curPage < TITLE_ARR.count) {
            thirdVC = [reusedSet anyObject];
            if (!thirdVC) {
                thirdVC = [[ExpressLoveViewController alloc]init];
                thirdVC.view.frame = CGRectZero;
                if (curPage + 1 > TITLE_ARR.count) {
                    thirdVC.urlstring = TITLE_ARR[curPage];
                }else{
                    thirdVC.urlstring = TITLE_ARR[curPage+1];
                }
                thirdVC.view.backgroundColor = [UIColor yellowColor];
                [scrollView addSubview:thirdVC.view];
                [self addChildViewController:thirdVC];
//                [reusedSet addObject:thirdVC.view];
//                [reusedSet removeObject:thirdVC.view];

            }else{
                [visibleSet addObject:thirdVC];
                [reusedSet removeObject:thirdVC];
            }
            thirdVC.view.frame = CGRectMake((curPage+1)*320, 0, _scrollV.frame.size.width, _scrollV.frame.size.height);
            thirdVC.view.tag = 10 +(curPage+1);
            if (curPage+1<TITLE_ARR.count) {
                thirdVC.urlstring = TITLE_ARR[curPage + 1];
            }
            [thirdVC headerRereshing];
        }
    }
    
    /////////////////////////////////////////////////
    
    //向右滑动
    if (curPage < prePage) {
        //添加current-1页，删除currenPage-2页
        //先删
        //第一种删除方法，通过tag查找子试图，
        if (curPage<12) {
            thirdVC = (ExpressLoveViewController *)[[scrollView viewWithTag:10+(curPage+2)] nextResponder];
            if (thirdVC) {
                [reusedSet addObject:thirdVC];
            }
        }
        //后加
        if (curPage>0 && curPage < TITLE_ARR.count) {
            thirdVC = [reusedSet anyObject];
            if (!thirdVC) {
                thirdVC = [[ExpressLoveViewController alloc]init];
                thirdVC.view.frame = CGRectZero;
                thirdVC.view.backgroundColor = [UIColor yellowColor];
                [scrollView addSubview:thirdVC.view];
                [self addChildViewController:thirdVC];
                thirdVC.urlstring = TITLE_ARR[curPage-1];
                [reusedSet addObject:thirdVC];
                [reusedSet removeObject:thirdVC];
                
            }else{
                [visibleSet  addObject:thirdVC];
                [reusedSet removeObject:thirdVC];
            }
            thirdVC.view.frame = CGRectMake((curPage-1)*320, 0, _scrollV.frame.size.width, _scrollV.frame.size.height);
            thirdVC.view.tag = 10 +(curPage-1);
            thirdVC.urlstring = TITLE_ARR[curPage-1];
            [thirdVC headerRereshing];
        }
    }
    prePage =curPage;//第二页变成了第一页，即前一页
    state = NO;
}
/**
 *  结束滑动视图
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float xx = scrollView.contentOffset.x * (MENU_BUTTON_WIDTH / SCREEN_WIDTH) - MENU_BUTTON_WIDTH;
    [_navScrollV scrollRectToVisible:CGRectMake(xx, 0, _navScrollV.frame.size.width, _navScrollV.frame.size.height) animated:YES];
}

@end

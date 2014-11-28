//
//  MainAppViewController.h
//  helloworld
//
//  Created by chen on 14/7/13.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavNavigationView.h"
@interface MainAppViewController : UIViewController
{
    UIScrollView * showSV;
    NSMutableSet * visibleSet;
    NSMutableSet * reusedSet;
    NSInteger prePage;//前一页
    NSInteger curPage;//当前页
}
/**
 *  自定义导航栏
 */
@property(nonatomic,retain)NavNavigationView * nav;

@end

//
//  ActivityCellHeaderView.h
//  RefactorDemo
//
//  Created by RookieHua on 2017/1/24.
//  Copyright © 2017年 DaSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

//这里的方法降低了view 和调用这个view的ViewController之间的耦合，我们的应用里面应该使用这样的方式。


@class ActivityCellHeaderView;

//delegate for the view
@protocol ActivityCellHeaderViewDelegate

- (void) touchAFromView:(ActivityCellHeaderView*) decoupledView;
- (void) touchBFromView:(ActivityCellHeaderView*) decoupledView;

@end

@interface ActivityCellHeaderView : UIView

+(void)presentInViewController:(UIViewController<ActivityCellHeaderViewDelegate>*) viewController withFrame:(CGRect)aFrame;

@end

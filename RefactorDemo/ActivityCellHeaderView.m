//
//  ActivityCellHeaderView.m
//  RefactorDemo
//
//  Created by RookieHua on 2017/1/24.
//  Copyright © 2017年 DaSheng. All rights reserved.
//

#import "ActivityCellHeaderView.h"
#import "ViewController.h"
#import "Masonry.h"

#pragma mark -定义一个Owner

@interface ActivityCellHeaderViewOwner : NSObject
@property (nonatomic, weak) IBOutlet ActivityCellHeaderView *headerView;
@end

@implementation ActivityCellHeaderViewOwner
@end

#pragma mark -实现View
@interface ActivityCellHeaderView ()
//这里一定是weak，不然会导致retain cycle
@property (nonatomic, weak) UIViewController <ActivityCellHeaderViewDelegate> *delegateViewController;

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *buttonB;
@property (weak, nonatomic) IBOutlet UIButton *buttonA;

@end

@implementation ActivityCellHeaderView

+(void)presentInViewController:(UIViewController<ActivityCellHeaderViewDelegate>*) viewController
{
    [self presentInViewController:viewController withFrame:CGRectMake(0, 0, 300, 200)];
}

+(void)presentInViewController:(UIViewController<ActivityCellHeaderViewDelegate>*) viewController withFrame:(CGRect)aFrame{
    // Instantiating encapsulated here.
    ActivityCellHeaderViewOwner *owner = [ActivityCellHeaderViewOwner new];
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:owner options:nil];
    // Pass in a reference of the viewController.
    owner.headerView.delegateViewController = viewController;
    owner.headerView.frame = aFrame;
    
    [owner.headerView configViewConstraint];

//     Add (thus retain).
    [viewController.view addSubview:owner.headerView];

}

#pragma mark -


- (void)configViewConstraint{
//    UIEdgeInsets padding = UIEdgeInsetsMake(10, 0, 0, 10);
    [_buttonA mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self).with.insets(padding);
        make.top.equalTo(_buttonB);
        make.left.equalTo(_buttonB);
        _buttonB.hidden = YES;
    }];
}

-(IBAction)buttonAPressed:(id)sender
{
    // Forward to delegate.
    [self.delegateViewController touchAFromView:self];
}

-(IBAction)buttonBPressed:(id)sender
{
    
    // Forward to delegate.
    [self.delegateViewController touchBFromView:self];
    [self removeFromSuperview];
}
@end

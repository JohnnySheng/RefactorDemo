//
//  ViewController.m
//  RefactorDemo
//
//  Created by RookieHua on 2017/1/18.
//  Copyright © 2017年 DaSheng. All rights reserved.
//

#import "ViewController.h"
#import "ActivityCellHeaderView.h"

@interface ViewController ()<ActivityCellHeaderViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}


- (void)dealloc
{
    
}


#pragma mark delegate
- (IBAction)showView:(id)sender {
     [ActivityCellHeaderView presentInViewController:self withFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 40)];
}
- (void) touchAFromView:(ActivityCellHeaderView*) decoupledView{
    
}
- (void) touchBFromView:(ActivityCellHeaderView*) decoupledView{
    
}
@end

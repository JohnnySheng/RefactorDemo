//
//  LoginViewController.m
//  RefactorDemo
//
//  Created by RookieHua on 2017/1/25.
//  Copyright © 2017年 DaSheng. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "User.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfUserName;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UIButton *btLogin;

@property (nonatomic, strong) LoginViewModel *viewModel;

@end

@implementation LoginViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self bindModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView Delegate

#pragma mark - Custom Delegate

#pragma mark - Private Methods
/**
 *  绑定Model中的各种事件
 */
- (void)bindModel {
    //把View那里TextField的反馈给到ViewModel。
    self.viewModel = [[LoginViewModel alloc] init];
    RAC(self.viewModel, userName) = self.tfUserName.rac_textSignal;
    RAC(self.viewModel, password) = self.tfPassword.rac_textSignal;
    
    //同时把ViewModel的信号和View中的Button绑定。
    RACSignal *validSignal = [self.viewModel validSignal];
    RAC(self.btLogin, enabled) = validSignal;
    

    @weakify(self);
    // 订阅登录成功信号并作出处理
    [self.viewModel.successSubject subscribeNext:^(NSArray * x) {
        //        @strongify(self);
        User *user = x[0];
        NSLog(@"username:%@\tpassword:%@", user.username, user.password);
        NSLog(@"登陆成功");
    }];
    
    // 订阅登录失败信号并作出处理
    [self.viewModel.failureSubject subscribeNext:^(id x) {
        NSLog(@"登陆失败");
    }];
    
    // 订阅登录错误信号并作出处理
    [self.viewModel.errorSubject subscribeNext:^(id x) {
        NSLog(@"登陆错误");
    }];
    
    // 添加按钮点击事件,登录的网络请求也会在View Model里面实现
    [[self.btLogin rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel login];
    }];
}

@end

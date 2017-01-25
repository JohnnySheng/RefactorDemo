//
//  LoginViewModel.m
//  RefactorDemo
//
//  Created by RookieHua on 2017/1/25.
//  Copyright © 2017年 DaSheng. All rights reserved.
//

#import "LoginViewModel.h"
#import "User.h"

@interface LoginViewModel ()
/** 用户名改变信号 */
@property (nonatomic, strong) RACSignal *userNameSignal;
/** 密码改变信号 */
@property (nonatomic, strong) RACSignal *passwordSignal;

/** 请求数据（模拟） */
@property (nonatomic, strong) NSArray *requestData;

@end


@implementation LoginViewModel

- (instancetype)init {
    if (self = [super init]) {
        // RACObserve(self, name):监听某个对象的某个属性,返回的是信号。
        _userNameSignal = RACObserve(self, userName);
        _passwordSignal = RACObserve(self, password);
        
        _successSubject = [RACSubject subject];
        _failureSubject = [RACSubject subject];
        _errorSubject   = [RACSubject subject];
    }
    return self;
}

/**
 *  按钮是否可点信息
 *
 *  @return
 */
- (RACSignal *)validSignal {
    RACSignal *validSignal = [RACSignal combineLatest:@[_userNameSignal, _passwordSignal] reduce:^id(NSString *userName, NSString *password){
        // 要求用户名和密码大于6位数
        return @(userName.length == 11 && password.length >= 6);
    }];
    return validSignal;
}

/**
 *  登陆操作
 */
- (void)login{
    // 网络请求进行登录，当然这里只是模拟一下
    User *user = [[User alloc] init];
    user.username = self.userName;
    user.password = self.password;
    _requestData = @[user];
    // 成功发送成功的信号
    [_successSubject sendNext:_requestData];
    // 如果失败发送失败的信息号
}
@end

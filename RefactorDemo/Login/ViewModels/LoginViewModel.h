//
//  LoginViewModel.h
//  RefactorDemo
//
//  Created by RookieHua on 2017/1/25.
//  Copyright © 2017年 DaSheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"

@interface LoginViewModel : NSObject

@property (nonatomic, strong) NSString   *userName;
@property (nonatomic, strong) NSString   *password;

@property (nonatomic, strong) RACSubject *successSubject;
@property (nonatomic, strong) RACSubject *failureSubject;
@property (nonatomic, strong) RACSubject *errorSubject;

/**
 *  按钮是否可点信息
 *
 *  @return
 */
- (RACSignal *)validSignal;
/**
 *  登陆操作
 */
- (void)login;

@end

//
//  ActivityCellHeaderViewModel.h
//  RefactorDemo
//
//  Created by RookieHua on 2017/1/24.
//  Copyright © 2017年 DaSheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ActivityCellHeaderViewModel : NSObject

//这里暴露给view的属性都被设置成readonly，view不关心这些数据从哪里过来。

@property (nonatomic, assign, readonly, getter=isUsernameValid) BOOL usernameValid;

@property (nonatomic, strong, readonly) NSString *message;

@property (nonatomic, strong, readonly) UIImage *userAvatarImage;

@property (nonatomic, strong, readonly) NSArray *tweets;

@property (nonatomic, assign, readonly) BOOL allTweetsLoaded;

@property (nonatomic, strong, readwrite) NSString *username;

- (void) getTweetsForCurrentUsername;

- (void) loadMoreTweets;

@end

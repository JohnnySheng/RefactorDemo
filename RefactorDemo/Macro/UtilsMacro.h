//
//  UtilsMacro.h
//  RefactorDemo
//
//  Created by RookieHua on 2017/1/25.
//  Copyright © 2017年 DaSheng. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h
//放的是一些方便使用的宏定义


#define UIColorFromRGB(r,g,b) [UIColor \
colorWithRed:r/255.0 \
green:g/255.0 \
blue:b/255.0 alpha:1]

#define NSStringFromInt(intValue) [NSString stringWithFormat:@"%d",intValue]



#endif /* UtilsMacro_h */

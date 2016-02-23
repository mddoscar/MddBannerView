//
//  MddBannerStateButtonBean.h
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 状态按钮实体
 */
@interface MddBannerStateButtonBean : NSObject

#pragma mark data
@property (nonatomic,copy) NSString * mStateImageUrl;
@property(nonatomic,copy) NSString * mStateImageText;
#pragma mark ctor
-(id) initWithDataUrl:(NSString *) pImageUrl mStateImageText:(NSString *) pStateImageText;

@end

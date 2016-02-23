//
//  MddBannerStateButtonBean.m
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "MddBannerStateButtonBean.h"

@implementation MddBannerStateButtonBean
@synthesize  mStateImageText;
@synthesize mStateImageUrl;

-(id) initWithDataUrl:(NSString *) pImageUrl mStateImageText:(NSString *) pStateImageText
{

    if (self=[super init]) {
        self.mStateImageUrl=pImageUrl;
        self.mStateImageText=pStateImageText;
    }
    return self;
}

@end

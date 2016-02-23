//
//  MddBannerViewData.m
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "MddBannerViewData.h"


@implementation MddBannerViewData
@synthesize mBannerUrlArray;
@synthesize mCurrentIndex;
@synthesize mStateButtonDic;
@synthesize IsDisPlayButton;
@synthesize mCurrentButtonState;
@synthesize IsWebMode;

-(id) initWithDataBannerUrlArray:(NSMutableArray *)pBannerUrlArray mStateButtonDic:(NSMutableDictionary *) pStateButtonDic
{
    if (self=[super init]) {
        self.mBannerUrlArray=pBannerUrlArray;
        self.mStateButtonDic=pStateButtonDic;
        //def
        self.mCurrentIndex=0;//def
        self.IsDisPlayButton=YES;
        self.IsWebMode=NO;
        self.mCurrentButtonState=MddBannerStatusYes;
    }
    return self;
}
-(id) initWithDataBannerUrlArray:(NSMutableArray *)pBannerUrlArray mStateButtonDic:(NSMutableDictionary *) pStateButtonDic mCurrentButtonState:(MddBannerStatus) pCurrentButtonState
{
    if (self=[super init]) {
        self.mBannerUrlArray=pBannerUrlArray;
        self.mStateButtonDic=pStateButtonDic;
        //def
        self.mCurrentIndex=0;//def
        self.IsDisPlayButton=YES;
        self.IsWebMode=NO;
        self.mCurrentButtonState=pCurrentButtonState;
    }
    return self;
}
-(id) initWithDataBannerUrlArray:(NSMutableArray *)pBannerUrlArray mStateButtonDic:(NSMutableDictionary *) pStateButtonDic mCurrentButtonState:(MddBannerStatus) pCurrentButtonState IsDisPlayButton:(BOOL) pIsDisPlayButton IsWebMode:(BOOL)pIsWebMode
{
    if (self=[super init]) {
        self.mBannerUrlArray=pBannerUrlArray;
        self.mStateButtonDic=pStateButtonDic;
        //def
        self.mCurrentIndex=0;//def
        self.IsDisPlayButton=pIsDisPlayButton;
        self.IsWebMode=pIsWebMode;
        self.mCurrentButtonState=pCurrentButtonState;
    }
    return self;
}
#pragma mark func
-(BOOL) FlagIsDisPlayButton
{
    return self.IsDisPlayButton;
}
-(BOOL) FlagIsWebMode
{
    return self.IsWebMode;
}
-(MddBannerStatus)getmMddBannerStatus
{
    return self.mCurrentButtonState;
}
-(void) setBannerArrayWithId:(long)pCurrentIndex mBannerUrlArray:(NSMutableArray *)pBannerUrlArray
{
    self.mBannerUrlArray=pBannerUrlArray;
    self.mCurrentIndex=pCurrentIndex;
}
-(void) setButtonData:(nonnull MddBannerStateButtonBean *)pDefState mYesStatus:(nonnull MddBannerStateButtonBean *)pYesStatus mNoStatus:(nonnull MddBannerStateButtonBean *)pNoStatus
{
    //清空
    self.mStateButtonDic=nil;
    self.mStateButtonDic =[NSMutableDictionary dictionary];
    //状态
    [self.mStateButtonDic setObject:pNoStatus forKey:@"MddBannerStatusNo"];
    [self.mStateButtonDic setObject:pYesStatus forKey:@"MddBannerStatusYes"];
    [self.mStateButtonDic setObject:pDefState forKey:@"MddBannerStatusUndefine"];
}
//值
-(MddBannerStateButtonBean *) getMddBannerStateButtonBean
{
    MddBannerStateButtonBean * rState=nil;
    if (self.mStateButtonDic) {
        if (self.mCurrentButtonState==MddBannerStatusNo) {
            rState=[self.mStateButtonDic valueForKey:@"MddBannerStatusNo"];
        }else if (self.mCurrentButtonState==MddBannerStatusYes) {
            rState=[self.mStateButtonDic valueForKey:@"MddBannerStatusYes"];
        }else  {
            //未定义
            rState=[self.mStateButtonDic valueForKey:@"MddBannerStatusUndefine"];
        }
    }
    return rState;
}
@end

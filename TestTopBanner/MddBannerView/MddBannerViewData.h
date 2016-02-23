//
//  MddBannerViewData.h
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <Foundation/Foundation.h>

//状态按钮实体
#import "MddBannerStateButtonBean.h"

typedef NS_ENUM(NSUInteger, MddBannerStatus) {
    MddBannerStatusNo=0     //No
    ,MddBannerStatusYes=1       //YES
    ,MddBannerStatusUndefine=1000   //未知状态
};
/*
 导航数据
 */
@interface MddBannerViewData : NSObject

#pragma mark data
//背景地址数组
@property (nonatomic,strong) NSMutableArray * mBannerUrlArray;
//背景当前背景的编号
@property(nonatomic,assign)__block long mCurrentIndex;
//当前按钮状态
@property (nonatomic,assign)MddBannerStatus mCurrentButtonState;
//按钮状态字典
@property(nonatomic,strong) NSMutableDictionary * mStateButtonDic;
//设置按钮显示
@property(nonatomic,assign) BOOL IsDisPlayButton;
//是否web格式
@property(nonatomic,assign) BOOL IsWebMode;
#pragma mark ctor
-(id) initWithDataBannerUrlArray:(NSMutableArray *)pBannerUrlArray mStateButtonDic:(NSMutableDictionary *) pStateButtonDic;
-(id) initWithDataBannerUrlArray:(NSMutableArray *)pBannerUrlArray mStateButtonDic:(NSMutableDictionary *) pStateButtonDic mCurrentButtonState:(MddBannerStatus) pCurrentButtonState;
-(id) initWithDataBannerUrlArray:(NSMutableArray *)pBannerUrlArray mStateButtonDic:(NSMutableDictionary *) pStateButtonDic mCurrentButtonState:(MddBannerStatus) pCurrentButtonState IsDisPlayButton:(BOOL) pIsDisPlayButton IsWebMode:(BOOL)pIsWebMode;
#pragma mark func
-(BOOL) FlagIsDisPlayButton;
-(BOOL) FlagIsWebMode;
//获取状态
-(MddBannerStatus)getmMddBannerStatus;
-(void) setBannerArrayWithId:(long)pCurrentIndex mBannerUrlArray:(NSMutableArray *)pBannerUrlArray;
-(void) setButtonData:(nonnull MddBannerStateButtonBean *)pDefState mYesStatus:(nonnull MddBannerStateButtonBean *)pYesStatus mNoStatus:(nonnull MddBannerStateButtonBean *)pNoStatus;
//值
-(nonnull MddBannerStateButtonBean *) getMddBannerStateButtonBean;
@end

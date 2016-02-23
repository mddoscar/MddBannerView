//
//  MddBannerView.h
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MddBannerStateButtonBean.h"
@class MddBannerViewData;
//@class MddBannerStateButtonBean;

/*
 <举个例子>
 NSString * tImg=[MddBannerView getDefImage];
 NSMutableArray * array=[NSMutableArray arrayWithObjects:tImg, nil];
 NSMutableDictionary * dic=[NSMutableDictionary dictionary];
 MddBannerViewData * tData=[[MddBannerViewData alloc] initWithDataBannerUrlArray:array mStateButtonDic:dic];
 
 [tData setButtonData:[[MddBannerStateButtonBean alloc] initWithDataUrl:@"" mStateImageText:@"yes"] mYesStatus:[[MddBannerStateButtonBean alloc] initWithDataUrl:@"" mStateImageText:@"zzz"] mNoStatus:[[MddBannerStateButtonBean alloc] initWithDataUrl:@"" mStateImageText:@"xxxx"]];
 MddBannerView * mbv=[MddBannerView initializeForNibWithData:tData];
 [self.view addSubview:mbv];
 */
@interface MddBannerView : UIView

#pragma mark data
@property (nonatomic,strong) MddBannerViewData * mBannerData;
#pragma mark ib
/*
 连线这边UIView 只能是referencing outlets，不能是file‘s owner
 */
@property (weak, nonatomic) IBOutlet UIImageView *mUiBackImageView;
@property (weak, nonatomic) IBOutlet UIButton *mUiStateButton;
#pragma mark ctor
-(id) initWithData:(MddBannerViewData *)pMddBannerViewData;
//设置文字
-(void) setButtonState:(int) pMddBannerStatus;
-(void) setData:(MddBannerViewData *)pMddBannerViewData;
//获取默认图片
+(NSString *) getDefImage;
-(NSString *) getDefImage;
//初始化
//构造函数
+ (instancetype)initializeForNib;
+ (instancetype)initializeForNibWithData:(MddBannerViewData *)pMddBannerViewData;
//广告方法
-(void) resetBanner;
-(void) lastBanner;
-(void) nextBanner;
-(void) endBanner;

@end

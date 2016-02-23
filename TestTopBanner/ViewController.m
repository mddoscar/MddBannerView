//
//  ViewController.m
//  TestTopBanner
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
//
#import "MddBannerView.h"
#import "MddBannerViewData.h"
#import "MddBannerStateButtonBean.h"
@interface ViewController ()
{
    MddBannerView * mbv;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self myInit];
}

-(void) myInit
{
    NSLog(@"hello world");
//    NSString * tImg=[MddBannerView getDefImage];
//    NSMutableArray * array=[NSMutableArray arrayWithObjects:tImg,@"ad1",@"ad2",@"ad3", nil];//[NSMutableArray arrayWithObjects:tImg, nil];
    NSMutableArray * array=[self testWebArray];//[NSMutableArray arrayWithObjects:tImg, nil];
    
    NSMutableDictionary * dic=[NSMutableDictionary dictionary];
    MddBannerViewData * tData=[[MddBannerViewData alloc] initWithDataBannerUrlArray:array mStateButtonDic:dic];
    
    [tData setButtonData:[[MddBannerStateButtonBean alloc] initWithDataUrl:@"" mStateImageText:@"yyy"] mYesStatus:[[MddBannerStateButtonBean alloc] initWithDataUrl:@"" mStateImageText:@"zzz"] mNoStatus:[[MddBannerStateButtonBean alloc] initWithDataUrl:@"" mStateImageText:@"xxxx"]];
     mbv=[MddBannerView initializeForNibWithData:tData];
    [self.view addSubview:mbv];
    //
    mbv.mBannerData.IsWebMode=YES;
    [mbv.mUiStateButton addTarget:self action:@selector(doNext) forControlEvents:UIControlEventTouchUpInside];
}
-(void) doNext
{
    [mbv nextBanner];
}
-(NSMutableArray *) testWebArray
{
    return [NSMutableArray arrayWithObjects:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/logo_white_fe6da1ec.png",@"http://img3.imgtn.bdimg.com/it/u=1429494298,4112100027&fm=21&gp=0.jpg",@"http://baike.bdimg.com/static/wiki-lemma/widget/lemma_content/configModule/hotspotmining/img/logo_ifeng_994a265.png", nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

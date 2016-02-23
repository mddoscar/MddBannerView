//
//  MddBannerView.m
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "MddBannerView.h"
//数据
#import "MddBannerViewData.h"
#import "MddBannerStateButtonBean.h"
//缓存
#import "UIImageView+WebCache.h"

@implementation MddBannerView
@synthesize mBannerData;
@synthesize mUiBackImageView;
@synthesize mUiStateButton;
//默认图片
#define kDefImage @"MddBannerView_Def.png"
#define kNibName @"MddBannerView"
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id) initWithData:(MddBannerViewData *)pMddBannerViewData
{
    if (self=[super init]) {
        self.mBannerData=pMddBannerViewData;
        //设置样式
        self.mUiBackImageView.image=[UIImage imageNamed:kDefImage];
        if(self.mBannerData){
            if(self.mBannerData.mBannerUrlArray)
            {
                if (self.mBannerData.mCurrentIndex<0) {
                    self.mBannerData.mCurrentIndex=[self.mBannerData.mBannerUrlArray count]-1;
                }
                if (self.mBannerData.mCurrentIndex>[self.mBannerData.mBannerUrlArray count]-1) {
                    self.mBannerData.mCurrentIndex=0;
                }
                self.mUiBackImageView.image=self.mBannerData.mBannerUrlArray[self.mBannerData.mCurrentIndex];
            }else
            {
                self.mUiBackImageView.image=[UIImage imageNamed:kDefImage];
            }
            [self setButtonState:self.mBannerData.mCurrentButtonState];
             
        }
        //是否显示
        if (self.mBannerData.IsDisPlayButton) {
            [self.mUiStateButton setHidden:NO];
        }else{
            [self.mUiStateButton setHidden:YES];
        }
        
    }
    return self;
}

-(void) setButtonState:(int) pMddBannerStatus
{
    MddBannerStateButtonBean * mState=[self.mBannerData getMddBannerStateButtonBean];
    //文字
    [self.mUiStateButton setTitle:mState.mStateImageText forState:UIControlStateNormal];
    //图片暂时不用
    if (nil!=mState.mStateImageUrl&&[@"" isEqualToString:mState.mStateImageUrl]) {
        UIImage* tImg= [UIImage imageNamed:mState.mStateImageUrl];
        [self.mUiStateButton.imageView setImage:tImg];
    }
}
-(void) setData:(MddBannerViewData *)pMddBannerViewData
{
    self.mBannerData=pMddBannerViewData;
    //设置样式
    self.mUiBackImageView.image=[UIImage imageNamed:kDefImage];
    if(self.mBannerData){
        if(self.mBannerData.mBannerUrlArray)
        {
            NSString * imgStr=self.mBannerData.mBannerUrlArray[self.mBannerData.mCurrentIndex];
            self.mUiBackImageView.image=[UIImage imageNamed:imgStr];
            [self imageWithUrl:imgStr mWebMode:self.mBannerData.IsWebMode];
        }else
        {
            self.mUiBackImageView.image=[UIImage imageNamed:kDefImage];
        }
        [self setButtonState:self.mBannerData.mCurrentButtonState];
        
    }
    //如果是空的
}
+(NSString *) getDefImage
{
    return kDefImage;
}
-(NSString *) getDefImage
{
    return kDefImage;
}
+ (instancetype)initializeForNib
{
    MddBannerView *mddVc =[[[NSBundle mainBundle]loadNibNamed:kNibName owner:self options:nil]lastObject];
    return mddVc;
}
+ (instancetype)initializeForNibWithData:(MddBannerViewData *)pMddBannerViewData
{
//    NSArray * TmpNSArray=[[NSBundle mainBundle]loadNibNamed:kNibName owner:nil options:nil];
//    NSLog(@"%@",TmpNSArray);
    MddBannerView *mddVc =[[[NSBundle mainBundle]loadNibNamed:kNibName owner:self options:nil]lastObject];
    [mddVc setData:pMddBannerViewData];
    return mddVc;
//    MddBannerView *view = [[[NSBundle mainBundle] loadNibNamed:@"mddbannerView" owner:self options:nil] lastObject];
}

-(void) resetBanner
{
    if(self.mBannerData){
        //归零
        self.mBannerData.mCurrentIndex=0;
        [self setBannerWithIndex:self.mBannerData.mCurrentIndex];
    }

}
-(void) lastBanner
{
    if(self.mBannerData){
        //归零
        self.mBannerData.mCurrentIndex--;
        //超过了循环
        if (self.mBannerData.mCurrentIndex<0) {
            self.mBannerData.mCurrentIndex=[self.mBannerData.mBannerUrlArray count]-1;
        }
        [self setBannerWithIndex:self.mBannerData.mCurrentIndex];
    }
}
-(void) nextBanner
{
    if(self.mBannerData){
        //归零
        self.mBannerData.mCurrentIndex++;
        //超过了循环
        if (self.mBannerData.mCurrentIndex>[self.mBannerData.mBannerUrlArray count]-1) {
            self.mBannerData.mCurrentIndex=0;
        }
        [self setBannerWithIndex:self.mBannerData.mCurrentIndex];
    }
}
-(void) endBanner
{
    if(self.mBannerData){
        //归零
        self.mBannerData.mCurrentIndex=[self.mBannerData.mBannerUrlArray count]-1;
        [self setBannerWithIndex:self.mBannerData.mCurrentIndex];
    }
}
//
-(void) setBannerWithIndex:(long) pIndex
{
    if(self.mBannerData.mBannerUrlArray)
    {
        NSString * imgStr=self.mBannerData.mBannerUrlArray[pIndex];
        [self imageWithUrl:imgStr mWebMode:self.mBannerData.IsWebMode];
    }else
    {
        self.mUiBackImageView.image=[UIImage imageNamed:kDefImage];
    }
}
-(void ) imageWithUrl:(NSString *) pImgStr mWebMode:(BOOL)pWebMode
{
    if (pWebMode) {
       [self.mUiBackImageView sd_setImageWithURL:[NSURL URLWithString:pImgStr] placeholderImage:[UIImage imageNamed:kDefImage]];
    }else{
        self.mUiBackImageView.image=[UIImage imageNamed:pImgStr];
    }
}
/*
 MddBannerView   restoreId需要设置
 iPhone开发广义上来讲，采用MVC模型，即Model-View-Controller。其中：
 
 Model为数据模型，比如用户配置文件；
 
 View为显示的界面元素，比如一个按钮；
 
 Controller为控制器，是Model和View之间进行沟通的桥梁。其中View和Model之间不会直接通信，即Model只能与Controller之间进行彼此通信，View只能与Controller之间进行通信。
 
 
 在简单的APP中，可以没有Model，为了简单起见，本文不设计Model。
 
 
 现在假设有两个独立的视图CnView和EnView，CnView和EnView上分别有个Button和Label，对于CnView，一点击Button，Label则显示“您好”，对于EnView则显示“Hello”。下面基于这个例子来回到我们的重点。
 
 
 1. XIB文件的理解
 
 通过IB设计的CnView和EnView分别对应一个XIB文件，在CnView的XIB文件中，主要采用XML格式描述了Button和Label控件的属性（这里不考虑View本身的背景等属性），有个Button和Label，以及Button和Label的位置、大小等。EnView的XIB文件类似。
 
 2. ViewController
 
 每个View对应有个视图控制器（多个View可以采用同一个视图控制器，后边再说），可以看做MVC中的C（尽管严格意义上不是），比如：CnView界面点击按钮之后的响应动作是由ViewController来实现的。
 
 3. XIB和ViewController之间的关系
 
 XIB是表现，ViewController一方面响应XIB上的操作（比如点击、滑动等），同时也控制XIB的显示。
 
 4. File's Owner
 
 重点就是这里了，View和ViewController之间的对应关系，需要一个桥梁来进行连接的（即，对于一个视图，他如何知道自己的界面的操作应该由谁来响应），这个桥梁就是File's Owner。
 
 选中某个XIB的File's Owner，在Inspector中可以看到属性：File Name和Custom Class，该File's Owner就是用来绑定File Name中的xib文件和Custom Class中的ViewController的，在做了这个绑定之后，按住control键，拖动File's Owner到xib中的某个控件的时候，就是Custom Class中定义的IBOutlet元素与xib中元素进行连接的过程，同样，拖动"xib中的控件的动作"到File's Owner的时候，就是将xib中该动作的响应与Custom Class中某个IBAction进行连接的过程。
 
 因此，在存在多个xib文件的情况下，即：有多个View，那么每个View可以采用不同的ViewController，也可以全部采用相同的一个ViewController，通过File's Owner进行关联即可。
 
 其实，File's Owner就是Custom Class类型的对象，而xib中的其他元素都是该对象的成员变量，但是需要手动来关联Custom Class中的成员变量与xib中对象之间的关系。
 
 5. First Responder
 
 View中每次只会有一个对象与用户进行交互，那么当前交互的对象即为First Responder。比如点击文本框，那么此时文本框就是First Responder。
 
 <key>NSAppTransportSecurity</key>
 <dict>
 <key>NSAllowsArbitraryLoads</key>
 <true/>
 </dict>
 */
@end

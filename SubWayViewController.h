//
//  SubWayViewController.h
//  ProjShake
//
//  Created by ERIC.X on 14/10/14.
//  Copyright (c) 2014年 ERIC.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>

#import "CoreMotion/CoreMotion.h"

//static SystemSoundID shake_sound_id = 0;

@class SubWayViewController;

NSTimer *timer;
NSTimer *heroTimer;
NSTimer *motionTimer;

UIImageView *blurringCover;
UIImageView *wayLeaf;

UIButton *playButton;
UIButton *backwardsButton;

UILabel *prepareLabel;
UILabel *subWayTimer;
UILabel *finishLabel;

CMMotionManager *motionManager;
NSOperationQueue *queue;

UILabel *xValue;
UILabel *yValue;
UILabel *zValue;
UILabel *cValue;

CGFloat tempAccX;
CGFloat tempAccY;
CGFloat tempAccZ;
CGFloat tempAccPro;

CGFloat initialAP;

UILabel *subWayTitleA;
UILabel *subWayTitleB;
UILabel *subWayTitleC;

NSInteger sincePlay;
NSInteger sinceLast;

BOOL isOutside;
BOOL wasOutside;

NSInteger flag;
int yQueue[10];
NSNumber *temporary;
NSInteger counter;// 数组中符合条件的个数

//CMAccelerometerData *accData;

@protocol SubWayViewControllerDelegate <NSObject>

- (void)modalViewControllerDidClickedDismissButton:(SubWayViewController *)viewController;

@end

@interface SubWayViewController : UIViewController

@property (nonatomic, weak) id <SubWayViewControllerDelegate> delegate;

@end

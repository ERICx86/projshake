//
//  SubOneViewController.h
//  ProjShake
//
//  Created by ERIC.X on 14/10/3.
//  Copyright (c) 2014年 ERIC.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>

@class ModalViewController;

NSTimer *timer;
NSTimer *heroTimer;

UIImageView *blurringCover;
UIImageView *subOneHero;

UIButton *playButton;
UIButton *backwardsButton;

UILabel *prepareLabel;
UILabel *centerCounter;
UILabel *finishLabel;

NSArray *touchArray;

UILabel *subOneTitleA;
UILabel *subOneTitleB;
UILabel *subOneTitleC;

@protocol ModalViewControllerDelegate <NSObject>

- (void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController;

@end

@interface ModalViewController : UIViewController

@property (nonatomic, weak) id <ModalViewControllerDelegate> delegate;

@end
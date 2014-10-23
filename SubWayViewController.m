//
//  SubWayViewController.m
//  ProjShake
//
//  Created by ERIC.X on 14/10/14.
//  Copyright (c) 2014年 ERIC.X. All rights reserved.
//

#import "SubWayViewController.h"
#define fullScreenSize [UIScreen mainScreen].bounds.size

NSInteger preSec;
NSInteger heroSec;
CGFloat score;

CGPoint tracking;
SystemSoundID mysound;

@interface SubWayViewController ()

@end

@implementation SubWayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1.0];
    
#pragma mark -
#pragma mark Layout Ffrom The Top: First, leaf.
    wayLeaf = [[UIImageView alloc] init];
    [wayLeaf sizeToFit];
    
    wayLeaf.center = CGPointMake(fullScreenSize.width/2,
                                 fullScreenSize.height/2);
    wayLeaf.bounds = CGRectMake(0, 0,
                                fullScreenSize.width, fullScreenSize.height);
    wayLeaf.image = [UIImage imageNamed:@"leaf.png"];
    
    [self.view addSubview:wayLeaf];

#pragma mark -
#pragma mark The Counter Label: 3 + 1
    subWayTitleA = [[UILabel alloc] init];
    subWayTitleB = [[UILabel alloc] init];
    subWayTitleC = [[UILabel alloc] init];
    UILabel *subWayTitleD = [[UILabel alloc] init];
    
    [subWayTitleA sizeToFit];
    [subWayTitleB sizeToFit];
    [subWayTitleC sizeToFit];
    [subWayTitleD sizeToFit];
    
    subWayTitleA.center = CGPointMake(fullScreenSize.width * 3/10,
                                      fullScreenSize.height * 7/10);// 高度暂定4/5比例
    subWayTitleB.center = CGPointMake(fullScreenSize.width * 5/10,
                                      fullScreenSize.height * 7/10);
    subWayTitleC.center = CGPointMake(fullScreenSize.width * 7/10,
                                      fullScreenSize.height * 7/10);
    subWayTitleD.center = CGPointMake(fullScreenSize.width * 9/10,
                                      fullScreenSize.height * 7/10);
    
    subWayTitleA.bounds = CGRectMake(fullScreenSize.width * 1/5,
                                     fullScreenSize.height * 4/5,
                                     fullScreenSize.width/5 - 4.0,
                                     fullScreenSize.width/5 * 4/3);
    subWayTitleB.bounds = CGRectMake(fullScreenSize.width * 2/5,
                                     fullScreenSize.height * 4/5,
                                     fullScreenSize.width/5 - 4.0,
                                     fullScreenSize.width/5 * 4/3);
    subWayTitleC.bounds = CGRectMake(fullScreenSize.width * 3/5,
                                     fullScreenSize.height * 4/5,
                                     fullScreenSize.width/5 - 4.0,
                                     fullScreenSize.width/5 * 4/3);
    subWayTitleD.bounds = CGRectMake(fullScreenSize.width * 4/5,
                                     fullScreenSize.height * 4/5,
                                     fullScreenSize.width/5 - 4.0,
                                     fullScreenSize.height/5 * 4/3);
    
    subWayTitleA.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:148.0/255.0 blue:128.0/255.0 alpha:0.9];// 米色 #A39480
    subWayTitleB.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:148.0/255.0 blue:128.0/255.0 alpha:0.9];// 米色 #A39480
    subWayTitleC.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:148.0/255.0 blue:128.0/255.0 alpha:0.9];// 米色 #A39480
    
    subWayTitleA.font = [UIFont fontWithName:@"Helvetica Neue" size:32];
    subWayTitleB.font = [UIFont fontWithName:@"Helvetica Neue" size:32];
    subWayTitleC.font = [UIFont fontWithName:@"Helvetica Neue" size:32];
    subWayTitleD.font = [UIFont fontWithName:@"Helvetica Neue" size:32];
    
    subWayTitleA.numberOfLines = 1;
    subWayTitleB.numberOfLines = 1;
    subWayTitleC.numberOfLines = 1;
    subWayTitleD.numberOfLines = 1;
    
    subWayTitleA.text = @"0";
    subWayTitleB.text = @"0";
    subWayTitleC.text = @"0";
    subWayTitleD.text = @"次";
    
    subWayTitleA.textColor = [UIColor whiteColor];
    subWayTitleB.textColor = [UIColor whiteColor];
    subWayTitleC.textColor = [UIColor whiteColor];
    subWayTitleD.textColor = [UIColor whiteColor];
    
    subWayTitleA.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    subWayTitleB.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    subWayTitleC.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    subWayTitleD.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    
    subWayTitleA.shadowOffset = CGSizeMake(2.0, 2.0);
    subWayTitleB.shadowOffset = CGSizeMake(2.0, 2.0);
    subWayTitleC.shadowOffset = CGSizeMake(2.0, 2.0);
    subWayTitleD.shadowOffset = CGSizeMake(2.0, 2.0);
    
    subWayTitleA.textAlignment = NSTextAlignmentCenter;
    subWayTitleB.textAlignment = NSTextAlignmentCenter;
    subWayTitleC.textAlignment = NSTextAlignmentCenter;
    subWayTitleD.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:subWayTitleA];
    [self.view addSubview:subWayTitleB];
    [self.view addSubview:subWayTitleC];
    [self.view addSubview:subWayTitleD];
    
#pragma mark -
#pragma mark The Timer Label: 1 + 1
    subWayTimer = [[UILabel alloc] init];
    [subWayTimer sizeToFit];
    
    subWayTimer.center = CGPointMake(fullScreenSize.width/2,
                                     fullScreenSize.height * 9/10);
    subWayTimer.bounds = CGRectMake(fullScreenSize.width * (1/2 - 1/8),
                                    fullScreenSize.height * 9/10,
                                    fullScreenSize.width/4,
                                    fullScreenSize.width/4);
    
    subWayTimer.font = [UIFont fontWithName:@"Helvetica Neue Bold" size:28];
    subWayTimer.numberOfLines = 1;
    subWayTimer.text = @"15";
    subWayTimer.textColor = [UIColor whiteColor];
    subWayTimer.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:148.0/255.0 blue:128.0/255.0 alpha:0.9];// 米色 #A39480
    subWayTimer.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:subWayTimer];
    
    UILabel *subWayTimerSec = [[UILabel alloc] init];
    [subWayTimerSec sizeToFit];
    
    subWayTimerSec.center = CGPointMake(subWayTimer.center.x + fullScreenSize.width/4,
                                        subWayTimer.center.y);
    subWayTimerSec.bounds = CGRectMake(fullScreenSize.width * (1/2 + 1/8),
                                       subWayTimer.bounds.origin.y,
                                       fullScreenSize.width/4,
                                       fullScreenSize.width/4);
    
    subWayTimerSec.font = [UIFont fontWithName:@"Helvetica Neue Bold" size:28];
    subWayTimerSec.numberOfLines = 1;
    subWayTimerSec.text = @"秒";
    subWayTimerSec.textColor = [UIColor whiteColor];
    subWayTimerSec.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:subWayTimerSec];
    
#pragma mark -
#pragma mark Before Game Starts: 1 Cover + 2 Buttons
    blurringCover = [[UIImageView alloc] init];
    [blurringCover sizeToFit];
    
    blurringCover.center = CGPointMake(fullScreenSize.width/2,
                                       fullScreenSize.height/2);
    blurringCover.bounds = CGRectMake(0.0, 0.0,
                                      fullScreenSize.width, fullScreenSize.height);
    blurringCover.image = [UIImage imageNamed:@"blurringCover.png"];
    
    [self.view addSubview:blurringCover];
    
    backwardsButton = [[UIButton alloc] init];
    [backwardsButton sizeToFit];
    
    backwardsButton.center = CGPointMake(fullScreenSize.width/2,
                                         fullScreenSize.height * 5/8);
    backwardsButton.bounds = CGRectMake(fullScreenSize.width/4,
                                        fullScreenSize.height * (3/8 + 1/16),
                                        fullScreenSize.width/2,
                                        fullScreenSize.height/8);
    
    [backwardsButton setTitle:@"BACK" forState:UIControlStateNormal];
    [backwardsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backwardsButton setBackgroundColor:[UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:0.5]];// %50透明度的orangeColor
    backwardsButton.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:24.0];
    backwardsButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    backwardsButton.showsTouchWhenHighlighted = YES;
    [backwardsButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backwardsButton];
    
    playButton = [[UIButton alloc] init];
    [playButton sizeToFit];
    playButton.center = CGPointMake(fullScreenSize.width/2,
                                    fullScreenSize.height * 3/8);
    playButton.bounds = CGRectMake(fullScreenSize.width/4,
                                   fullScreenSize.height * (3/8 - 1/16),
                                   fullScreenSize.width/2,
                                   fullScreenSize.height/8);
    
    [playButton setTitle:@"PLAY" forState:UIControlStateNormal];
    [playButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [playButton setBackgroundColor:[UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:0.5]];// %50透明度的orangeColor
    playButton.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:24.0];
    playButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    playButton.showsTouchWhenHighlighted = YES;
    [playButton addTarget:self action:@selector(playTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:playButton];
    
#pragma mark -
#pragma mark The 3-2-1 View: 1 Fullscreen Label
    prepareLabel = [[UILabel alloc] init];
    [prepareLabel sizeToFit];
    
    prepareLabel.center = CGPointMake(fullScreenSize.width/2,
                                      fullScreenSize.height/2);
    prepareLabel.bounds = CGRectMake(0, 0,
                                     fullScreenSize.width, fullScreenSize.height);
    
    prepareLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:512];
    prepareLabel.textColor = [UIColor whiteColor];
    prepareLabel.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    prepareLabel.shadowOffset = CGSizeMake(2.0, 2.0);
    prepareLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:prepareLabel];
    //   ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
    //  ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
    // ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
    
    NSString *sndpath = [[NSBundle mainBundle] pathForResource:@"shake_sound_id" ofType:@"wav"];
    CFURLRef baseURL = (__bridge CFURLRef)[NSURL fileURLWithPath:sndpath];
    
    // Identify it as not a UI Sound
    AudioServicesCreateSystemSoundID(baseURL, &mysound);
    AudioServicesPropertyID flag = 0;  // 0 means always play
    AudioServicesSetProperty(kAudioServicesPropertyIsUISound, sizeof(SystemSoundID), &mysound, sizeof(AudioServicesPropertyID), &flag);
}

#pragma mark -
#pragma mark 2 Actions: playTapped & Backwards action
- (void)playTapped:(id)sender
{
    [playButton removeFromSuperview];
    [backwardsButton removeFromSuperview];
    
    [self updateAccInfo];
    
    preSec = 3;
    heroSec = 30;
    score = 0;
    wasOutside = false;
    sincePlay = 0;
    sinceLast = -100;
    flag = 0;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.75
                                             target:self
                                           selector:@selector(preCountDown)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)buttonTapped:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(modalViewControllerDidClickedDismissButton:)]) {
        [self.delegate modalViewControllerDidClickedDismissButton:self];
    }
}

#pragma mark -
#pragma mark 2 Timer Method: preCountDown & mainCountDown
- (void)preCountDown
{
    if (preSec == -1) {
        [timer invalidate];
        [prepareLabel removeFromSuperview];

        heroTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                     target:self
                                                   selector:@selector(mainCountDown)
                                                   userInfo:nil
                                                    repeats:YES];
//        motionTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/100.0f// 这是记录重力加速度的Timer，连接motionMonitor方法
//                                                       target:self
//                                                     selector:@selector(motionMonitor)
//                                                     userInfo:nil
//                                                      repeats:YES];
        subWayTimer.text = @"15";
        [blurringCover removeFromSuperview];
        [heroTimer fire];
        [motionTimer fire];
        
        return;
        
    } else if (preSec == 0) {
        // Game begins!
        prepareLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:196];
        prepareLabel.text = @"Go!";
        preSec--;
        
        return;
        
    } else if (preSec == 1) {
        prepareLabel.text = @"1";
        initialAP = tempAccPro;// 此处操作a的初始值
//        NSLog(@"\t\tInitial = %0.2f", 100*initialAP);
        preSec --;
        
    } else {
        // Refresh the timer once per Sec.
        prepareLabel.text = [[NSString alloc] initWithFormat:@"%ld", (long)preSec--];
        
        return;
    }
}

//- (void)motionMonitor {
//    if (tempAccPro  > 3.2) {
//        isOutside = true;
//    } else {
//        isOutside = false;
//    }
//    
//    if (wasOutside != isOutside) {
//        if (sincePlay - sinceLast > 0) {
//            score += 1;
//            sinceLast = sincePlay;
//            NSLog(@"\tscore ++");
//        }
//        
//        wasOutside = isOutside;
//        
//        subWayTitleC.text = [[NSString alloc] initWithFormat:@"%i", (int)score%10];
//        subWayTitleB.text = [[NSString alloc] initWithFormat:@"%i", (int)score%100/10];
//        subWayTitleA.text = [[NSString alloc] initWithFormat:@"%i", (int)score/100];
//    }
//}

- (void)mainCountDown
{
    if (heroSec < 0) {// 倒计时已结束：
        [heroTimer invalidate];
        
        [self.view addSubview:blurringCover];
        [self.view addSubview:backwardsButton];
        
        finishLabel = [[UILabel alloc] init];
        [finishLabel sizeToFit];
        
        finishLabel.center = CGPointMake(fullScreenSize.width/2,
                                         fullScreenSize.height/4);
        finishLabel.bounds = CGRectMake(0, 64.0,
                                        fullScreenSize.width, fullScreenSize.height/4);
        
        finishLabel.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:148.0/255.0 blue:128.0/255.0 alpha:0.9];// 米色 #A39480
        finishLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:32];
        finishLabel.numberOfLines = 2;
        
        finishLabel.textColor = [UIColor whiteColor];
        finishLabel.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8];
        finishLabel.shadowOffset = CGSizeMake(2.0, 2.0);
        finishLabel.textAlignment = NSTextAlignmentCenter;
        finishLabel.text = [NSString stringWithFormat:@"  游戏结束！\n得分：%ld", (long)score];
        
        [self.view addSubview:finishLabel];
        
    } else {// 倒计时还在继续：
        subWayTimer.text = [[NSString alloc] initWithFormat:@"%ld", (long)heroSec--];
    }
}

#pragma mark -
#pragma mark Core Motion Module
- (void)updateAccInfo// 监测重力感应的方法
{
    motionManager = [[CMMotionManager alloc] init];
    motionManager.accelerometerUpdateInterval = 1.0/100.0;
    
    if (motionManager.accelerometerAvailable) {
        NSLog(@"AccMode Engaged");
        
        queue = [NSOperationQueue currentQueue];
        [motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accData, NSError *error) {
            CMAcceleration accXYZ = accData.acceleration;
            
            tempAccX = accXYZ.x;
            tempAccY = accXYZ.y;
            tempAccZ = accXYZ.z;
            tempAccPro = sqrt(accXYZ.x * accXYZ.x
                              + accXYZ.y * accXYZ.y
                              + accXYZ.z * accXYZ.z);
            // 将来此处留给记录a(初)，以及采样点
            sincePlay ++;
            
            NSLog(@"\t\t\t\t\t\t\t\t\t%.2f\t%.2f\t%.2f\t%.2f", 100*tempAccX, 100*tempAccY, 100*tempAccZ, 100*tempAccPro);

            // 不停地将Y值压入队列
            NSLog(@"%lu", sizeof(yQueue)/sizeof(yQueue[0]));
        
            yQueue[flag%10] = tempAccY;
            flag ++;
            // yqueue此时容量应为10个，需要根据flag值remove掉最早的值，然后add进新数值
            
            //////// 将来这里需要做成一个自动循环，将flag对10求余，自动加入数组
            counter = 0;
            for (int i = 0; i < 10; i++) {
                double arrayTemp = yQueue[i];
                if (arrayTemp < -1.0) {
                    counter ++;
                }
            }
            if (counter > 4) {// 阀值暂定为5个
                isOutside = true;
            } else {
                isOutside = false;
            }
            
            if (isOutside != wasOutside) {
                score += 0.5;
                [self soundEffects];
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
                wasOutside = isOutside;
            }

            subWayTitleC.text = [[NSString alloc] initWithFormat:@"%i", (int)score%10];
            subWayTitleB.text = [[NSString alloc] initWithFormat:@"%i", (int)score%100/10];
            subWayTitleA.text = [[NSString alloc] initWithFormat:@"%i", (int)score/100];
            
        }];
    }
}

- (void)soundEffects
{
    if ([MPMusicPlayerController systemMusicPlayer].playbackState ==  MPMusicPlaybackStatePlaying)
        AudioServicesPlayAlertSound(mysound);
    else
        AudioServicesPlaySystemSound(mysound);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

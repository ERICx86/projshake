//
//  SubOneViewController.m
//  ProjShake
//
//  Created by ERIC.X on 14/10/3.
//  Copyright (c) 2014年 ERIC.X. All rights reserved.
//

#import "SubOneViewController.h"
#define fullScreenSize [UIScreen mainScreen].bounds.size

NSInteger preSec;
NSInteger heroSec;
NSInteger score;

CGPoint tracking;

BOOL isInside;
BOOL lastBool;
BOOL isNew;

SystemSoundID mysound;

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1.0];
    
#pragma mark -
#pragma mark layout from the top:
    subOneTitleA = [[UILabel alloc] init];// 百位数字label
    [subOneTitleA sizeToFit];
    
    subOneTitleA.center = CGPointMake(fullScreenSize.width * 3/10,
                                      20 + 100 + fullScreenSize.width/5/2 * 4/3);
    subOneTitleA.bounds = CGRectMake(fullScreenSize.width/5,
                                     20 + 100,
                                     fullScreenSize.width/5 - 4,
                                     fullScreenSize.width/5 * 4/3);// H = 4/3 * W
    
    subOneTitleA.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:148.0/255.0 blue:128.0/255.0 alpha:0.9];// 米色 #A39480
    subOneTitleA.font = [UIFont fontWithName:@"Helvetica Neue" size:32];
    subOneTitleA.numberOfLines = 1;
    
    subOneTitleA.text = @"0";
    subOneTitleA.textColor = [UIColor whiteColor];
    subOneTitleA.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    subOneTitleA.shadowOffset = CGSizeMake(2.0, 2.0);
    subOneTitleA.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:subOneTitleA];
    
    subOneTitleB = [[UILabel alloc] init];// 十位数字label
    [subOneTitleB sizeToFit];
    
    subOneTitleB.center = CGPointMake(subOneTitleA.center.x + fullScreenSize.width/5,
                                      subOneTitleA.center.y);
    subOneTitleB.bounds = CGRectMake(fullScreenSize.width * 2/5,
                                     subOneTitleA.bounds.origin.y,
                                     fullScreenSize.width/5 - 4,
                                     fullScreenSize.width/5 * 4/3);
    
    subOneTitleB.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:148.0/255.0 blue:128.0/255.0 alpha:0.9];// 米色 #A39480
    subOneTitleB.font = [UIFont fontWithName:@"Helvetica Neue" size:32];
    subOneTitleB.numberOfLines = 1;
    
    subOneTitleB.text = @"0";
    subOneTitleB.textColor = [UIColor whiteColor];
    subOneTitleB.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    subOneTitleB.shadowOffset = CGSizeMake(2.0, 2.0);
    subOneTitleB.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:subOneTitleB];
    
    subOneTitleC = [[UILabel alloc] init];// 个位数字label
    [subOneTitleC sizeToFit];
    
    subOneTitleC.center = CGPointMake(subOneTitleB.center.x + fullScreenSize.width/5,
                                      subOneTitleA.center.y);
    subOneTitleC.bounds = CGRectMake(fullScreenSize.width * 3/5,
                                     subOneTitleA.bounds.origin.y,
                                     fullScreenSize.width/5 - 4,
                                     fullScreenSize.width/5 * 4/3);
    
    subOneTitleC.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:148.0/255.0 blue:128.0/255.0 alpha:0.9];// 米色 #A39480
    subOneTitleC.font = [UIFont fontWithName:@"Helvetica Neue" size:32];
    subOneTitleC.numberOfLines = 1;
    
    subOneTitleC.text = @"0";
    subOneTitleC.textColor = [UIColor whiteColor];
    subOneTitleC.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    subOneTitleC.shadowOffset = CGSizeMake(2.0, 2.0);
    subOneTitleC.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:subOneTitleC];
    
    UILabel *subOneTitleE = [[UILabel alloc] init];// 末尾label
    [subOneTitleE sizeToFit];
    
    subOneTitleE.center =CGPointMake(subOneTitleC.center.x + fullScreenSize.width/5,
                                     subOneTitleA.center.y);
    subOneTitleE.bounds = CGRectMake(fullScreenSize.width * 4/5,
                                     subOneTitleA.bounds.origin.y,
                                     fullScreenSize.width/5 - 4,
                                     fullScreenSize.width/5 * 4/3);
    
    subOneTitleE.font = [UIFont fontWithName:@"Helvetica Neue" size:32];
    subOneTitleE.numberOfLines = 1;
    
    subOneTitleE.text = @"次";
    subOneTitleE.textColor = [UIColor whiteColor];
    subOneTitleE.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    subOneTitleE.shadowOffset = CGSizeMake(2.0, 2.0);
    subOneTitleE.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:subOneTitleE];
    
#pragma mark -
#pragma mark below the top 3 label:
    centerCounter = [[UILabel alloc] init];
    [centerCounter sizeToFit];
    
    centerCounter.center = CGPointMake(fullScreenSize.width/2,
                                       fullScreenSize.height/2);
    centerCounter.bounds = CGRectMake(fullScreenSize.width * (1/2 - 1/8),
                                      fullScreenSize.height/2 - fullScreenSize.width * 1/8,
                                      fullScreenSize.width/4,
                                      fullScreenSize.width/4);
    
    centerCounter.backgroundColor = [UIColor colorWithRed:163.0/255.0 green:148.0/255.0 blue:128.0/255.0 alpha:0.9];// 米色 #A39480
    centerCounter.font = [UIFont fontWithName:@"Helvetica Neue Bold" size:32];
    centerCounter.numberOfLines = 1;
    
    centerCounter.textColor = [UIColor blackColor];
    centerCounter.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:centerCounter];
    
    UILabel *centerLabel = [[UILabel alloc] init];
    [centerLabel sizeToFit];
    
    centerLabel.center = CGPointMake(centerCounter.center.x + fullScreenSize.width/4,
                                     fullScreenSize.height/2);
    centerLabel.bounds = CGRectMake(fullScreenSize.width * (1/2 + 1/8),
                                    fullScreenSize.height/2 - fullScreenSize.width * 1/8,
                                    fullScreenSize.width/4,
                                    fullScreenSize.width/4);
    
    centerLabel.font = [UIFont fontWithName:@"Helvetica Neue Bold" size:28];
    centerLabel.numberOfLines = 1;
    
    centerLabel.text = @"秒";
    centerLabel.textColor = [UIColor whiteColor];
    centerLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:centerLabel];
    
#pragma mark -
#pragma mark subOneHero:
    subOneHero = [[UIImageView alloc] init];
    [subOneHero sizeToFit];
    
    subOneHero.center = CGPointMake(fullScreenSize.width/2, fullScreenSize.height * 7/10);
    subOneHero.bounds = CGRectMake(fullScreenSize.width/2 -24.0,
                                   fullScreenSize.height * 7/10 - 24.0,
                                   48.0,
                                   48.0);
    subOneHero.image = [UIImage imageNamed:@"space-120.png"];
    
    [self.view addSubview:subOneHero];
    
#pragma mark -
#pragma mark the VC Module:
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
#pragma mark preparing module
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
    //   ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
    //  ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
    // ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
    
    NSString *sndpath = [[NSBundle mainBundle] pathForResource:@"shake_sound_id" ofType:@"wav"];
    CFURLRef baseURL = (__bridge CFURLRef)[NSURL fileURLWithPath:sndpath];
    
    // Identify it as not a UI Sound
    AudioServicesCreateSystemSoundID(baseURL, &mysound);
    AudioServicesPropertyID flag = 0;  // 0 means always play
    AudioServicesSetProperty(kAudioServicesPropertyIsUISound, sizeof(SystemSoundID), &mysound, sizeof(AudioServicesPropertyID), &flag);

}

#pragma mark -
#pragma mark "PLAY" button tapped, 3-2-1 Animation:
- (void)playTapped:(id)sender
{
    [playButton removeFromSuperview];
    [backwardsButton removeFromSuperview];

    preSec = 3;
    heroSec = 30;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.75
                                             target:self
                                           selector:@selector(preCountDown)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)mainCountDown
{
    if (heroSec < 0) {
        [heroTimer invalidate];
        
#pragma mark -
#pragma mark Game is over!
        [self.view addSubview:blurringCover];
        [self.view addSubview:backwardsButton];
        
#pragma mark -
#pragma mark Congrats!
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
        
    } else {
        centerCounter.text = [[NSString alloc] initWithFormat:@"%ld", (long)heroSec--];
    }
}


#pragma mark -
#pragma mark preparing:
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
        [heroTimer fire];
        score = 0;
        centerCounter.text = @"30";
        subOneTitleA.text = @"0";
        subOneTitleB.text = @"0";
        subOneTitleC.text = @"0";
        
        
        [blurringCover removeFromSuperview];
        
        return;
        
    } else if (preSec == 0) {
        // Game begins!
        preSec--;
        prepareLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:196];
        prepareLabel.text = @"Go!";
        
        return;
        
    } else {
        // Refresh the timer once per Sec.
        prepareLabel.text = [[NSString alloc] initWithFormat:@"%ld", (long)preSec--];
        
        return;
        
    }
}

- (void)buttonTapped:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(modalViewControllerDidClickedDismissButton:)]) {
        [self.delegate modalViewControllerDidClickedDismissButton:self];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
{
    touchArray = [[event allTouches] allObjects];// touchArray为所有触点坐标数组
    tracking = [[touchArray objectAtIndex:0] locationInView:self.view];// trcaking赋为touchArray[0]
    NSLog(@"P (%.1f, %.1f)", tracking.x, tracking.y);// 输出tracking和tracked值
    NSLog(@"%i", isNew);
    
    if (fabs(tracking.x - subOneHero.center.x) <= 12.0 &&
        fabs(tracking.y - subOneHero.center.y) <= 12.0) {// 如果第一次就着落在目标区域内
        score ++;
        [self soundEffects];
        NSLog(@"Score plused via 1st shoot!");
        
        subOneTitleC.text = [[NSString alloc] initWithFormat:@"%li", (long)score%10];
        subOneTitleB.text = [[NSString alloc] initWithFormat:@"%li", (long)score%100/10];
        subOneTitleA.text = [[NSString alloc] initWithFormat:@"%li", (long)score/100];
        
        CGFloat tempW = subOneHero.bounds.size.width;
        CGFloat tempH = subOneHero.bounds.size.height;
        subOneHero.bounds = CGRectMake(subOneHero.bounds.origin.x,
                                       subOneHero.bounds.origin.y,
                                       tempW * 1.0125,
                                       tempH * 1.0125);// Hero膨胀
        isInside = true;
    } else {// 第一次着落在目标区域外
        isInside = false;
    }
    lastBool = isInside;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event// 触点移动之后
{
    touchArray = [[event allTouches] allObjects];// touchArray为所有触点坐标数组
    tracking = [[touchArray objectAtIndex:0] locationInView:self.view];// trcaking赋为touchArray[0]
    NSLog(@"P (%.1f, %.1f)", tracking.x, tracking.y);// 输出tracking和tracked值
    NSLog(@"%i", isNew);
    
    if (fabs(tracking.x - subOneHero.center.x) <= 12.0 &&
        fabs(tracking.y - subOneHero.center.y) <= 12.0) {
        isInside = true;
    } else {
        isInside = false;
    }
    
    if (lastBool == true && isInside == false) {
        score ++;
        [self soundEffects];
        NSLog(@"Score plused via going through!");
        
        subOneTitleC.text = [[NSString alloc] initWithFormat:@"%li", (long)score%10];
        subOneTitleB.text = [[NSString alloc] initWithFormat:@"%li", (long)score%100/10];
        subOneTitleA.text = [[NSString alloc] initWithFormat:@"%li", (long)score/100];
        
        CGFloat tempW = subOneHero.bounds.size.width;
        CGFloat tempH = subOneHero.bounds.size.height;
        subOneHero.bounds = CGRectMake(subOneHero.bounds.origin.x,
                                       subOneHero.bounds.origin.y,
                                       tempW * 1.0125,
                                       tempH * 1.0125);// Hero膨胀
    }
    lastBool = isInside;
}

- (void)soundEffects
{
    if ([MPMusicPlayerController systemMusicPlayer].playbackState ==  MPMusicPlaybackStatePlaying)
        AudioServicesPlayAlertSound(mysound);
    else
        AudioServicesPlaySystemSound(mysound);
}

//    if (isNew == true) {
////        tracking = [[touchArray objectAtIndex:0] locationInView:self.view];// tracking赋为touchArray[0]
//        if (fabs(tracking.x - subOneHero.center.x) <= subOneHero.bounds.size.width/2 && fabs(tracking.y - subOneHero.center.y) <= subOneHero.bounds.size.height/2) {
//            //// tracking与Image中心的x距离不大于Image宽度的一半，并且，tracking与Image中心的y距离不大于Image高度的一半
//            NSLog(@"It was inside!");// 那么，tracking一定在Image内部
//            isInside = YES;// isInside为BOOL型，判断tracking是否在Image中
//        } else {
//            NSLog(@"It was outside!");// 只要不在内部，就一定在外部
//            isInside = NO;// BOOL型为NO
//        }
//        lastBool = isInside;// 使用lastBOOL记录上一次的isInside值
//        isNew = false;
//        
//    } else {
//        if (fabs(tracking.x - subOneHero.center.x) <= subOneHero.bounds.size.width/2// 同上
//            && fabs(tracking.y - subOneHero.center.y) <= subOneHero.bounds.size.height/2) {// 同上
//            NSLog(@"It is inside!");
//            isInside = YES;
//        } else {
//            NSLog(@"It is\t\t\t outside!");
//            isInside = NO;
//        }
//        
//        if (lastBool != isInside) {
//            NSLog(@"Score +1 !!!");
//            score ++;
//            
//            subOneTitleC.text = [[NSString alloc] initWithFormat:@"%li", (long)score%10];
//            subOneTitleB.text = [[NSString alloc] initWithFormat:@"%li", (long)score%100/10];
//            subOneTitleA.text = [[NSString alloc] initWithFormat:@"%li", (long)score/100];
//            
//            CGFloat tempW = subOneHero.bounds.size.width;
//            CGFloat tempH = subOneHero.bounds.size.height;
//            subOneHero.bounds = CGRectMake(subOneHero.bounds.origin.x,
//                                           subOneHero.bounds.origin.y,
//                                           tempW * 1.0125,
//                                           tempH * 1.0125);
//        }
//        lastBool = isInside;
//    }

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
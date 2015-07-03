//
//  Timer.m
//  RunTracker
//
//  Created by Ethan Hess on 6/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "Timer.h"

@interface Timer ()

@property (nonatomic) BOOL isOn;

@end

@implementation Timer

+ (Timer *)sharedInstance {
    static Timer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Timer new];
    });
    
    return sharedInstance;
    
}

//- (void)registerForNotifications {
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancelTimer) name:timerStarted object:nil];
//    
//}

- (void)startTimer:(id)sender {
    
    self.isOn = YES;
    [self isActive];
    
}

- (void)isActive {
    
    if (self.isOn == YES) {
        [self increaseSecond];
        
        [self performSelector:@selector(isActive) withObject:nil afterDelay:1];
    }
    
}

- (void)pauseTimer:(id)sender {
    
    self.isOn = NO;
    
}

- (void)increaseSecond {
    
    if (self.seconds == 0) {
        self.seconds ++;
        [[NSNotificationCenter defaultCenter]postNotificationName:secondTickNotification object:nil];
    }
    else if (self.seconds == 60 && self.minutes >= 0) {
        self.minutes ++;
        self.seconds = 0;
        [[NSNotificationCenter defaultCenter]postNotificationName:secondTickNotification object:nil];

    }
    else
    {
        self.seconds++;
        [[NSNotificationCenter defaultCenter]postNotificationName:secondTickNotification object:nil];
    }
    
}

@end

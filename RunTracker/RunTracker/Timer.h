//
//  Timer.h
//  RunTracker
//
//  Created by Ethan Hess on 6/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const secondTickNotification = @"secondTickNotification";
static NSString * const timerStarted = @"timerStarted";

@interface Timer : NSObject

@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;

+ (Timer *)sharedInstance;

- (void)startTimer:(id)sender;

- (void)pauseTimer:(id)sender;

@end

//
//  SavedTimesController.h
//  RunTracker
//
//  Created by Ethan Hess on 6/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeEntry.h"
#import "Stack.h"

@interface SavedTimesController : NSObject

@property (nonatomic, strong) NSArray *savedTimes;

+ (SavedTimesController *)sharedInstance;

- (void)addTimeEntryWithTitle:(NSString *)title andTime:(NSString *)time;

- (void)removeTimeEntry:(TimeEntry *)timeEntry; 

@end

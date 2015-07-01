//
//  SavedTimesController.m
//  RunTracker
//
//  Created by Ethan Hess on 6/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SavedTimesController.h"

@implementation SavedTimesController

+ (SavedTimesController *)sharedInstance {
    static SavedTimesController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SavedTimesController new];
    });
    
    return sharedInstance;
    
}

- (NSArray *)savedTimes {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"TimeEntry"];
    
    NSArray *objects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    return objects;
    
}


- (void)addTimeEntryWithTitle:(NSString *)title andTime:(NSString *)time {
    
    TimeEntry *timeEntry = [NSEntityDescription insertNewObjectForEntityForName:@"TimeEntry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    timeEntry.title = title;
    timeEntry.time = time;
    
    [self synchronize];
    
}

- (void)removeTimeEntry:(TimeEntry *)timeEntry {
    
    [timeEntry.managedObjectContext deleteObject:timeEntry];
    
    [self synchronize];
}

- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
}


@end

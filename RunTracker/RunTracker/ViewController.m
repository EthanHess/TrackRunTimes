//
//  ViewController.m
//  RunTracker
//
//  Created by Ethan Hess on 6/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *saveTimeButton;

@end

@implementation ViewController

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.timer = [Timer sharedInstance];
        [self registerForNotifications];
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.startButton.layer.cornerRadius = self.startButton.frame.size.height / 2;
    self.startButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.startButton.layer.borderWidth = 3.0;
    
    self.pauseButton.layer.cornerRadius = self.pauseButton.frame.size.height / 2;
    self.pauseButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.pauseButton.layer.borderWidth = 3.0;
    
    self.saveTimeButton.layer.cornerRadius = self.saveTimeButton.frame.size.height / 2;
    self.saveTimeButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.saveTimeButton.layer.borderWidth = 3.0;
    
    self.resetButton.layer.cornerRadius = self.resetButton.frame.size.height / 2;
    self.resetButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.resetButton.layer.borderWidth = 3.0;
    
    self.timer.minutes = 0;
    [self updateTimerLabel];
}

- (void)registerForNotifications {
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateTimerLabel) name:secondTickNotification object:nil];
}

- (void)updateTimerLabel {
    
    self.timerLabel.text = [NSString stringWithFormat:@"%lu:%02lu", (long)self.timer.minutes, (long)self.timer.seconds];
    
}

- (IBAction)startTimer:(id)sender {
    
    self.startButton.enabled = NO;
    
    [[Timer sharedInstance] startTimer:sender];
    
}


- (IBAction)pauseTimer:(id)sender {
    
    self.startButton.enabled = YES;
    
    [[Timer sharedInstance] pauseTimer:sender];
    
}

- (IBAction)resetTimer:(id)sender {
    
    self.timer.minutes = 0;
    self.timer.seconds = 0;
    
    [self updateTimerLabel];
    
    
}

- (IBAction)saveTime:(id)sender {
    
    [[SavedTimesController sharedInstance]addTimeEntryWithTitle:self.textField.text andTime:self.timerLabel.text];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

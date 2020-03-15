//
//  ConferenceViewController.m
//  Runner
//
//  Created by heyong on 2019/7/9.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//
#import "ConferenceViewController.h"
#import <Flutter/Flutter.h>

@interface ConferenceViewController ()

@end

@implementation ConferenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Attach this controller as the delegate.
    JitsiMeetView *jitsiView = [[JitsiMeetView alloc] init];
    jitsiView.delegate = self;
    
    [self.view addSubview:jitsiView];
    jitsiView.frame = self.view.bounds;
    // Join the room.
    if (JitsiMeet.sharedInstance == nil) {
        JitsiMeetConferenceOptions *defaultOptions
        = [JitsiMeetConferenceOptions fromBuilder:^(JitsiMeetConferenceOptionsBuilder *builder) {
            builder.serverURL = [NSURL URLWithString:@"https://meet.jit.si"];
            builder.welcomePageEnabled = NO;
        }];
        [JitsiMeet sharedInstance].defaultConferenceOptions = defaultOptions;
    }
    JitsiMeetConferenceOptions *options
    = [JitsiMeetConferenceOptions fromBuilder:^(JitsiMeetConferenceOptionsBuilder *builder) {
        if (self.option != nil) {
            NSLog(@"builder==%@", self.option);
            builder.room = self.option[@"room"];
            builder.videoMuted = ![[self.option objectForKey:@"video"] boolValue];
            builder.audioMuted = ![[self.option objectForKey:@"audio"] boolValue];
        }
    }];
    [jitsiView join:options];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)conferenceWillJoin:(NSDictionary *)data {
    [self.messageChannel sendMessage:@"conference.willjoin"];
    NSLog(@"About to join conference %@", self.option);
}

- (void)conferenceJoined:(NSDictionary *)data {
    [self.messageChannel sendMessage:@"conference.joined"];
    NSLog(@"Conference %@ joined", self.option);
}

- (void)conferenceTerminated:(NSDictionary *)data {
    NSLog(@"Conference %@ terminated", self.option);
    [self.messageChannel sendMessage:@"conference.terminated"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end


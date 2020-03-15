//
//  ConferenceViewController.h
//  Runner
//
//  Created by heyong on 2019/7/9.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>
@import JitsiMeet;


@interface ConferenceViewController : UIViewController<JitsiMeetViewDelegate>

@property (nonatomic, weak) FlutterBasicMessageChannel* messageChannel;
@property (nonatomic, weak) NSDictionary *option;

@end

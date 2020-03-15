#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@import JitsiMeet;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    FlutterMethodChannel* flutterMethodChannel = [FlutterMethodChannel
                                                  methodChannelWithName:@"moa.flutter.io/method"
                                                  binaryMessenger:controller];
    FlutterBasicMessageChannel* messageChannel = [FlutterBasicMessageChannel messageChannelWithName:@"moa.flutter.io/message" binaryMessenger:controller];
    [flutterMethodChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        // TODO
        if ([@"/conference/join" isEqualToString:call.method]) {
            NSDictionary *args = call.arguments;
            NSLog(@"arguments = %@", args);
            ConferenceViewController* meetVC = [[ConferenceViewController alloc] init];
            meetVC.option = args;
            meetVC.messageChannel = messageChannel;
            [controller presentViewController:meetVC animated:YES completion:nil];
        }
    }];
    
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end

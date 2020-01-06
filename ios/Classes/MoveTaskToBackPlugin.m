#import "MoveTaskToBackPlugin.h"

@implementation MoveTaskToBackPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"move_task_to_back"
            binaryMessenger:[registrar messenger]];
  MoveTaskToBackPlugin* instance = [[MoveTaskToBackPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result(@"");
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end

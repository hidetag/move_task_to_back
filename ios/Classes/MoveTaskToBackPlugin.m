#import "MoveTaskToBackPlugin.h"
#if __has_include(<move_task_to_back/move_task_to_back-Swift.h>)
#import <move_task_to_back/move_task_to_back-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "move_task_to_back-Swift.h"
#endif

@implementation MoveTaskToBackPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMoveTaskToBackPlugin registerWithRegistrar:registrar];
}
@end

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class MoveTaskToBack {
  static const MethodChannel _channel =
      const MethodChannel('move_task_to_back');

  static Future<void> moveTaskToBack({bool nonRoot = true}) async {
    if (Platform.isAndroid) {
      return await _channel
          .invokeMethod('moveTaskToBack', {"nonRoot": nonRoot});
    } else {
      print("this platform not soupport moveTaskToBack.");
      return Future.value();
    }
  }
}

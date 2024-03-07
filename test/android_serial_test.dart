import 'package:flutter_test/flutter_test.dart';
import 'package:android_serial/android_serial.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockAndroidSerialPlatform
    // with MockPlatformInterfaceMixin
//     implements AndroidSerialPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final AndroidSerialPlatform initialPlatform = AndroidSerialPlatform.instance;

//   test('$MethodChannelAndroidSerial is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelAndroidSerial>());
//   });

//   test('getPlatformVersion', () async {
//     AndroidSerial androidSerialPlugin = AndroidSerial();
//     MockAndroidSerialPlatform fakePlatform = MockAndroidSerialPlatform();
//     AndroidSerialPlatform.instance = fakePlatform;

//     expect(await androidSerialPlugin.getPlatformVersion(), '42');
//   });
// }

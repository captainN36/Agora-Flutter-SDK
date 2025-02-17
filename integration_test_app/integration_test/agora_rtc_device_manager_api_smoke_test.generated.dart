import 'dart:io';

import 'package:flutter/services.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_app/main.dart' as app;

void rtcDeviceManagerSmokeTestCases() {
  testWidgets(
    'enumerateAudioPlaybackDevices',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.enumerateAudioPlaybackDevices();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioPlaybackDevice',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        const String deviceId = "hello";
        await deviceManager.setAudioPlaybackDevice(
          deviceId,
        );
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioPlaybackDevice',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.getAudioPlaybackDevice();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioPlaybackDeviceInfo',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.getAudioPlaybackDeviceInfo();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioPlaybackDeviceVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        const int volume = 10;
        await deviceManager.setAudioPlaybackDeviceVolume(
          volume,
        );
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioPlaybackDeviceVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.getAudioPlaybackDeviceVolume();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioPlaybackDeviceMute',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        const bool mute = true;
        await deviceManager.setAudioPlaybackDeviceMute(
          mute,
        );
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioPlaybackDeviceMute',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.getAudioPlaybackDeviceMute();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startAudioPlaybackDeviceTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        const String testAudioFilePath = "hello";
        await deviceManager.startAudioPlaybackDeviceTest(
          testAudioFilePath,
        );
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopAudioPlaybackDeviceTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.stopAudioPlaybackDeviceTest();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enumerateAudioRecordingDevices',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.enumerateAudioRecordingDevices();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioRecordingDevice',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        const String deviceId = "hello";
        await deviceManager.setAudioRecordingDevice(
          deviceId,
        );
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioRecordingDevice',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.getAudioRecordingDevice();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioRecordingDeviceInfo',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.getAudioRecordingDeviceInfo();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioRecordingDeviceVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        const int volume = 10;
        await deviceManager.setAudioRecordingDeviceVolume(
          volume,
        );
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioRecordingDeviceVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.getAudioRecordingDeviceVolume();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioRecordingDeviceMute',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        const bool mute = true;
        await deviceManager.setAudioRecordingDeviceMute(
          mute,
        );
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioRecordingDeviceMute',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.getAudioRecordingDeviceMute();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startAudioRecordingDeviceTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        const int indicationInterval = 10;
        await deviceManager.startAudioRecordingDeviceTest(
          indicationInterval,
        );
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopAudioRecordingDeviceTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.stopAudioRecordingDeviceTest();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startAudioDeviceLoopbackTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        const int indicationInterval = 10;
        await deviceManager.startAudioDeviceLoopbackTest(
          indicationInterval,
        );
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopAudioDeviceLoopbackTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.stopAudioDeviceLoopbackTest();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enumerateVideoDevices',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        await deviceManager.enumerateVideoDevices();
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setVideoDevice',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.create(engineAppId);
      final deviceManager = rtcEngine.deviceManager;

      try {
        const String deviceId = "hello";
        await deviceManager.setVideoDevice(
          deviceId,
        );
      } catch (e) {
        if (e is! PlatformException) {
          rethrow;
        }
        expect(e.code != '-7', isTrue);
      }

      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );
}

import 'dart:io';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_app/main.dart' as app;

void rtcEngineSubProcessSmokeTestCases() {
  testWidgets(
    'setChannelProfile',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const ChannelProfile profile = ChannelProfile.Communication;
      await screenShareHelper.setChannelProfile(
        profile,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setClientRole',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const ClientRole role = ClientRole.Broadcaster;
      const AudienceLatencyLevelType optionsAudienceLatencyLevel =
          AudienceLatencyLevelType.LowLatency;
      final ClientRoleOptions options = ClientRoleOptions(
        audienceLatencyLevel: optionsAudienceLatencyLevel,
      );
      await screenShareHelper.setClientRole(
        role,
        options,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'joinChannel',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String token = "hello";
      const String channelName = "hello";
      const String optionalInfo = "hello";
      const int optionalUid = 10;
      const bool optionsAutoSubscribeAudio = true;
      const bool optionsAutoSubscribeVideo = true;
      const bool optionsPublishLocalAudio = true;
      const bool optionsPublishLocalVideo = true;
      final ChannelMediaOptions options = ChannelMediaOptions(
        autoSubscribeAudio: optionsAutoSubscribeAudio,
        autoSubscribeVideo: optionsAutoSubscribeVideo,
        publishLocalAudio: optionsPublishLocalAudio,
        publishLocalVideo: optionsPublishLocalVideo,
      );
      await screenShareHelper.joinChannel(
        token,
        channelName,
        optionalInfo,
        optionalUid,
        options,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'switchChannel',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String token = "hello";
      const String channelName = "hello";
      const bool optionsAutoSubscribeAudio = true;
      const bool optionsAutoSubscribeVideo = true;
      const bool optionsPublishLocalAudio = true;
      const bool optionsPublishLocalVideo = true;
      final ChannelMediaOptions options = ChannelMediaOptions(
        autoSubscribeAudio: optionsAutoSubscribeAudio,
        autoSubscribeVideo: optionsAutoSubscribeVideo,
        publishLocalAudio: optionsPublishLocalAudio,
        publishLocalVideo: optionsPublishLocalVideo,
      );
      await screenShareHelper.switchChannel(
        token,
        channelName,
        options,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'leaveChannel',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.leaveChannel();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'renewToken',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String token = "hello";
      await screenShareHelper.renewToken(
        token,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableWebSdkInteroperability',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enabled = true;
      await screenShareHelper.enableWebSdkInteroperability(
        enabled,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getCallId',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.getCallId();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'rate',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String callId = "hello";
      const int rating = 10;
      const String description = "hello";
      await screenShareHelper.rate(
        callId,
        rating,
        description: description,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'complain',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String callId = "hello";
      const String description = "hello";
      await screenShareHelper.complain(
        callId,
        description,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setLogFile',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String filePath = "hello";
      await screenShareHelper.setLogFile(
        filePath,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setLogFilter',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const LogFilter filter = LogFilter.Off;
      await screenShareHelper.setLogFilter(
        filter,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setLogFileSize',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int fileSizeInKBytes = 10;
      await screenShareHelper.setLogFileSize(
        fileSizeInKBytes,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setParameters',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String parameters = "hello";
      await screenShareHelper.setParameters(
        parameters,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'joinChannelWithUserAccount',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String token = "hello";
      const String channelName = "hello";
      const String userAccount = "hello";
      const bool optionsAutoSubscribeAudio = true;
      const bool optionsAutoSubscribeVideo = true;
      const bool optionsPublishLocalAudio = true;
      const bool optionsPublishLocalVideo = true;
      final ChannelMediaOptions options = ChannelMediaOptions(
        autoSubscribeAudio: optionsAutoSubscribeAudio,
        autoSubscribeVideo: optionsAutoSubscribeVideo,
        publishLocalAudio: optionsPublishLocalAudio,
        publishLocalVideo: optionsPublishLocalVideo,
      );
      await screenShareHelper.joinChannelWithUserAccount(
        token,
        channelName,
        userAccount,
        options,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'registerLocalUserAccount',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String appId = "hello";
      const String userAccount = "hello";
      await screenShareHelper.registerLocalUserAccount(
        appId,
        userAccount,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'adjustPlaybackSignalVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int volume = 10;
      await screenShareHelper.adjustPlaybackSignalVolume(
        volume,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'adjustRecordingSignalVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int volume = 10;
      await screenShareHelper.adjustRecordingSignalVolume(
        volume,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'adjustUserPlaybackSignalVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int uid = 10;
      const int volume = 10;
      await screenShareHelper.adjustUserPlaybackSignalVolume(
        uid,
        volume,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableLoopbackRecording',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enabled = true;
      const String deviceName = "hello";
      await screenShareHelper.enableLoopbackRecording(
        enabled,
        deviceName: deviceName,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'disableAudio',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.disableAudio();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableAudio',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.enableAudio();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableAudioVolumeIndication',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int interval = 10;
      const int smooth = 10;
      const bool report_vad = true;
      await screenShareHelper.enableAudioVolumeIndication(
        interval,
        smooth,
        report_vad,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableLocalAudio',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enabled = true;
      await screenShareHelper.enableLocalAudio(
        enabled,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'muteAllRemoteAudioStreams',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool muted = true;
      await screenShareHelper.muteAllRemoteAudioStreams(
        muted,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'muteLocalAudioStream',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool muted = true;
      await screenShareHelper.muteLocalAudioStream(
        muted,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'muteRemoteAudioStream',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int uid = 10;
      const bool muted = true;
      await screenShareHelper.muteRemoteAudioStream(
        uid,
        muted,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioProfile',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const AudioProfile profile = AudioProfile.Default;
      const AudioScenario scenario = AudioScenario.Default;
      await screenShareHelper.setAudioProfile(
        profile,
        scenario,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setDefaultMuteAllRemoteAudioStreams',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool muted = true;
      await screenShareHelper.setDefaultMuteAllRemoteAudioStreams(
        muted,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'disableVideo',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.disableVideo();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableLocalVideo',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enabled = true;
      await screenShareHelper.enableLocalVideo(
        enabled,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableVideo',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.enableVideo();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'muteAllRemoteVideoStreams',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool muted = true;
      await screenShareHelper.muteAllRemoteVideoStreams(
        muted,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'muteLocalVideoStream',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool muted = true;
      await screenShareHelper.muteLocalVideoStream(
        muted,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'muteRemoteVideoStream',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int uid = 10;
      const bool muted = true;
      await screenShareHelper.muteRemoteVideoStream(
        uid,
        muted,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setBeautyEffectOptions',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enabled = true;
      const LighteningContrastLevel optionsLighteningContrastLevel =
          LighteningContrastLevel.Low;
      const double optionsLighteningLevel = 10.0;
      const double optionsSmoothnessLevel = 10.0;
      const double optionsRednessLevel = 10.0;
      final BeautyOptions options = BeautyOptions(
        lighteningContrastLevel: optionsLighteningContrastLevel,
        lighteningLevel: optionsLighteningLevel,
        smoothnessLevel: optionsSmoothnessLevel,
        rednessLevel: optionsRednessLevel,
      );
      await screenShareHelper.setBeautyEffectOptions(
        enabled,
        options,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setDefaultMuteAllRemoteVideoStreams',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool muted = true;
      await screenShareHelper.setDefaultMuteAllRemoteVideoStreams(
        muted,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startPreview',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.startPreview();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopPreview',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.stopPreview();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'adjustAudioMixingPlayoutVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int volume = 10;
      await screenShareHelper.adjustAudioMixingPlayoutVolume(
        volume,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'adjustAudioMixingPublishVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int volume = 10;
      await screenShareHelper.adjustAudioMixingPublishVolume(
        volume,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'adjustAudioMixingVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int volume = 10;
      await screenShareHelper.adjustAudioMixingVolume(
        volume,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioMixingCurrentPosition',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.getAudioMixingCurrentPosition();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioMixingDuration',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String filePath = "hello";
      await screenShareHelper.getAudioMixingDuration(
        filePath,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioFileInfo',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String filePath = "hello";
      await screenShareHelper.getAudioFileInfo(
        filePath,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioMixingPlayoutVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.getAudioMixingPlayoutVolume();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioMixingPublishVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.getAudioMixingPublishVolume();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'pauseAudioMixing',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.pauseAudioMixing();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'resumeAudioMixing',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.resumeAudioMixing();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioMixingPosition',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int pos = 10;
      await screenShareHelper.setAudioMixingPosition(
        pos,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startAudioMixing',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String filePath = "hello";
      const bool loopback = true;
      const bool replace = true;
      const int cycle = 10;
      const int startPos = 10;
      await screenShareHelper.startAudioMixing(
        filePath,
        loopback,
        replace,
        cycle,
        startPos,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopAudioMixing',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.stopAudioMixing();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'addInjectStreamUrl',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String url = "hello";
      const VideoFrameRate configVideoFramerate = VideoFrameRate.Min;
      const AudioSampleRateType configAudioSampleRate =
          AudioSampleRateType.Type32000;
      const AudioChannel configAudioChannels = AudioChannel.Channel0;
      const int configWidth = 10;
      const int configHeight = 10;
      const int configVideoGop = 10;
      const int configVideoBitrate = 10;
      const int configAudioBitrate = 10;
      final LiveInjectStreamConfig config = LiveInjectStreamConfig(
        width: configWidth,
        height: configHeight,
        videoGop: configVideoGop,
        videoFramerate: configVideoFramerate,
        videoBitrate: configVideoBitrate,
        audioSampleRate: configAudioSampleRate,
        audioBitrate: configAudioBitrate,
        audioChannels: configAudioChannels,
      );
      await screenShareHelper.addInjectStreamUrl(
        url,
        config,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'addPublishStreamUrl',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String url = "hello";
      const bool transcodingEnabled = true;
      await screenShareHelper.addPublishStreamUrl(
        url,
        transcodingEnabled,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'addVideoWatermark',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String watermarkUrl = "hello";
      const int positionInLandscapeModeX = 10;
      const int positionInLandscapeModeY = 10;
      const int positionInLandscapeModeWidth = 10;
      const int positionInLandscapeModeHeight = 10;
      final Rectangle optionsPositionInLandscapeMode = Rectangle(
        x: positionInLandscapeModeX,
        y: positionInLandscapeModeY,
        width: positionInLandscapeModeWidth,
        height: positionInLandscapeModeHeight,
      );
      const int positionInPortraitModeX = 10;
      const int positionInPortraitModeY = 10;
      const int positionInPortraitModeWidth = 10;
      const int positionInPortraitModeHeight = 10;
      final Rectangle optionsPositionInPortraitMode = Rectangle(
        x: positionInPortraitModeX,
        y: positionInPortraitModeY,
        width: positionInPortraitModeWidth,
        height: positionInPortraitModeHeight,
      );
      const bool optionsVisibleInPreview = true;
      final WatermarkOptions options = WatermarkOptions(
        visibleInPreview: optionsVisibleInPreview,
        positionInLandscapeMode: optionsPositionInLandscapeMode,
        positionInPortraitMode: optionsPositionInPortraitMode,
      );
      await screenShareHelper.addVideoWatermark(
        watermarkUrl,
        options,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'clearVideoWatermarks',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.clearVideoWatermarks();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'disableLastmileTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.disableLastmileTest();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableDualStreamMode',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enabled = true;
      await screenShareHelper.enableDualStreamMode(
        enabled,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableInEarMonitoring',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enabled = true;
      await screenShareHelper.enableInEarMonitoring(
        enabled,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableLastmileTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.enableLastmileTest();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableSoundPositionIndication',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enabled = true;
      await screenShareHelper.enableSoundPositionIndication(
        enabled,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getEffectsVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.getEffectsVolume();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'isCameraTorchSupported',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.isCameraTorchSupported();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'isSpeakerphoneEnabled',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.isSpeakerphoneEnabled();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'pauseAllEffects',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.pauseAllEffects();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'pauseEffect',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int soundId = 10;
      await screenShareHelper.pauseEffect(
        soundId,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'playEffect',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int soundId = 10;
      const String filePath = "hello";
      const int loopCount = 10;
      const double pitch = 10.0;
      const double pan = 10.0;
      const int gain = 10;
      const bool publish = true;
      const int startPos = 10;
      await screenShareHelper.playEffect(
        soundId,
        filePath,
        loopCount,
        pitch,
        pan,
        gain,
        publish,
        startPos,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setEffectPosition',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int soundId = 10;
      const int pos = 10;
      await screenShareHelper.setEffectPosition(
        soundId,
        pos,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getEffectDuration',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String filePath = "hello";
      await screenShareHelper.getEffectDuration(
        filePath,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getEffectCurrentPosition',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int soundId = 10;
      await screenShareHelper.getEffectCurrentPosition(
        soundId,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'preloadEffect',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int soundId = 10;
      const String filePath = "hello";
      await screenShareHelper.preloadEffect(
        soundId,
        filePath,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'registerMediaMetadataObserver',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.registerMediaMetadataObserver();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'removeInjectStreamUrl',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String url = "hello";
      await screenShareHelper.removeInjectStreamUrl(
        url,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'removePublishStreamUrl',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String url = "hello";
      await screenShareHelper.removePublishStreamUrl(
        url,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'resumeAllEffects',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.resumeAllEffects();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'resumeEffect',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int soundId = 10;
      await screenShareHelper.resumeEffect(
        soundId,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setCameraCapturerConfiguration',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const CameraCaptureOutputPreference configPreference =
          CameraCaptureOutputPreference.Auto;
      const CameraDirectionn configCameraDirection = CameraDirectionn.Rear;
      const int configCaptureWidth = 10;
      const int configCaptureHeight = 10;
      final CameraCapturerConfiguration config = CameraCapturerConfiguration(
        preference: configPreference,
        captureWidth: configCaptureWidth,
        captureHeight: configCaptureHeight,
        cameraDirection: configCameraDirection,
      );
      await screenShareHelper.setCameraCapturerConfiguration(
        config,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setCameraTorchOn',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool isOn = true;
      await screenShareHelper.setCameraTorchOn(
        isOn,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setDefaultAudioRoutetoSpeakerphone',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool defaultToSpeaker = true;
      await screenShareHelper.setDefaultAudioRoutetoSpeakerphone(
        defaultToSpeaker,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setEffectsVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int volume = 10;
      await screenShareHelper.setEffectsVolume(
        volume,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setEnableSpeakerphone',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool speakerOn = true;
      await screenShareHelper.setEnableSpeakerphone(
        speakerOn,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setEncryptionMode',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const EncryptionMode encryptionMode = EncryptionMode.None;
      await screenShareHelper.setEncryptionMode(
        encryptionMode,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setEncryptionSecret',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String secret = "hello";
      await screenShareHelper.setEncryptionSecret(
        secret,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setInEarMonitoringVolume',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int volume = 10;
      await screenShareHelper.setInEarMonitoringVolume(
        volume,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setLocalPublishFallbackOption',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const StreamFallbackOptions option = StreamFallbackOptions.Disabled;
      await screenShareHelper.setLocalPublishFallbackOption(
        option,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setLocalVoiceChanger',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const AudioVoiceChanger voiceChanger = AudioVoiceChanger.Off;
      await screenShareHelper.setLocalVoiceChanger(
        voiceChanger,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setLocalVoiceEqualization',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const AudioEqualizationBandFrequency bandFrequency =
          AudioEqualizationBandFrequency.Band31;
      const int bandGain = 10;
      await screenShareHelper.setLocalVoiceEqualization(
        bandFrequency,
        bandGain,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setLocalVoicePitch',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const double pitch = 10.0;
      await screenShareHelper.setLocalVoicePitch(
        pitch,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setLocalVoiceReverb',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const AudioReverbType reverbKey = AudioReverbType.DryLevel;
      const int value = 10;
      await screenShareHelper.setLocalVoiceReverb(
        reverbKey,
        value,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setLocalVoiceReverbPreset',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const AudioReverbPreset reverbPreset = AudioReverbPreset.Off;
      await screenShareHelper.setLocalVoiceReverbPreset(
        reverbPreset,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setMaxMetadataSize',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int size = 10;
      await screenShareHelper.setMaxMetadataSize(
        size,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setRemoteDefaultVideoStreamType',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const VideoStreamType streamType = VideoStreamType.High;
      await screenShareHelper.setRemoteDefaultVideoStreamType(
        streamType,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setRemoteSubscribeFallbackOption',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const StreamFallbackOptions option = StreamFallbackOptions.Disabled;
      await screenShareHelper.setRemoteSubscribeFallbackOption(
        option,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setRemoteUserPriority',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int uid = 10;
      const UserPriority userPriority = UserPriority.High;
      await screenShareHelper.setRemoteUserPriority(
        uid,
        userPriority,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setRemoteVideoStreamType',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int userId = 10;
      const VideoStreamType streamType = VideoStreamType.High;
      await screenShareHelper.setRemoteVideoStreamType(
        userId,
        streamType,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setRemoteVoicePosition',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int uid = 10;
      const double pan = 10.0;
      const double gain = 10.0;
      await screenShareHelper.setRemoteVoicePosition(
        uid,
        pan,
        gain,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setVolumeOfEffect',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int soundId = 10;
      const int volume = 10;
      await screenShareHelper.setVolumeOfEffect(
        soundId,
        volume,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startAudioRecording',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String filePath = "hello";
      const AudioSampleRateType sampleRate = AudioSampleRateType.Type32000;
      const AudioRecordingQuality quality = AudioRecordingQuality.Low;
      await screenShareHelper.startAudioRecording(
        filePath,
        sampleRate,
        quality,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startAudioRecordingWithConfig',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const AudioRecordingQuality configRecordingQuality =
          AudioRecordingQuality.Low;
      const AudioRecordingPosition configRecordingPosition =
          AudioRecordingPosition.PositionMixedRecordingAndPlayback;
      const AudioSampleRateType configRecordingSampleRate =
          AudioSampleRateType.Type32000;
      const String configFilePath = "hello";
      final AudioRecordingConfiguration config = AudioRecordingConfiguration(
        configFilePath,
        recordingQuality: configRecordingQuality,
        recordingPosition: configRecordingPosition,
        recordingSampleRate: configRecordingSampleRate,
      );
      await screenShareHelper.startAudioRecordingWithConfig(
        config,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startChannelMediaRelay',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String srcInfoChannelName = "hello";
      const int srcInfoUid = 10;
      const String srcInfoToken = "hello";
      final ChannelMediaInfo channelMediaRelayConfigurationSrcInfo =
          ChannelMediaInfo(
        srcInfoChannelName,
        srcInfoUid,
        token: srcInfoToken,
      );
      const List<ChannelMediaInfo> channelMediaRelayConfigurationDestInfos = [];
      final ChannelMediaRelayConfiguration channelMediaRelayConfiguration =
          ChannelMediaRelayConfiguration(
        channelMediaRelayConfigurationSrcInfo,
        channelMediaRelayConfigurationDestInfos,
      );
      await screenShareHelper.startChannelMediaRelay(
        channelMediaRelayConfiguration,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startLastmileProbeTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool configProbeUplink = true;
      const bool configProbeDownlink = true;
      const int configExpectedUplinkBitrate = 10;
      const int configExpectedDownlinkBitrate = 10;
      final LastmileProbeConfig config = LastmileProbeConfig(
        configProbeUplink,
        configProbeDownlink,
        configExpectedUplinkBitrate,
        configExpectedDownlinkBitrate,
      );
      await screenShareHelper.startLastmileProbeTest(
        config,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopAllEffects',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.stopAllEffects();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopAudioRecording',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.stopAudioRecording();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopChannelMediaRelay',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.stopChannelMediaRelay();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopEchoTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.stopEchoTest();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopEffect',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int soundId = 10;
      await screenShareHelper.stopEffect(
        soundId,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopLastmileProbeTest',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.stopLastmileProbeTest();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'switchCamera',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.switchCamera();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'unloadEffect',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int soundId = 10;
      await screenShareHelper.unloadEffect(
        soundId,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'unregisterMediaMetadataObserver',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.unregisterMediaMetadataObserver();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'updateChannelMediaRelay',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String srcInfoChannelName = "hello";
      const int srcInfoUid = 10;
      const String srcInfoToken = "hello";
      final ChannelMediaInfo channelMediaRelayConfigurationSrcInfo =
          ChannelMediaInfo(
        srcInfoChannelName,
        srcInfoUid,
        token: srcInfoToken,
      );
      const List<ChannelMediaInfo> channelMediaRelayConfigurationDestInfos = [];
      final ChannelMediaRelayConfiguration channelMediaRelayConfiguration =
          ChannelMediaRelayConfiguration(
        channelMediaRelayConfigurationSrcInfo,
        channelMediaRelayConfigurationDestInfos,
      );
      await screenShareHelper.updateChannelMediaRelay(
        channelMediaRelayConfiguration,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableFaceDetection',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enable = true;
      await screenShareHelper.enableFaceDetection(
        enable,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioMixingPitch',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int pitch = 10;
      await screenShareHelper.setAudioMixingPitch(
        pitch,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioMixingPlaybackSpeed',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int speed = 10;
      await screenShareHelper.setAudioMixingPlaybackSpeed(
        speed,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'getAudioTrackCount',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.getAudioTrackCount();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'selectAudioTrack',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int index = 10;
      await screenShareHelper.selectAudioTrack(
        index,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioMixingDualMonoMode',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const AudioMixingDualMonoMode mode = AudioMixingDualMonoMode.Auto;
      await screenShareHelper.setAudioMixingDualMonoMode(
        mode,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableEncryption',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enabled = true;
      const EncryptionMode configEncryptionMode = EncryptionMode.None;
      const String configEncryptionKey = "hello";
      const List<int> configEncryptionKdfSalt = [];
      final EncryptionConfig config = EncryptionConfig(
        encryptionMode: configEncryptionMode,
        encryptionKey: configEncryptionKey,
        encryptionKdfSalt: configEncryptionKdfSalt,
      );
      await screenShareHelper.enableEncryption(
        enabled,
        config,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'sendCustomReportMessage',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const String id = "hello";
      const String category = "hello";
      const String event = "hello";
      const String label = "hello";
      const int value = 10;
      await screenShareHelper.sendCustomReportMessage(
        id,
        category,
        event,
        label,
        value,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioSessionOperationRestriction',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const AudioSessionOperationRestriction restriction =
          AudioSessionOperationRestriction.None;
      await screenShareHelper.setAudioSessionOperationRestriction(
        restriction,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioEffectParameters',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const AudioEffectPreset preset = AudioEffectPreset.AudioEffectOff;
      const int param1 = 10;
      const int param2 = 10;
      await screenShareHelper.setAudioEffectParameters(
        preset,
        param1,
        param2,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setAudioEffectPreset',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const AudioEffectPreset preset = AudioEffectPreset.AudioEffectOff;
      await screenShareHelper.setAudioEffectPreset(
        preset,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setVoiceBeautifierPreset',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const VoiceBeautifierPreset preset =
          VoiceBeautifierPreset.VoiceBeautifierOff;
      await screenShareHelper.setVoiceBeautifierPreset(
        preset,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableDeepLearningDenoise',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const bool enable = true;
      await screenShareHelper.enableDeepLearningDenoise(
        enable,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'enableRemoteSuperResolution',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int userId = 10;
      const bool enable = true;
      await screenShareHelper.enableRemoteSuperResolution(
        userId,
        enable,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setCloudProxy',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const CloudProxyType proxyType = CloudProxyType.None;
      await screenShareHelper.setCloudProxy(
        proxyType,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'uploadLogFile',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.uploadLogFile();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setVoiceBeautifierParameters',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const VoiceBeautifierPreset preset =
          VoiceBeautifierPreset.VoiceBeautifierOff;
      const int param1 = 10;
      const int param2 = 10;
      await screenShareHelper.setVoiceBeautifierParameters(
        preset,
        param1,
        param2,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setVoiceConversionPreset',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const VoiceConversionPreset preset = VoiceConversionPreset.Off;
      await screenShareHelper.setVoiceConversionPreset(
        preset,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'pauseAllChannelMediaRelay',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.pauseAllChannelMediaRelay();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'resumeAllChannelMediaRelay',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.resumeAllChannelMediaRelay();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setLocalAccessPoint',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const List<String> ips = [];
      const String domain = "hello";
      await screenShareHelper.setLocalAccessPoint(
        ips,
        domain,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'setScreenCaptureContentHint',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const VideoContentHint contentHint = VideoContentHint.None;
      await screenShareHelper.setScreenCaptureContentHint(
        contentHint,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startScreenCaptureByDisplayId',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int displayId = 10;
      const int regionRectX = 10;
      const int regionRectY = 10;
      const int regionRectWidth = 10;
      const int regionRectHeight = 10;
      final Rectangle regionRect = Rectangle(
        x: regionRectX,
        y: regionRectY,
        width: regionRectWidth,
        height: regionRectHeight,
      );
      const int dimensionsWidth = 10;
      const int dimensionsHeight = 10;
      final VideoDimensions captureParamsDimensions = VideoDimensions(
        width: dimensionsWidth,
        height: dimensionsHeight,
      );
      const int captureParamsFrameRate = 10;
      const int captureParamsBitrate = 10;
      const bool captureParamsCaptureMouseCursor = true;
      const bool captureParamsWindowFocus = true;
      const List<int> captureParamsExcludeWindowList = [];
      final ScreenCaptureParameters captureParams = ScreenCaptureParameters(
        dimensions: captureParamsDimensions,
        frameRate: captureParamsFrameRate,
        bitrate: captureParamsBitrate,
        captureMouseCursor: captureParamsCaptureMouseCursor,
        windowFocus: captureParamsWindowFocus,
        excludeWindowList: captureParamsExcludeWindowList,
      );
      await screenShareHelper.startScreenCaptureByDisplayId(
        displayId,
        regionRect,
        captureParams,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startScreenCaptureByScreenRect',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int screenRectX = 10;
      const int screenRectY = 10;
      const int screenRectWidth = 10;
      const int screenRectHeight = 10;
      final Rectangle screenRect = Rectangle(
        x: screenRectX,
        y: screenRectY,
        width: screenRectWidth,
        height: screenRectHeight,
      );
      const int regionRectX = 10;
      const int regionRectY = 10;
      const int regionRectWidth = 10;
      const int regionRectHeight = 10;
      final Rectangle regionRect = Rectangle(
        x: regionRectX,
        y: regionRectY,
        width: regionRectWidth,
        height: regionRectHeight,
      );
      const int dimensionsWidth = 10;
      const int dimensionsHeight = 10;
      final VideoDimensions captureParamsDimensions = VideoDimensions(
        width: dimensionsWidth,
        height: dimensionsHeight,
      );
      const int captureParamsFrameRate = 10;
      const int captureParamsBitrate = 10;
      const bool captureParamsCaptureMouseCursor = true;
      const bool captureParamsWindowFocus = true;
      const List<int> captureParamsExcludeWindowList = [];
      final ScreenCaptureParameters captureParams = ScreenCaptureParameters(
        dimensions: captureParamsDimensions,
        frameRate: captureParamsFrameRate,
        bitrate: captureParamsBitrate,
        captureMouseCursor: captureParamsCaptureMouseCursor,
        windowFocus: captureParamsWindowFocus,
        excludeWindowList: captureParamsExcludeWindowList,
      );
      await screenShareHelper.startScreenCaptureByScreenRect(
        screenRect,
        regionRect,
        captureParams,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startScreenCaptureByWindowId',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int windowId = 10;
      const int regionRectX = 10;
      const int regionRectY = 10;
      const int regionRectWidth = 10;
      const int regionRectHeight = 10;
      final Rectangle regionRect = Rectangle(
        x: regionRectX,
        y: regionRectY,
        width: regionRectWidth,
        height: regionRectHeight,
      );
      const int dimensionsWidth = 10;
      const int dimensionsHeight = 10;
      final VideoDimensions captureParamsDimensions = VideoDimensions(
        width: dimensionsWidth,
        height: dimensionsHeight,
      );
      const int captureParamsFrameRate = 10;
      const int captureParamsBitrate = 10;
      const bool captureParamsCaptureMouseCursor = true;
      const bool captureParamsWindowFocus = true;
      const List<int> captureParamsExcludeWindowList = [];
      final ScreenCaptureParameters captureParams = ScreenCaptureParameters(
        dimensions: captureParamsDimensions,
        frameRate: captureParamsFrameRate,
        bitrate: captureParamsBitrate,
        captureMouseCursor: captureParamsCaptureMouseCursor,
        windowFocus: captureParamsWindowFocus,
        excludeWindowList: captureParamsExcludeWindowList,
      );
      await screenShareHelper.startScreenCaptureByWindowId(
        windowId,
        regionRect,
        captureParams,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'stopScreenCapture',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      await screenShareHelper.stopScreenCapture();

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'updateScreenCaptureParameters',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int dimensionsWidth = 10;
      const int dimensionsHeight = 10;
      final VideoDimensions captureParamsDimensions = VideoDimensions(
        width: dimensionsWidth,
        height: dimensionsHeight,
      );
      const int captureParamsFrameRate = 10;
      const int captureParamsBitrate = 10;
      const bool captureParamsCaptureMouseCursor = true;
      const bool captureParamsWindowFocus = true;
      const List<int> captureParamsExcludeWindowList = [];
      final ScreenCaptureParameters captureParams = ScreenCaptureParameters(
        dimensions: captureParamsDimensions,
        frameRate: captureParamsFrameRate,
        bitrate: captureParamsBitrate,
        captureMouseCursor: captureParamsCaptureMouseCursor,
        windowFocus: captureParamsWindowFocus,
        excludeWindowList: captureParamsExcludeWindowList,
      );
      await screenShareHelper.updateScreenCaptureParameters(
        captureParams,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'updateScreenCaptureRegion',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int regionRectX = 10;
      const int regionRectY = 10;
      const int regionRectWidth = 10;
      const int regionRectHeight = 10;
      final Rectangle regionRect = Rectangle(
        x: regionRectX,
        y: regionRectY,
        width: regionRectWidth,
        height: regionRectHeight,
      );
      await screenShareHelper.updateScreenCaptureRegion(
        regionRect,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );

  testWidgets(
    'startScreenCapture',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(
        engineAppId,
        areaCode: [AreaCode.NA, AreaCode.GLOB],
      ));

      final screenShareHelper =
          await rtcEngine.getScreenShareHelper(appGroup: 'io.agora');

      const int windowId = 10;
      const int captureFreq = 10;
      const int rectX = 10;
      const int rectY = 10;
      const int rectWidth = 10;
      const int rectHeight = 10;
      const int rectLeft = 10;
      const int rectTop = 10;
      const int rectRight = 10;
      const int rectBottom = 10;
      final Rect rect = Rect(
        x: rectX,
        y: rectY,
        width: rectWidth,
        height: rectHeight,
        left: rectLeft,
        top: rectTop,
        right: rectRight,
        bottom: rectBottom,
      );
      const int bitrate = 10;
      await screenShareHelper.startScreenCapture(
        windowId,
        captureFreq,
        rect,
        bitrate,
      );

      await screenShareHelper.destroy();
      await rtcEngine.destroy();
    },
    skip: !(Platform.isMacOS || Platform.isWindows || Platform.isLinux),
  );
}

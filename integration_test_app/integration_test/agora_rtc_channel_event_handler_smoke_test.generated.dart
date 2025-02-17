import 'package:agora_rtc_engine/rtc_channel.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_app/main.dart' as app;
import 'package:integration_test_app/src/fake_iris_rtc_engine.dart';

void rtcChannelEventHandlerSomkeTestCases() {
  testWidgets('onChannelWarning', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool warningCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      warning: (warn) {
        warningCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onChannelWarning');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(warningCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onChannelError', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool errorCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      error: (err) {
        errorCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onChannelError');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(errorCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onJoinChannelSuccess', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool joinChannelSuccessCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        joinChannelSuccessCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onJoinChannelSuccess');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(joinChannelSuccessCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onRejoinChannelSuccess', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool rejoinChannelSuccessCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      rejoinChannelSuccess: (channel, uid, elapsed) {
        rejoinChannelSuccessCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onRejoinChannelSuccess');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(rejoinChannelSuccessCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onLeaveChannel', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool leaveChannelCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      leaveChannel: (stats) {
        leaveChannelCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onLeaveChannel');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(leaveChannelCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onClientRoleChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool clientRoleChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      clientRoleChanged: (oldRole, newRole) {
        clientRoleChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onClientRoleChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(clientRoleChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onUserJoined', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool userJoinedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      userJoined: (uid, elapsed) {
        userJoinedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onUserJoined');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(userJoinedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onUserOffline', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool userOfflineCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      userOffline: (uid, reason) {
        userOfflineCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onUserOffline');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(userOfflineCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onConnectionStateChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool connectionStateChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      connectionStateChanged: (state, reason) {
        connectionStateChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onConnectionStateChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(connectionStateChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onConnectionLost', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool connectionLostCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      connectionLost: () {
        connectionLostCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onConnectionLost');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(connectionLostCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onTokenPrivilegeWillExpire', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool tokenPrivilegeWillExpireCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      tokenPrivilegeWillExpire: (token) {
        tokenPrivilegeWillExpireCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onTokenPrivilegeWillExpire');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(tokenPrivilegeWillExpireCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onRequestToken', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool requestTokenCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      requestToken: () {
        requestTokenCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onRequestToken');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(requestTokenCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onActiveSpeaker', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool activeSpeakerCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      activeSpeaker: (uid) {
        activeSpeakerCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onActiveSpeaker');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(activeSpeakerCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onVideoSizeChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool videoSizeChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      videoSizeChanged: (uid, width, height, rotation) {
        videoSizeChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onVideoSizeChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(videoSizeChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onRemoteVideoStateChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool remoteVideoStateChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      remoteVideoStateChanged: (uid, state, reason, elapsed) {
        remoteVideoStateChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onRemoteVideoStateChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(remoteVideoStateChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onRemoteAudioStateChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool remoteAudioStateChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      remoteAudioStateChanged: (uid, state, reason, elapsed) {
        remoteAudioStateChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onRemoteAudioStateChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(remoteAudioStateChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onLocalPublishFallbackToAudioOnly', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool localPublishFallbackToAudioOnlyCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      localPublishFallbackToAudioOnly: (isFallbackOrRecover) {
        localPublishFallbackToAudioOnlyCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onLocalPublishFallbackToAudioOnly');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(localPublishFallbackToAudioOnlyCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onRemoteSubscribeFallbackToAudioOnly',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool remoteSubscribeFallbackToAudioOnlyCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      remoteSubscribeFallbackToAudioOnly: (uid, isFallbackOrRecover) {
        remoteSubscribeFallbackToAudioOnlyCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onRemoteSubscribeFallbackToAudioOnly');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(remoteSubscribeFallbackToAudioOnlyCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onRtcStats', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool rtcStatsCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      rtcStats: (stats) {
        rtcStatsCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onRtcStats');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(rtcStatsCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onNetworkQuality', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool networkQualityCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      networkQuality: (uid, txQuality, rxQuality) {
        networkQualityCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onNetworkQuality');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(networkQualityCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onRemoteVideoStats', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool remoteVideoStatsCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      remoteVideoStats: (stats) {
        remoteVideoStatsCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onRemoteVideoStats');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(remoteVideoStatsCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onRemoteAudioStats', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool remoteAudioStatsCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      remoteAudioStats: (stats) {
        remoteAudioStatsCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onRemoteAudioStats');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(remoteAudioStatsCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onRtmpStreamingStateChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool rtmpStreamingStateChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      rtmpStreamingStateChanged: (url, state, errCode) {
        rtmpStreamingStateChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onRtmpStreamingStateChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(rtmpStreamingStateChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onTranscodingUpdated', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool transcodingUpdatedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      transcodingUpdated: () {
        transcodingUpdatedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onTranscodingUpdated');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(transcodingUpdatedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onStreamInjectedStatus', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool streamInjectedStatusCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      streamInjectedStatus: (url, uid, status) {
        streamInjectedStatusCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onStreamInjectedStatus');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(streamInjectedStatusCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onStreamMessage', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool streamMessageCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      streamMessage: (uid, streamId, data) {
        streamMessageCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onStreamMessage');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(streamMessageCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onStreamMessageError', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool streamMessageErrorCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      streamMessageError: (uid, streamId, error, missed, cached) {
        streamMessageErrorCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onStreamMessageError');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(streamMessageErrorCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onChannelMediaRelayStateChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool channelMediaRelayStateChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      channelMediaRelayStateChanged: (state, code) {
        channelMediaRelayStateChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onChannelMediaRelayStateChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(channelMediaRelayStateChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onChannelMediaRelayEvent', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool channelMediaRelayEventCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      channelMediaRelayEvent: (code) {
        channelMediaRelayEventCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onChannelMediaRelayEvent');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(channelMediaRelayEventCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onAudioPublishStateChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool audioPublishStateChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      audioPublishStateChanged:
          (channel, oldState, newState, elapseSinceLastState) {
        audioPublishStateChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onAudioPublishStateChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(audioPublishStateChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onVideoPublishStateChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool videoPublishStateChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      videoPublishStateChanged:
          (channel, oldState, newState, elapseSinceLastState) {
        videoPublishStateChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onVideoPublishStateChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(videoPublishStateChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onAudioSubscribeStateChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool audioSubscribeStateChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      audioSubscribeStateChanged:
          (channel, uid, oldState, newState, elapseSinceLastState) {
        audioSubscribeStateChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onAudioSubscribeStateChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(audioSubscribeStateChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onVideoSubscribeStateChanged', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool videoSubscribeStateChangedCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      videoSubscribeStateChanged:
          (channel, uid, oldState, newState, elapseSinceLastState) {
        videoSubscribeStateChangedCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onVideoSubscribeStateChanged');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(videoSubscribeStateChangedCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onRtmpStreamingEvent', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool rtmpStreamingEventCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      rtmpStreamingEvent: (url, eventCode) {
        rtmpStreamingEventCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onRtmpStreamingEvent');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(rtmpStreamingEventCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
  testWidgets('onUserSuperResolutionEnabled', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    FakeIrisRtcEngine fakeIrisEngine = FakeIrisRtcEngine();
    await fakeIrisEngine.initialize();
    final rtcEngine = await RtcEngine.create('123');
    final rtcChannel = await RtcChannel.create('testapi');
    bool userSuperResolutionEnabledCalled = false;
    rtcChannel.setEventHandler(RtcChannelEventHandler(
      userSuperResolutionEnabled: (uid, enabled, reason) {
        userSuperResolutionEnabledCalled = true;
      },
    ));

    fakeIrisEngine.fireRtcChannelEvent('onUserSuperResolutionEnabled');
// Wait for the `EventChannel` event be sent from Android/iOS side
    await tester.pump(const Duration(milliseconds: 500));
    expect(userSuperResolutionEnabledCalled, isTrue);

    await rtcChannel.destroy();
    await rtcEngine.destroy();
    fakeIrisEngine.dispose();
  });
}

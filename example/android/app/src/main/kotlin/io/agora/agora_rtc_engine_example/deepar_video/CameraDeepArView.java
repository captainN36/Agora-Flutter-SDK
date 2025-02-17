package io.agora.agora_rtc_engine_example.deepar_video;

import static androidx.test.internal.runner.junit4.statement.UiThreadStatement.runOnUiThread;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.media.Image;
import android.media.MediaScannerConnection;
import android.opengl.GLSurfaceView;
import android.os.Environment;
import android.text.format.DateFormat;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.Size;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.FrameLayout;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.ImageProxy;
import androidx.camera.lifecycle.ProcessCameraProvider;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;

import com.google.common.util.concurrent.ListenableFuture;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import ai.deepar.ar.ARErrorType;
import ai.deepar.ar.AREventListener;
import ai.deepar.ar.CameraResolutionPreset;
import ai.deepar.ar.DeepAR;
import ai.deepar.ar.DeepARImageFormat;
import io.agora.agora_rtc_engine_example.R;
import io.agora.rtc.IRtcEngineEventHandler;
import io.agora.rtc.RtcEngine;
import io.agora.rtc.base.RtcEnginePlugin;
import io.agora.rtc.video.VideoEncoderConfiguration;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.platform.PlatformView;

public class CameraDeepArView implements PlatformView, RtcEnginePlugin,
  SurfaceHolder.Callback, AREventListener,
  MethodChannel.MethodCallHandler,
  PluginRegistry.RequestPermissionsResultListener, ActivityAware ,LifecycleOwner{

  private final Activity activity;
  private final Context context;
  private View view;
  private final MethodChannel methodChannel;
  private boolean disposed = false;
  private float mDist;
  private SurfaceView imgSurface;
  private String androidLicenceKey;
  private int defaultLensFacing = CameraSelector.LENS_FACING_FRONT;
  private int lensFacing = defaultLensFacing;
  private ListenableFuture<ProcessCameraProvider> cameraProviderFuture;
  private ByteBuffer[] buffers;
  private int currentBuffer = 0;
  private static final int NUMBER_OF_BUFFERS = 2;

  private DeepAR deepAR;
  private GLSurfaceView surfaceView;
  private FrameLayout localPreviewlayout;
  private DeepARRenderer renderer;
  private RtcEngine mRtcEngine;
  private Lifecycle lifecycle;

//    private CameraGrabber cameraGrabber;

//    @Override
//    public void onFlutterViewAttached(@NonNull View flutterView) {
//
//    }
//
//    @Override
//    public void onFlutterViewDetached() {
//
//    }

//  private int defaultCameraDevice = Camera.CameraInfo.CAMERA_FACING_FRONT;


  //  private int cameraDevice = defaultCameraDevice;
  private int currentMask = 0;
  private int currentEffect = 0;
  private int currentFilter = 0;

  private int screenOrientation;

//  ArrayList<String> masks;
//  ArrayList<String> effects;
//  ArrayList<String> filters;

  private int activeFilterType = 0;
  private File videoFile;



  public CameraDeepArView(WeakReference<Activity> mActivity, BinaryMessenger mBinaryMessenger, RtcEngine rtcEngine, WeakReference<Lifecycle> lifecycleWeakReference, Context mContext, int id, Object args) {
    System.out.println("deepar view created");
    this.activity = mActivity.get();
    this.context = mContext;
    this.mRtcEngine = rtcEngine;
    this.mRtcEngine.setExternalVideoSource(true, true, true);

    System.out.println("deepar rtcengine "+mRtcEngine);
    this.lifecycle=lifecycleWeakReference.get();
//    mRtcEngine.addHandler(mRtcEventHandler);
    //view = View.inflate(context,R.layout.activity_camera, null);
    view = activity.getLayoutInflater().inflate(R.layout.activity_main, null);
    methodChannel =
      new MethodChannel(mBinaryMessenger, "deep_ar_camera/" + id);

    imgSurface = view.findViewById(R.id.localPreview);
    localPreviewlayout = view.findViewById(R.id.localPreviewlayout);

    imgSurface.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View view) {
        deepAR.onClick();
      }
    });

    imgSurface.setFocusable(true);
    imgSurface.setFocusableInTouchMode(true);
    imgSurface.getHolder().addCallback(this);
    // Surface might already be initialized, so we force the call to onSurfaceChanged


    if (args instanceof HashMap) {
      @SuppressWarnings({"unchecked"})
      Map<String, Object> params = (Map<String, Object>) args;
      Object licenceKey = params.get("androidLicenceKey");
      Object cameraEffect = params.get("cameraEffect");
      Object direction = params.get("direction");
      Object cameraMode = params.get("cameraMode");
      if (null != licenceKey) androidLicenceKey = licenceKey.toString();
      if (null != cameraEffect) activeFilterType = Integer.parseInt(String.valueOf(cameraEffect));
      if (null != direction) {
        int index = Integer.parseInt(String.valueOf(direction));
//        defaultCameraDevice = index == 0 ? Camera.CameraInfo.CAMERA_FACING_BACK : Camera.CameraInfo.CAMERA_FACING_FRONT;
//        cameraDevice = defaultCameraDevice;
      }
           /* if(null!=cameraMode){
                int index=Integer.parseInt(String.valueOf(direction));
                defaultCameraDevice = index==0?Camera.CameraInfo.CAMERA_FACING_FRONT:Camera.CameraInfo.CAMERA_FACING_FRONT;
                cameraDevice = defaultCameraDevice;
            }*/
    }

    methodChannel.setMethodCallHandler(this);
//        activity.addRequestPermissionsResultListener(this);
    checkPermissions();
  }

  private void checkPermissions() {
    if (ContextCompat.checkSelfPermission(activity, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED ||
      ContextCompat.checkSelfPermission(activity, Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED ||
      ContextCompat.checkSelfPermission(activity, Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
      ActivityCompat.requestPermissions(activity, new String[]{Manifest.permission.CAMERA, Manifest.permission.WRITE_EXTERNAL_STORAGE, Manifest.permission.RECORD_AUDIO},
        1);
    } else {
      // Permission has already been granted
      initializeDeepAR();
//      setupCamera();
    }
  }

  private void initializeDeepAR() {
    System.out.println("deepar initialize deepar");
    setupCamera();
    setupVideoConfig();
    deepAR = new DeepAR(activity);
    deepAR.setLicenseKey(androidLicenceKey);
    deepAR.initialize(activity, this);
//    initializeFilters();
    renderer = new DeepARRenderer(deepAR, mRtcEngine);
    renderer.setCallInProgress(true);
//    setupLocalFeed();

  }

  private void setupVideoConfig() {


    mRtcEngine.enableVideo();
    // Please go to this page for detailed explanation
    // https://docs.agora.io/en/Video/API%20Reference/java/classio_1_1agora_1_1rtc_1_1_rtc_engine.html#af5f4de754e2c1f493096641c5c5c1d8f
    mRtcEngine.setVideoEncoderConfiguration(new VideoEncoderConfiguration(
      // Agora seems to work best with "Square" resolutions (Aspect Ratio 1:1)
      // At least when used in combination with DeepAR
      VideoEncoderConfiguration.VD_640x480,
      VideoEncoderConfiguration.FRAME_RATE.FRAME_RATE_FPS_15,
      VideoEncoderConfiguration.STANDARD_BITRATE,
      VideoEncoderConfiguration.ORIENTATION_MODE.ORIENTATION_MODE_FIXED_PORTRAIT));


  }

  private void setupLocalFeed() {
    //create a surfaceview
    System.out.println("deepar setting uplocalfeed");
    surfaceView = new GLSurfaceView(activity);
    surfaceView.setEGLContextClientVersion(2);
    surfaceView.setEGLConfigChooser(8, 8, 8, 8, 16, 0);
    //DeepAR processes the camera frames and updates the surfaceview
    surfaceView.setEGLContextFactory(new DeepARRenderer.MyContextFactory(renderer));

    surfaceView.setRenderer(renderer);
    surfaceView.setRenderMode(GLSurfaceView.RENDERMODE_CONTINUOUSLY);
    // surfaceview is added to the local framelayout
//    imgSurface = (surfaceView);
    localPreviewlayout.addView(surfaceView);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) {

    //File imageFile = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES) + "/DeepAR_" + now + ".jpg");


    if ("isCameraReady".equals(methodCall.method)) {
      Map<String, Object> argument = new HashMap<>();
      argument.put("isReady", true);
      methodChannel.invokeMethod("onCameraReady", argument);
      result.success("Android is ready");
    } else if ("setCameraMode".equals(methodCall.method)) {
      if (methodCall.arguments instanceof HashMap) {
        @SuppressWarnings({"unchecked"})
        Map<String, Object> params = (Map<String, Object>) methodCall.arguments;
        Object direction = params.get("cameraMode");
        if (null != direction) activeFilterType = Integer.parseInt(String.valueOf(direction));
      }
      result.success("Mask Changed");
    } else if ("switchCameraDirection".equals(methodCall.method)) {
      if (methodCall.arguments instanceof HashMap) {
        @SuppressWarnings({"unchecked"})
        Map<String, Object> params = (Map<String, Object>) methodCall.arguments;
        Object direction = params.get("direction");
        if (null != direction) {
          int index = Integer.parseInt(String.valueOf(direction));
//          defaultCameraDevice = index == 0 ? Camera.CameraInfo.CAMERA_FACING_BACK : Camera.CameraInfo.CAMERA_FACING_FRONT;
//          cameraDevice = defaultCameraDevice;
//                    cameraGrabber.changeCameraDevice(cameraDevice);
        }
      }
      result.success("Mask Changed");
    } else if ("zoomTo".equals(methodCall.method)) {
      if (methodCall.arguments instanceof HashMap) {
        @SuppressWarnings({"unchecked"})
        Map<String, Object> params = (Map<String, Object>) methodCall.arguments;
        Object index = params.get("zoom");
        int zoom = Integer.parseInt(String.valueOf(index));
//                Camera.Parameters camParams = cameraGrabber.getCamera().getParameters();
//                cameraGrabber.getCamera().cancelAutoFocus();
//                camParams.setZoom(zoom);
//                cameraGrabber.getCamera().setParameters(camParams);
      }
      result.success("ZoomTo Changed");
    } else if ("changeMask".equals(methodCall.method)) {
      if (methodCall.arguments instanceof HashMap) {
        @SuppressWarnings({"unchecked"})
        Map<String, Object> params = (Map<String, Object>) methodCall.arguments;
        Object mask = params.get("mask");
        currentMask = Integer.parseInt(String.valueOf(mask));
//        deepAR.switchEffect("mask", getFilterPath(masks.get(currentMask)));
      }
      result.success("Mask Changed");
    } else if ("changeEffect".equals(methodCall.method)) {
      if (methodCall.arguments instanceof HashMap) {
        @SuppressWarnings({"unchecked"})
        Map<String, Object> params = (Map<String, Object>) methodCall.arguments;
        Object effect = params.get("effect");
        currentEffect = Integer.parseInt(String.valueOf(effect));
//        deepAR.switchEffect("effect", getFilterPath(effects.get(currentEffect)));
      }
      result.success("Effect Changed");
    } else if ("changeFilter".equals(methodCall.method)) {
      if (methodCall.arguments instanceof HashMap) {
        @SuppressWarnings({"unchecked"})
        Map<String, Object> params = (Map<String, Object>) methodCall.arguments;
        Object filter = params.get("filter");
        currentFilter = Integer.parseInt(String.valueOf(filter));
//        deepAR.switchEffect("filter", getFilterPath(filters.get(currentFilter)));
      }
      result.success("Filter Changed");
    } else if ("startVideoRecording".equals(methodCall.method)) {
      CharSequence now = DateFormat.format("yyyy_MM_dd_hh_mm_ss", new Date());
      videoFile = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES) + "/DeepAR_" + now + ".mp4");
      deepAR.startVideoRecording(videoFile.getPath());
      result.success("Video Recording Started");
    } else if ("stopVideoRecording".equals(methodCall.method)) {
      deepAR.stopVideoRecording();
      result.success("Video Recording Stopped");
    } else if ("snapPhoto".equals(methodCall.method)) {
      deepAR.takeScreenshot();
      result.success("Photo Snapped");
    } else if ("dispose".equals(methodCall.method)) {
      disposed = true;
      methodChannel.setMethodCallHandler(null);
      deepAR.setAREventListener(null);
      deepAR.release();
      deepAR = null;
      result.success("Disposed");
    }

  }

//  private void initializeFilters() {
//    masks = new ArrayList<>();
//    masks.add("none");
//    masks.add("aviators");
//    masks.add("bigmouth");
//    masks.add("dalmatian");
//    masks.add("flowers");
//    masks.add("koala");
//    masks.add("lion");
//    masks.add("smallface");
//    masks.add("teddycigar");
//    masks.add("kanye");
//    masks.add("tripleface");
//    masks.add("sleepingmask");
//    masks.add("fatify");
//    masks.add("obama");
//    masks.add("mudmask");
//    masks.add("pug");
//    masks.add("slash");
//    masks.add("twistedface");
//    masks.add("grumpycat");
//
//    effects = new ArrayList<>();
//    effects.add("none");
//    effects.add("fire");
//    effects.add("rain");
//    effects.add("heart");
//    effects.add("blizzard");
//
//    filters = new ArrayList<>();
//    filters.add("none");
//    filters.add("filmcolorperfection");
//    filters.add("tv80");
//    filters.add("drawingmanga");
//    filters.add("sepia");
//    filters.add("bleachbypass");
//  }

  private int getScreenOrientation() {
    int rotation = activity.getWindowManager().getDefaultDisplay().getRotation();
    DisplayMetrics dm = new DisplayMetrics();
    activity.getWindowManager().getDefaultDisplay().getMetrics(dm);
    int width = dm.widthPixels;
    int height = dm.heightPixels;
    int orientation;
    // if the device's natural orientation is portrait:
    if ((rotation == Surface.ROTATION_0
      || rotation == Surface.ROTATION_180) && height > width ||
      (rotation == Surface.ROTATION_90
        || rotation == Surface.ROTATION_270) && width > height) {
      switch (rotation) {
        case Surface.ROTATION_0:
          orientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
          break;
        case Surface.ROTATION_90:
          orientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE;
          break;
        case Surface.ROTATION_180:
          orientation =
            ActivityInfo.SCREEN_ORIENTATION_REVERSE_PORTRAIT;
          break;
        case Surface.ROTATION_270:
          orientation =
            ActivityInfo.SCREEN_ORIENTATION_REVERSE_LANDSCAPE;
          break;
        default:
          orientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
          break;
      }
    }
    // if the device's natural orientation is landscape or if the device
    // is square:
    else {
      switch (rotation) {
        case Surface.ROTATION_0:
          orientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE;
          break;
        case Surface.ROTATION_90:
          orientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
          break;
        case Surface.ROTATION_180:
          orientation =
            ActivityInfo.SCREEN_ORIENTATION_REVERSE_LANDSCAPE;
          break;
        case Surface.ROTATION_270:
          orientation =
            ActivityInfo.SCREEN_ORIENTATION_REVERSE_PORTRAIT;
          break;
        default:
          orientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE;
          break;
      }
    }

    return orientation;
  }

  private void setupCamera() {
    cameraProviderFuture = ProcessCameraProvider.getInstance(activity);
    cameraProviderFuture.addListener(new Runnable() {
      @Override
      public void run() {
        try {
          ProcessCameraProvider cameraProvider = cameraProviderFuture.get();
          bindImageAnalysis(cameraProvider);
        } catch (ExecutionException | InterruptedException e) {
          e.printStackTrace();
        }
      }
    }, ContextCompat.getMainExecutor(activity));
  }

  private void bindImageAnalysis(@NonNull ProcessCameraProvider cameraProvider) {
    CameraResolutionPreset cameraPreset = CameraResolutionPreset.P640x480;
    int width;
    int height;
    int orientation = getScreenOrientation();
    if (orientation == ActivityInfo.SCREEN_ORIENTATION_REVERSE_LANDSCAPE || orientation == ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE) {
      width = cameraPreset.getWidth();
      height = cameraPreset.getHeight();
    } else {
      width = cameraPreset.getHeight();
      height = cameraPreset.getWidth();
    }
    buffers = new ByteBuffer[NUMBER_OF_BUFFERS];
    for (int i = 0; i < NUMBER_OF_BUFFERS; i++) {
      buffers[i] = ByteBuffer.allocateDirect(width * height * 3);
      buffers[i].order(ByteOrder.nativeOrder());
      buffers[i].position(0);
    }

    ImageAnalysis imageAnalysis = new ImageAnalysis.Builder().setTargetResolution(new Size(width, height)).setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST).build();
    imageAnalysis.setAnalyzer(ContextCompat.getMainExecutor(activity), new ImageAnalysis.Analyzer() {
      @Override
      public void analyze(@NonNull ImageProxy image) {
        //image.getImageInfo().getTimestamp();
        byte[] byteData;
        ByteBuffer yBuffer = image.getPlanes()[0].getBuffer();
        ByteBuffer uBuffer = image.getPlanes()[1].getBuffer();
        ByteBuffer vBuffer = image.getPlanes()[2].getBuffer();

        int ySize = yBuffer.remaining();
        int uSize = uBuffer.remaining();
        int vSize = vBuffer.remaining();

        byteData = new byte[ySize + uSize + vSize];

        //U and V are swapped
        yBuffer.get(byteData, 0, ySize);
        vBuffer.get(byteData, ySize, vSize);
        uBuffer.get(byteData, ySize + vSize, uSize);

        buffers[currentBuffer].put(byteData);
        buffers[currentBuffer].position(0);
        if (deepAR != null) {
          deepAR.receiveFrame(buffers[currentBuffer],
            image.getWidth(), image.getHeight(),
            image.getImageInfo().getRotationDegrees(),
            lensFacing == CameraSelector.LENS_FACING_FRONT,
            DeepARImageFormat.YUV_420_888,
            image.getPlanes()[1].getPixelStride()
          );
        }
        currentBuffer = (currentBuffer + 1) % NUMBER_OF_BUFFERS;
        image.close();
      }
    });

    CameraSelector cameraSelector = new CameraSelector.Builder().requireLensFacing(lensFacing).build();
    cameraProvider.unbindAll();
    cameraProvider.bindToLifecycle(this, cameraSelector, imageAnalysis);

  }


  private String getFilterPath(String filterName) {
    if (filterName.equals("none")) {
      return null;
    }
    return "file:///android_asset/" + filterName;
  }


  @Override
  public void surfaceCreated(SurfaceHolder holder) {
    System.out.println("deepar surface created");
    setupLocalFeed();
    setupVideoConfig();
    renderer.setCallInProgress(true);
  }

  @Override
  public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
    // If we are using on screen rendering we have to set surface view where DeepAR will render
    System.out.println("deepar surfaceChanged "+width+" "+height);
    deepAR.setRenderSurface(holder.getSurface(), width, height);
    if (surfaceView != null) {
//      imgSurface = surfaceView;
      localPreviewlayout.removeAllViews();
      localPreviewlayout.addView(surfaceView);
    }
  }

  @Override
  public void surfaceDestroyed(SurfaceHolder holder) {
    System.out.println("deepar surfaceDestroyed ");
    if (deepAR != null) {
      deepAR.setRenderSurface(null, 0, 0);
      localPreviewlayout.removeAllViews();
    }
  }
//  private final IRtcEngineEventHandler mRtcEventHandler = new IRtcEngineEventHandler() {
//    @Override
//    public void onWarning(int warn) {
//      Log.e("deepar", "warning: " + warn);
//    }
//
//    @Override
//    public void onError(int err) {
//      Log.e("deepar", "error: " + err);
//    }
//
//    @Override
//    public void onJoinChannelSuccess(String channel, final int uid, int elapsed) {
//      try {
//        runOnUiThread(new Runnable() {
//          @Override
//          public void run() {
//           Log.d("deepar","onJoinChannelSuccess");
//            renderer.setCallInProgress(true);
//          }
//        });
//      } catch (Throwable throwable) {
//        throwable.printStackTrace();
//      }
//    }
//
//    @Override
//    public void onFirstRemoteVideoDecoded(final int uid, int width, int height, int elapsed) {
//      try {
//        runOnUiThread(new Runnable() {
//          @Override
//          public void run() {
//            System.out.println("deeparonFirstRemoteVideoDecoded");
//  renderer.setCallInProgress(true);
//          }
//        });
//      } catch (Throwable throwable) {
//        throwable.printStackTrace();
//      }
//    }
//
//    @Override
//    public void onUserOffline(final int uid, int reason) {
//      try {
//        runOnUiThread(new Runnable() {
//          @Override
//          public void run() {
//           System.out.println( "deepar onUserOffline");
//            renderer.setCallInProgress(false);
//          }
//        });
//      } catch (Throwable throwable) {
//        throwable.printStackTrace();
//      }
//    }
//  };


  @Override
  public View getView() {
    return view;
  }

  @Override
  public void dispose() {
    if (disposed) {
      return;
    }
    surfaceView.onPause();

    dispostCameraProvider();
    System.out.println("deepardispose surfaceview ");
    surfaceView = null;
    System.out.println("deepar dispose rtc");
//    this.mRtcEngine=null;
    disposed = true;
    System.out.println("deepar disposed");
    methodChannel.setMethodCallHandler(null);
    deepAR.setAREventListener(null);
    deepAR.release();
    deepAR = null;

  }

  private void dispostCameraProvider() {
    if (cameraProviderFuture != null) {
      ProcessCameraProvider cameraProvider = null;
      try {
        cameraProvider = cameraProviderFuture.get();
        cameraProvider.unbindAll();
        cameraProviderFuture.cancel(true);
        cameraProviderFuture=null;
        System.out.println("deepar dispose cameraProviderFuture");
      } catch (ExecutionException e) {
        e.printStackTrace();
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
  }

  @Override
  public void screenshotTaken(Bitmap bitmap) {
    CharSequence now = DateFormat.format("yyyy_MM_dd_hh_mm_ss", new Date());
    try {
      File imageFile = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES) + "/DeepAR_" + now + ".jpg");
      FileOutputStream outputStream = new FileOutputStream(imageFile);
      int quality = 100;
      bitmap.compress(Bitmap.CompressFormat.JPEG, quality, outputStream);
      outputStream.flush();
      outputStream.close();
      MediaScannerConnection.scanFile(context, new String[]{imageFile.toString()}, null, null);
      //Toast.makeText(context, "Screenshot saved", Toast.LENGTH_SHORT).show();
      Map<String, Object> argument = new HashMap<>();
      argument.put("path", imageFile.toString());
      methodChannel.invokeMethod("onSnapPhotoCompleted", argument);
    } catch (Throwable e) {
      e.printStackTrace();
    }
  }

  @Override
  public void videoRecordingStarted() {
//deepAR.startVideoRecording("");
  }

  @Override
  public void videoRecordingFinished() {
//deepAR.stopVideoRecording();
    Map<String, Object> argument = new HashMap<>();
    argument.put("path", videoFile.toString());
    methodChannel.invokeMethod("onVideoRecordingComplete", argument);
  }

  @Override
  public void videoRecordingFailed() {

  }

  @Override
  public void videoRecordingPrepared() {

  }

  @Override
  public void shutdownFinished() {

  }

  @Override
  public void initialized() {
    imgSurface.setVisibility(View.GONE);
    imgSurface.setVisibility(View.VISIBLE);
    deepAR.switchEffect("mask", getFilterPath("alien"));
    renderer.setCallInProgress(true);
    if(surfaceView!=null){
      localPreviewlayout.removeAllViews();
      localPreviewlayout.addView(surfaceView);
    }
    System.out.println("deepar initialized");
  }

  @Override
  public void faceVisibilityChanged(boolean b) {

  }

  @Override
  public void imageVisibilityChanged(String s, boolean b) {

  }

  @Override
  public void frameAvailable(Image image) {

  }

  @Override
  public void error(ARErrorType arErrorType, String s) {

  }

  @Override
  public void effectSwitched(String s) {

  }

//    private void handleZoom(MotionEvent event, Camera.Parameters params) {
//        int maxZoom = params.getMaxZoom();
//        int zoom = params.getZoom();
//        float newDist = getFingerSpacing(event);
//
//        if (Math.abs(newDist - mDist) < 2) return;
//
//        if (newDist > mDist) {
//            //zoom in
//            if (zoom < maxZoom)
//                zoom++;
//        } else if (newDist < mDist) {
//            //zoom out
//            if (zoom > 0)
//                zoom--;
//        }
//        mDist = newDist;
//        params.setZoom(zoom);
//        cameraGrabber.getCamera().setParameters(params);
//    }

  private float getFingerSpacing(MotionEvent event) {
    // ...
    float x = event.getX(0) - event.getX(1);
    float y = event.getY(0) - event.getY(1);
    return (float) Math.sqrt(x * x + y * y);
  }

//    private void handleFocus(MotionEvent event) {
//        int pointerId = event.getPointerId(0);
//        int pointerIndex = event.findPointerIndex(pointerId);
//        // Get the pointer's current position
//
//        int xxw = imgSurface.getHeight();
//        int xxh = imgSurface.getWidth();
//        float x = event.getY(pointerIndex);
//        float y = xxh - event.getX(pointerIndex);
//
//        //cancel previous actions
//        cameraGrabber.getCamera().cancelAutoFocus();
//
//        Rect touchRect = new Rect(
//                (int) (x - 100),
//                (int) (y - 100),
//                (int) (x + 100),
//                (int) (y + 100));
//
//        int aboutToBeLeft = touchRect.left;
//        int aboutToBeTop = touchRect.top;
//        int aboutToBeRight = touchRect.right;
//        int aboutToBeBottom = touchRect.bottom;
//
//        if (aboutToBeLeft < 0) {
//            aboutToBeLeft = 0;
//            aboutToBeRight = 200;
//        }
//        if (aboutToBeTop < 0) {
//            aboutToBeTop = 0;
//            aboutToBeBottom = 200;
//        }
//        if (aboutToBeRight > xxw) {
//            aboutToBeRight = xxw;
//            aboutToBeLeft = xxw - 200;
//        }
//        if (aboutToBeBottom > xxh) {
//            aboutToBeBottom = xxh;
//            aboutToBeTop = xxh - 200;
//        }
//
//        aboutToBeLeft = aboutToBeLeft * 2000 / xxw - 1000;
//        aboutToBeTop = aboutToBeTop * 2000 / xxh - 1000;
//        aboutToBeRight = aboutToBeRight * 2000 / xxw - 1000;
//        aboutToBeBottom = aboutToBeBottom * 2000 / xxh - 1000;
//
//        Rect focusRect = new Rect(
//                aboutToBeLeft,
//                aboutToBeTop,
//                aboutToBeRight,
//                aboutToBeBottom);
//
//        Camera.Parameters parameters = null;
//
//        try {
//            parameters = cameraGrabber.getCamera().getParameters();
//        } catch (Exception e) {
//            Log.e("Error", "Error getting parameter:" + e);
//        }
//
//        // check if parameters are set (handle RuntimeException: getParameters failed (empty parameters))
//        if (parameters != null) {
//            List<Camera.Area> mylist2 = new ArrayList<>();
//
//            mylist2.add(new Camera.Area(focusRect, 1000));
//
//            List<String> supportedFocusMode = parameters.getSupportedFocusModes();
//            String focusMode = Camera.Parameters.FOCUS_MODE_AUTO;
//            if (!supportedFocusMode.contains(Camera.Parameters.FOCUS_MODE_AUTO)) {
//                if (supportedFocusMode.size() > 0) {
//                    focusMode = supportedFocusMode.get(0);
//                }
//            }
//            parameters.setFocusMode(focusMode);
//            if (focusMode.equals(Camera.Parameters.FOCUS_MODE_AUTO))
//                parameters.setFocusAreas(mylist2);
//
//            try {
//                cameraGrabber.getCamera().setParameters(parameters);
//                cameraGrabber.getCamera().autoFocus(new Camera.AutoFocusCallback() {
//                    @Override
//                    public void onAutoFocus(boolean success, Camera camera) {
//                    }
//                });
//            } catch (Exception e) {
//                Log.e("error", "lalalalalala=> " + e);
//            }
//        }
//    }


  @Override
  public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
    if (requestCode == 1 && grantResults.length > 0) {
      for (int grantResult : grantResults) {
        if (grantResult != PackageManager.PERMISSION_GRANTED) {
          return false;
        }
        initializeDeepAR();
      }
    }
    return false;
  }


  @Override
  public void onRtcEngineCreated(@Nullable RtcEngine rtcEngine) {
    System.out.println("deepar CameraDeepArView rtcengine created");
//    this.mRtcEngine = rtcEngine;
//    initializeDeepAR();
  }

  @Override
  public void onRtcEngineDestroyed() {
    System.out.println("deepar CameraDeepArView rtcengine created");
//    this.mRtcEngine = null;
  }


  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {

  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

  }

  @Override
  public void onDetachedFromActivity() {
//    dispostCameraProvider();
  }

  @NonNull
  @Override
  public Lifecycle getLifecycle() {
    return this.lifecycle;
  }
}

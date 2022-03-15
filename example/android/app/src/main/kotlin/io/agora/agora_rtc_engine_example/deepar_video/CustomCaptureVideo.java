// Autogenerated from Pigeon (v1.0.19), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package io.agora.agora_rtc_engine_example.deepar_video;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class CustomCaptureVideo {
  private static class CustomCaptureVideoApiCodec extends StandardMessageCodec {
    public static final CustomCaptureVideoApiCodec INSTANCE = new CustomCaptureVideoApiCodec();
    private CustomCaptureVideoApiCodec() {}
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface CustomCaptureVideoApi {
    @NonNull void setExternalVideoSource(Boolean enabled, Boolean useTexture, Boolean pushMmode);
    @NonNull void startRenderer();
    @NonNull void stoRenderer();

    /** The codec used by CustomCaptureVideoApi. */
    static MessageCodec<Object> getCodec() {
      return CustomCaptureVideoApiCodec.INSTANCE;
    }

    /** Sets up an instance of `CustomCaptureVideoApi` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, CustomCaptureVideoApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.CustomCaptureVideoApi.setExternalVideoSource", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              Boolean enabledArg = (Boolean)args.get(0);
              if (enabledArg == null) {
                throw new NullPointerException("enabledArg unexpectedly null.");
              }
              Boolean useTextureArg = (Boolean)args.get(1);
              if (useTextureArg == null) {
                throw new NullPointerException("useTextureArg unexpectedly null.");
              }
              Boolean pushMmodeArg = (Boolean)args.get(2);
              if (pushMmodeArg == null) {
                throw new NullPointerException("pushMmodeArg unexpectedly null.");
              }
              api.setExternalVideoSource(enabledArg, useTextureArg, pushMmodeArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.CustomCaptureVideoApi.startRenderer", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.startRenderer();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.CustomCaptureVideoApi.stoRenderer", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.stoRenderer();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    return errorMap;
  }
}

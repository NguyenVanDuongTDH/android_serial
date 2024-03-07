#ifndef FLUTTER_PLUGIN_ANDROID_SERIAL_PLUGIN_H_
#define FLUTTER_PLUGIN_ANDROID_SERIAL_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace android_serial {

class AndroidSerialPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AndroidSerialPlugin();

  virtual ~AndroidSerialPlugin();

  // Disallow copy and assign.
  AndroidSerialPlugin(const AndroidSerialPlugin&) = delete;
  AndroidSerialPlugin& operator=(const AndroidSerialPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace android_serial

#endif  // FLUTTER_PLUGIN_ANDROID_SERIAL_PLUGIN_H_

#include "include/android_serial/android_serial_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "android_serial_plugin.h"

void AndroidSerialPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  android_serial::AndroidSerialPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

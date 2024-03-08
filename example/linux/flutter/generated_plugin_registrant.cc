//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <android_serial/android_serial_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) android_serial_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AndroidSerialPlugin");
  android_serial_plugin_register_with_registrar(android_serial_registrar);
}

import 'dart:async';

import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:serial/serial.dart';

class SerialAndroidBluetooth extends SerialClient {
  String name;
  BluetoothConnection? _serial;
  SerialAndroidBluetooth(this.name);
  @override
  void add(Uint8List datas) {
    _serial!.output.add(datas);
  }

  @override
  Future<void> close() async {
    await _serial?.close();
    _serial?.dispose();
    _serial = null;
  }

  @override
  Future<bool> connect() async {
    final devices = await FlutterBluetoothSerial.instance.getBondedDevices();
    for (var i = 0; i < devices.length; i++) {
      print(devices[i].name);
      if (devices[i].name == name) {
        _serial = await BluetoothConnection.toAddress(devices[i].address);
        break;
      }
    }

    return true;
  }

  @override
  StreamSubscription<Uint8List> listen(void Function(Uint8List event)? onData,
          {void Function()? onDone}) =>
      _serial!.input!.listen(onData, onDone: onDone);
}

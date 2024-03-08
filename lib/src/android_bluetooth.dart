import 'dart:async';

import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:serial/serial.dart';

class SerialAndroidBluetooth extends SerialClient {
  String? _name;
  String? _address;

  BluetoothConnection? _serial;
  SerialAndroidBluetooth({String? name, String? address})
      : _name = name,
        _address = address;
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
    try {
      if (_address != null) {
        _serial = await BluetoothConnection.toAddress(_address);
      } else {
        final devices =
            await FlutterBluetoothSerial.instance.getBondedDevices();
        for (var i = 0; i < devices.length; i++) {
          if (devices[i].name == _name) {
            _serial = await BluetoothConnection.toAddress(devices[i].address);
            break;
          }
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  StreamSubscription<Uint8List> listen(void Function(Uint8List event)? onData,
          {void Function()? onDone}) =>
      _serial!.input!.listen(onData, onDone: onDone);
}

import 'dart:async';
import 'dart:typed_data';

import 'package:serial/serial.dart';
import 'package:usb_serial/usb_serial.dart';

class SerialAndroidClientUSB extends SerialClient {
  UsbPort? _port;
  int baudRate;
  int dataBits;
  int stopBits;
  int parity;

  SerialAndroidClientUSB({
    this.baudRate = 9600,
    this.dataBits = UsbPort.DATABITS_8,
    this.stopBits = UsbPort.STOPBITS_1,
    this.parity = UsbPort.PARITY_NONE,
  });
  @override
  void add(Uint8List datas) {
    _port!.write(datas);
  }

  @override
  Future<void> close() async {
    _port!.close();
    _port = null;
  }

  @override
  Future<bool> connect() async {
    try {
      final device = await UsbSerial.listDevices();
      _port = await device[0].create();
      if (await (_port!.open()) != true) {
        return false;
      }

      await _port!.setDTR(true);
      await _port!.setRTS(true);
      await _port!.setPortParameters(baudRate, dataBits, stopBits, parity);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  StreamSubscription<Uint8List> listen(void Function(Uint8List event)? onData,
          {void Function()? onDone}) =>
      _port!.inputStream!.listen(onData, onDone: onDone);
}

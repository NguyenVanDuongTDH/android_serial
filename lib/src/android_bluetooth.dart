import 'dart:async';
import 'dart:typed_data';

import 'package:serial/serial.dart';

class SerialBluetoothClient extends SerialClient {
  @override
  void add(Uint8List datas) {
    // TODO: implement add
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<bool> connect() {
    // TODO: implement connect
    throw UnimplementedError();
  }

  @override
  StreamSubscription<Uint8List> listen(void Function(Uint8List event)? onData,
      {void Function()? onDone}) {
    // TODO: implement listen
    throw UnimplementedError();
  }
}

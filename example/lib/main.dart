import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_serial/android_serial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SerialAndroidBluetooth serialBLT = SerialAndroidBluetooth(name: "ESP32");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serialBLT.connect().then((value) {
      serialBLT.listen((event) {
        print(event);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () async {
                  serialBLT
                      .write(Uint8List.fromList("hello world!\n".codeUnits));
                },
                child: const Text("child"))
          ]),
        ),
      ),
    );
  }
}

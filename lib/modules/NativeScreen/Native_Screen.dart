import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Native_Screen extends StatefulWidget {
  @override
  State<Native_Screen> createState() => _Native_ScreenState();
}

class _Native_ScreenState extends State<Native_Screen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String batteryLevel = 'Unknown battery level.';

  void getBatteryLevel() {
    // String batteryLevel;
    platform.invokeMethod('getBatteryLevel').then((value) {
      setState(() {
        batteryLevel = 'Battery level at $value % .';
      });
    }).catchError((error) {
      setState(() {
        batteryLevel = "Failed to get battery level: '${error.message}'.";
      });
    });

    /* try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      batteryLevel = batteryLevel;
    });
  }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(batteryLevel),
          ],
        ),
      ),
    );
  }
}

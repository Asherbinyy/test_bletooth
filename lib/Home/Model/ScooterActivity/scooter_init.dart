import 'package:flutter_ble/Home/Model/scooter_operation.dart';

class ScooterInit extends ScooterOperation {

  final int key;

  ScooterInit({required this.key})
      : super(
          key: key,
          length: 0x08,
          cmd: 0x01,
          data: [
            0x49,
            0x35,
            0x34,
            0x56,
            0x32,
            0x7A,
            0x36,
            0x36,
          ],
        );
}
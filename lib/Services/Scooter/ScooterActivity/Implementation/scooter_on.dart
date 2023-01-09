import 'package:flutter_ble/Core/Helper/hex_helper.dart';
import 'package:flutter_ble/Services/Scooter/ScooterActivity/Interface/scooter_activity.dart';



const String _cmd = '05';
const String _data = '49353456327A3636';

class ScooterOn extends ScooterActivity {
  final String rand;

  ScooterOn({required this.rand})
      : super(
          rand: rand,
          length: ((_data.length) ~/ 2).toString().padLeft(2, '0'),
          cmd: _cmd,
          data: HexHelper().splitEachTwo(_data),
        );
}

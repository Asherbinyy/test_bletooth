import 'package:flutter_ble/Services/Scooter/ScooterActivity/Interface/scooter_activity.dart';

class ScooterInit extends ScooterActivity {
  ScooterInit()
      : super(
          length: '08',
          cmd: '01',
          data: ['49', '35', '34', '56', '32', '7A', '36', '36'],
        );
}

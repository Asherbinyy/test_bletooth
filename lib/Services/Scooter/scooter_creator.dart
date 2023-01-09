import 'package:flutter_ble/Services/Scooter/ScooterActivity/Implementation/scooter_init.dart';
import 'package:flutter_ble/Services/Scooter/ScooterActivity/Implementation/scooter_on.dart';

class ScooterCreator {
  ScooterCreator._();
  static final ScooterCreator _instance = ScooterCreator._();
  factory ScooterCreator() => _instance;

  ScooterInit init() => ScooterInit();

  ScooterOn on(String rand) => ScooterOn(rand: rand);

}


import 'package:flutter_ble/Services/Scooter/ScooterActivity/Interface/scooter_activity.dart';

abstract class ScooterOperationsInterface {

   /// Takes Scooter Activity ex : [ScooterInit] , [ScooterOn] ...  as a parameter
   /// and turn it into an encoded array
   List<String> encode (ScooterActivity activity);

   /// Takes Encoded data as a parameter and turn it into a Scooter Activity Object
   /// Such as [ScooterInit] , [ScooterOn]
   ScooterActivity decode (String data) ;

}


part of 'imports_scooter_operation.dart';


class ScooterOperations extends ScooterOperationsInterface {

  factory ScooterOperations() => _instance;
  ScooterOperations._internal();
  static final ScooterOperations _instance = ScooterOperations._internal();



  @override
  ScooterActivity decode(String data) {
    // //  A3, A4, 08, 50, 1e, 1f, 57, 2b, 2a, 48, 2c, 64, 28, 28
    // // final List <String> dataToList = data.split(',') ;
    // final List <String> dataToList = data.split(',').map((e) => e.trim()).toList();
    //
    // print('dataToList => ${dataToList}');
   return ScooterDataDecoder(input: data).decode;
  }

  @override
  List<String> encode(ScooterActivity activity) {
    return ScooterDataEncoder(input: activity).encode;
  }

}


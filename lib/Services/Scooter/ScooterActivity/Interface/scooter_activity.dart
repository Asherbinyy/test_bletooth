import 'package:flutter_ble/Services/Scooter/ScooterOperations/Implementation/imports_scooter_operation.dart';

class ScooterActivity {
  String? stxI;
  String? stxII;
  String? length;
  String? rand;
  String? key;
  String? cmd;
  List<String>? data;

  ScooterActivity({
    this.stxI = 'A3',
    this.stxII = 'A4',
    required this.length,
    this.rand = '1E',
    this.key = '00',
    required this.cmd,
    required this.data,
  });

  @override
  String toString() {
    return 'ScooterActivity{stxI: $stxI, stxII: $stxII, length: $length, rand: $rand, key: $key, cmd: $cmd, data: $data}';
  }

  List<String> toBytes() {
    final List<String> bytes = <String>[
      stxI ?? '00',
      stxII ?? '00',
      length ?? '00',
      rand ?? '00',
      key ?? '00',
      cmd ?? '00',
    ];
    final List<String> bytesWithData = List.from(bytes)..addAll(data ?? []);
    return bytesWithData;
  }

  ScooterActivity.copyWith({
    String? stxI,
    String? stxII,
    String? length,
    String? rand,
    String? key,
    String? cmd,
    List<String>? data,
  }) {
    this.stxI = stxI ?? this.stxI;
    this.stxII = stxII ?? this.stxII;
    this.length = length ?? this.length;
    this.rand = rand ?? this.rand;
    this.key = key ?? this.key;
    this.cmd = cmd ?? this.cmd;
    this.data = data ?? this.data;
  }

  ScooterActivity.fromHex(String hex) {
    stxI = hex.substring(0, 2);
    stxII = hex.substring(2, 4);
    length = hex.substring(4, 6);
    rand = hex.substring(6, 8);
    key = hex.substring(8, 10);
    cmd = hex.substring(10, 12);
    // data = hex.substring()
    // data= calcData(hex);
    data = [];
    final hamada = hex.substring(12, 12 + int.parse(length!,radix: 16) * 2).split('');
    int i = 1;
    String keyItem = '';

    for (String item in hamada) {
      if (i % 2 != 0) {
        keyItem = item;
      } else {
        data?.add(keyItem + item);
        keyItem = '';
      }
      i = i + 1;
     }
  }

  //
  // List<String>? calcData (String hex){
  //   List <String>? data = [];
  //   final dataAsString = hex.substring(12 ,hex.length) ;
  //   final dataAsList = dataAsString.split('').toList();
  //   for (var i = 0; i < dataAsList.length ~/2 ; i+2) {
  //     final concatinated = dataAsList[i]+dataAsList[i+1];
  //     data.add(concatinated);
  //   }
  //   return data;
  // }
  String toHex() {
    return toBytes().map((e) => e).join('');
  }

  List<String> encode() {
    return ScooterDataEncoder(input: this).encode;
  }

  ScooterActivity decode(String data) {
    final updated = ScooterActivity.fromHex(data);
    return updated;
  }
}

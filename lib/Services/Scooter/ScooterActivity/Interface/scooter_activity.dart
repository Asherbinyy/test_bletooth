import 'package:flutter_ble/Core/Helper/hex_helper.dart';
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
    data = hex.substring(12, hex.length).split(',');
  }

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

// /// step 1 : add 32 to rand
// String add32ToRand() {
//   final randResult = HexHelper().add(rand ?? '00', "32");
//   print('add32ToRand: $randResult');
//   return randResult;
// }
//
// /// step 2 XOR rand to each byte of data
// ScooterActivity _xorRandToEachByte() {
//   final updatedRand = add32ToRand();
//   final oldRand = rand;
//   final List<String> updatedData =
//       (data ?? []).map((e) => HexHelper().xor(e, oldRand??'00')).toList();
//
//   return ScooterActivity.copyWith(
//     stxI: stxI,
//     stxII: stxII,
//     length: length,
//     rand: updatedRand,
//     key: HexHelper().xor(key ?? '00', oldRand??'00'),
//     cmd: HexHelper().xor(cmd ?? '00', oldRand??'00'),
//     data: updatedData,
//   );
// }
//
// List<String> crc8() {
//   final result = _xorRandToEachByte ().toBytes();
//   print('crc8 result : => $result');
//   return result ;
// }
}

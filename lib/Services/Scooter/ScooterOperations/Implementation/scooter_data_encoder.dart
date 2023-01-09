part of 'imports_scooter_operation.dart';

class ScooterDataEncoder extends ScooterEncoderInterface {
  ScooterDataEncoder({required this.input});

  final ScooterActivity input;

  /// step 1 : add 32 to rand
  String _add32ToRand() {
    final randResult = HexHelper().add(input.rand ?? '00', "32");
    print('add32ToRand: $randResult');
    return randResult;
  }

  /// step 2 XOR rand to each byte of data
  ScooterActivity _xorRandToEachByte() {
    final updatedRand = _add32ToRand();
    final oldRand = input.rand;
    final List<String> updatedData = (input.data ?? [])
        .map((e) => HexHelper().xor(e, oldRand ?? '00'))
        .toList();

    return ScooterActivity.copyWith(
      stxI: input.stxI,
      stxII: input.stxII,
      length: input.length,
      rand: updatedRand,
      key: HexHelper().xor(input.key ?? '00', oldRand ?? '00'),
      cmd: HexHelper().xor(input.cmd ?? '00', oldRand ?? '00'),
      data: updatedData,
    );
  }

  /// step 3 : Turn Code to Hex
  List<String> _turnIntoBytes() {
    final result = _xorRandToEachByte().toBytes();
    // print('crc8 result : => $result');
    return result;
  }

  /// step 4 : encode Crc value
  List<String> _updateWithCrc8() {
    final input = _turnIntoBytes();
    final crc = CrC().calculateFrom(input);
    input.add(crc);
    return input;
  }

  /// Step 5 : calculate final result
  @override
  List<String> get encode {
    return _updateWithCrc8();
  }
}

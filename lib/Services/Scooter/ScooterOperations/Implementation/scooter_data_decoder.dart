part of 'imports_scooter_operation.dart';

class ScooterDataDecoder extends ScooterDecoderInterface {
  ScooterDataDecoder({required this.input});
  final List<String> input;

  /// step 1 : decode crc value
  List<String> _decodeCrc() {
    ///TODO :  change later
    return input;
  }

  /// step 2 : decode Crc8 value

  List<String> _decodeCrc8() {
    ///TODO :  change later
    return _decodeCrc();
  }

  /// step 3 : XNOR data and return it back to Scooter Data

  ScooterActivity _injectToScooter() {
    return ScooterActivity.fromHex(
      _decodeCrc8().map((e) => e).join(''),
    );
  }

  /// step 4 : XNor data from rand and subtract 32 from rand

  ScooterActivity __xNORDataFromRand() {
    final scooter = _injectToScooter();
    final randResult = HexHelper().sub(scooter.rand ?? '00', "32");
    print('subtract32FromRand: $randResult');
    return ScooterActivity.copyWith(
      stxI: scooter.stxI,
      stxII: scooter.stxII,
      length: scooter.length,
      rand: randResult,
      key: HexHelper().xnor(scooter.key ?? '00', randResult  ),
      cmd: HexHelper().xnor(scooter.cmd ?? '00', randResult ),
      data: (scooter.data ?? []).map((e) => HexHelper().xnor(e, randResult  )).toList(),
    );
  }

  /// step 5 : calculate final result
  @override
  ScooterActivity get decode   {
    return __xNORDataFromRand();
  }
}

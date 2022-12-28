class ScooterOperation {
  late int stxI;
  late int stxII;
  late int length;
  late int rand;
  late int key;
  late int cmd;
  late List<int> data;

  ScooterOperation({
    this.stxI = 0xA3,
    this.stxII = 0xA4,
    required this.length,
    this.rand = 0x1E,
    this.key = 0x00,
    required this.cmd,
    required this.data,
  });

  List<int> toBytes() {
    final List<int> bytes = <int>[stxI, stxII, length, rand, key, cmd];
    final List<int> bytesWithData = List.from(bytes)..addAll(data);
    return bytesWithData;
  }

  ScooterOperation.copyWith({
    int? stxI,
    int? stxII,
    int? length,
    int? rand,
    int? key,
    int? cmd,
    List<int>? data,
  }) {
    this.stxI = stxI ?? this.stxI;
    this.stxII = stxII ?? this.stxII;
    this.length = length ?? this.length;
    this.rand = rand ?? this.rand;
    this.key = key ?? this.key;
    this.cmd = cmd ?? this.cmd;
    this.data = data ?? this.data;
  }

  // // 49 35 34 56 32 7A 36 36
// // 49,35,34,56,32,7A,36,36
  ScooterOperation.fromHex(String hex) {
    stxI = int.parse(hex.substring(0, 2), radix: 16);
    stxII = int.parse(hex.substring(2, 4), radix: 16);
    length = int.parse(hex.substring(4, 6), radix: 16);
    rand = int.parse(hex.substring(6, 8), radix: 16);
    key = int.parse(hex.substring(8, 10), radix: 16);
    cmd = int.parse(hex.substring(10, 12), radix: 16);
    data = hex
        .substring(12, hex.length)
        .split('')
        .map((e) => int.parse(e, radix: 16))
        .toList();
  }

  String toHex() {
    return '${stxI.toRadixString(16).padLeft(2, '0')}${stxII.toRadixString(16).padLeft(2, '0')}${length.toRadixString(16).padLeft(2, '0')}${rand.toRadixString(16).padLeft(2, '0')}${key.toRadixString(16).padLeft(2, '0')}${cmd.toRadixString(16).padLeft(2, '0')}${data.map((e) => e.toRadixString(16).padLeft(2, '0')).join()}';
  }

  ScooterOperation _add32ToHex() {
    return ScooterOperation.copyWith(

      rand: int.tryParse((rand + 0x32).toRadixString(16).padLeft(2, '0'),radix: 16),
    );
  }
}

// String toHex() {
//   return '${stxI.toRadixString(16).padLeft(2, '0')}${stxII.toRadixString(16).padLeft(2, '0')}${length.toRadixString(16).padLeft(2, '0')}${rand.toRadixString(16).padLeft(2, '0')}${key.toRadixString(16).padLeft(2, '0')}${cmd.toRadixString(16).padLeft(2, '0')}${data.map((e) => e.toRadixString(16).padLeft(2, '0')).join()}';
// }

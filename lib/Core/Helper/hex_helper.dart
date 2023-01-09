import 'Interface/arithametic_opertators_interface.dart';

class HexHelper extends ArithmeticOperators {
  factory HexHelper() => _instance;

  HexHelper._internal();

  static final HexHelper _instance = HexHelper._internal();

  @override
  String add(String a, String b) {
    final result =
    (int.parse(a, radix: 16) + int.parse(b, radix: 16)).toRadixString(16);
    // print('result => $result');
    return result;
  }

  @override
  String sub(String a, String b) {
    String result;
    try {
      result =
          (int.parse(a, radix: 16) - int.parse(b, radix: 16)).toRadixString(16);
    } catch (e) {
      result = '00';
      print('error in Sub => $e');
    }

    return result;
  }

  @override
  String xor(String a, String b) {
    final result =
    (int.parse(a, radix: 16) ^ int.parse(b, radix: 16)).toRadixString(16);
    // print('result => $result');
    return result;
  }

  @override
  String xnor(String a, String b) {
    final input = xor(a, b);

    final result = not(input);
    return input;
  }

  List<int> hexToBytes(String hex) {
    final bytes = <int>[];
    for (var i = 0; i < hex.length; i += 2) {
      bytes.add(int.parse(hex.substring(i, i + 2), radix: 16));
    }
    return bytes;
  }

  @override
  String not(String a) {
    final result = (int.parse(a, radix: 16) ^ 0xff).toRadixString(16);
    // print('result => $result');
    return result;
  }

  /// [A,B,C,D,0,0] => [AB,CD,00]
  List<String> splitEachTwo(String value) {
    final List<String> data = <String>[];
    final splitList = value.split('');
    int i = 1;
    String keyItem = '';
    for (String item in splitList) {
      if (i % 2 != 0) {
        keyItem = item;
      } else {
        data.add(keyItem + item);
        keyItem = '';
      }
      i = i + 1;
    }
    return data;
  }

}
//   String padToLeft(String value) {
//     if (value.length > 1) {
//       return value.padLeft(2, '0');
//     } else {
//       return value;
//     }
//   }
// }

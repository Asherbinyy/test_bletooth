import 'package:flutter/foundation.dart';

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
    final result =
        (int.parse(a, radix: 16) ^ ~int.parse(b, radix: 16)).toRadixString(16);

    return result;
  }
}

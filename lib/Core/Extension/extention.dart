extension HexSuffix on int {
  int get toHex {
    final asString = "0x${this}";
    return int.parse(asString);
  }

}


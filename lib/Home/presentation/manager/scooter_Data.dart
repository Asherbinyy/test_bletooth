const String bluetoothMacAddress = "D7:13:31:5D:DB:F6";
const String bluetoothMacAddressAsNumber = "D713315DDBF6";


// scooter written Characteristics
enum ScooterCommands {
  verifyDeviceKey("0x01"),
  instructionErrorPrompt("0x10"),
  lock("0x15"),
  unlock("0x05"),
  info("0x60"),
  setScooter("0x61"),
  setScooter2("0x62"),
  unlockExternalDevices("0x81"),
  quickLockInfo("0x31"),
  lastUsageData("0x51"),
  clearUsageData("0x52");
  final String code;
  const ScooterCommands(this.code);
}
/// [A3, A4, 08, 50, 1E, 1F, 51, 73, 70, 77, 49, 2A, 59, 46, 01]

// scooter read Characteristics

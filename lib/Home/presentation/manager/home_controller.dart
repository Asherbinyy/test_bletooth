import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FlutterBluePlus _flutterBlue = FlutterBluePlus.instance;
  final List<BluetoothDevice> devicesList = <BluetoothDevice>[];

  late TextEditingController writeController = TextEditingController();
  BluetoothDevice? connectedDevice;
  List<BluetoothService> services = [];
    final Map<Guid, List<int>> _readValues = <Guid, List<int>>{};
  Map<Guid, List<int>> get readValues => _readValues;
    // update the read values
    void updateReadValue( Guid uuid,  List<int> value) {
      _readValues[uuid] = value;
      update();
    }


  Future<void> stopScan() async => await _flutterBlue.stopScan();

   Future<void> connectDevice(BluetoothDevice device) async {
    await stopScan();
    try {
      await device.connect();
    } on PlatformException catch (e) {
      if (e.code != 'already_connected') {
        rethrow;
      }
    } finally {
      services = await device.discoverServices();
    }
    connectedDevice = device;
    update();
  }

  void _addDeviceTolist(final BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      devicesList.add(device);
      update();
    }
  }

  @override
  void onInit() {
    _flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });
    _flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });
    _flutterBlue.startScan();
    super.onInit();
  }
}

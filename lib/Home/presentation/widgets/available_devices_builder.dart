import 'package:flutter/material.dart';
import 'package:flutter_ble/Home/presentation/manager/home_controller.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';


class AvailableDevicesBuilder extends StatelessWidget {
  // devicesList
  final List<BluetoothDevice> devicesList;
  final Function(BluetoothDevice device) onConnectionPressed;

  const AvailableDevicesBuilder({Key? key, required this.devicesList, required this.onConnectionPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> containers = <Widget>[];
    for (BluetoothDevice device in devicesList) {
      containers.add(
        SizedBox(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(device.name == '' ? '(unknown device)' : device.name),
                    Text(device.id.toString()),
                  ],
                ),
              ),
              TextButton(
                child: const Text(
                  'Connect',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: ()   {
                  onConnectionPressed(device);
                },
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_ble/Home/presentation/manager/home_controller.dart';
import 'package:flutter_ble/Home/presentation/widgets/button_action.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class ConnectedDevicesBuilder extends StatelessWidget {
  final List<BluetoothService> services;

  final VoidCallback turnOn;

  final VoidCallback turnOff;
  const ConnectedDevicesBuilder({
    Key? key,
    required this.services,
    required this.turnOn,
    required this.turnOff,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        List<Widget> containers = <Widget>[];
        for (BluetoothService service in services) {
          List<Widget> characteristicsWidget = <Widget>[];

          for (BluetoothCharacteristic characteristic in service.characteristics) {

            characteristicsWidget.add(
              GetBuilder<HomeController>(
                  init: Get.find<HomeController>(),
                  builder: (_) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(characteristic.uuid.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ...buildReadWriteNotifyButton(
                                characteristic: characteristic,
                                context: context,
                                writeController: _.writeController,
                                updateState: _.updateReadValue,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                  'Value: ${_.readValues[characteristic.uuid]}'),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  }),
            );
          }
          containers.add(
            ExpansionTile(
              title: Text(service.uuid.toString()),
              children: characteristicsWidget,
            ),
          );
        }

        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: turnOn,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: const Text('Scooter On'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: turnOff,
                      child: const Text('Scooter Off'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ...containers,
          ],
        );
      },
    );
  }
}

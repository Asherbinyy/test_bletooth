import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ble/Services/Scooter/ScooterActivity/Interface/scooter_activity.dart';
import 'package:flutter_ble/Services/Scooter/ScooterOperations/Implementation/imports_scooter_operation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

var key = "01";
List<ButtonTheme> buildReadWriteNotifyButton({
  required BluetoothCharacteristic characteristic,
  required BuildContext context,
  required void Function(Guid uuid, List<int> value) updateState,
  required TextEditingController writeController,
}) {

  List<ButtonTheme> buttons = <ButtonTheme>[];

  if (characteristic.properties.read) {
    buttons.add(
      ButtonTheme(
        minWidth: 10,
        height: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: TextButton(
            child: const Text('READ', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              var sub = characteristic.value.listen((value) {
                updateState(characteristic.uuid, value);
                // setState(() {
                //   widget.readValues[characteristic.uuid] = value;
                // });
              });
              await characteristic.read();
              sub.cancel();
            },
          ),
        ),
      ),
    );
  }
  if (characteristic.properties.write) {
    buttons.add(
      ButtonTheme(
        minWidth: 10,
        height: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ElevatedButton(
            child: const Text('WRITE', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Write"),
                      content: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: writeController,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Send"),
                          onPressed: () {
                             List<int> list = writeController.text.replaceAll('[', '').replaceAll(']', '').replaceAll("0x", "").split(',').map<int>((e) {
                                return int.parse(e,radix: 16); //use tryParse if you are not confirm all content is int or require other handling can also apply it here
                              }).toList();
                              print("write list=> : $list");

                            characteristic.write(
                              list,
                            );
                            // utf8.encode(writeController.value.text));
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text("light on"),
                          onPressed: () {
                              var data =  ScooterActivity.fromHex('A3A404${key}${key}6102020202').encode();
                              print("data=> $data");
                              inspect(data);
                              final List<int> lint = data.map((e)=>int.parse(e,radix: 16)).toList();
                              characteristic.write(
                                  lint
                              );
                              Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text("light off"),
                          onPressed: () {
                              var data =  ScooterActivity.fromHex('A3A404${key}${key}6101010101').encode();
                              print("data=> $data");
                              inspect(data);
                              final List<int> lint = data.map((e)=>int.parse(e,radix: 16)).toList();
                              characteristic.write(
                                  lint
                              );
                              Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text("Lock"),
                          onPressed: () {
                              var data =  ScooterActivity.fromHex('A3A404${key}${key}6101010101').encode();
                              print("data=> $data");
                              inspect(data);
                              final List<int> lint = data.map((e)=>int.parse(e,radix: 16)).toList();
                              characteristic.write(
                                  lint
                              );
                              Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text("Unlock"),
                          onPressed: () {
                              var data =  ScooterActivity.fromHex('A3A404${key}${key}0A01000000000000000000').encode();
                              print("data=> $data");
                              inspect(data);
                              final List<int> lint = data.map((e)=>int.parse(e,radix: 16)).toList();
                              characteristic.write(
                                  lint
                              );
                              Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text("send 0x01"),
                          onPressed: () {
                              List<int> list = "[A3,A4,08,50,1E,1F,57,2B,2A,48,2C,64,28,28,89]".replaceAll('[', '').replaceAll(']', '').replaceAll("0x", "").split(',').map<int>((e) {
                                return int.parse(e,radix: 16); //use tryParse if you are not confirm all content is int or require other handling can also apply it here
                              }).toList();
                            characteristic.write(
                              list,
                            );
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
  if (characteristic.properties.notify) {
    buttons.add(
      ButtonTheme(
        minWidth: 10,
        height: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ElevatedButton(
            child: const Text('NOTIFY', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              characteristic.value.listen((value) {
                List convertedNum = value.map((num) =>  num.toRadixString(16)).toList();
                var hexList = convertedNum.map((number){
                  if (number.length == 1) {
                    number = number.padLeft(2, '0');
                  }
                  return number;
                });
                final ScooterDataDecoder decode= ScooterDataDecoder(input: hexList.join().toUpperCase());

                print("converted => ${hexList.join().toUpperCase()}");
                key = decode.decode.key!;
                print("key => $key");
                updateState(characteristic.uuid, value);
                // setState(() {
                //   widget.readValues[characteristic.uuid] = value;
                // });
              });
              await characteristic.setNotifyValue(true);
            },
          ),
        ),
      ),
    );
  }

  return buttons;
}

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

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
                            characteristic.write(
                              [
                                0xA3,
                                0xA4,
                                0x08,
                                0x50,
                                0x1E,
                                0x1F,
                                0x51,
                                0x73,
                                0x70,
                                0x77,
                                0x49,
                                0x2A,
                                0x59,
                                0x46,
                                0x01,
                              ],
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
// logic.updateReadValues(characteristic.uuid, value);

// class ButtonAction extends StatefulWidget {
//   final BluetoothCharacteristic characteristic;
//
//   const ButtonAction({
//     Key? key,
//     required this.characteristic,
//   }) : super(key: key);
//
//   @override
//   State<ButtonAction> createState() => _ButtonActionState();
// }
//
// class _ButtonActionState extends State<ButtonAction> {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<HomeController>();
//     List<ButtonTheme> buttons = <ButtonTheme>[];
//     return GetBuilder<HomeController>(
//         init: controller,
//         builder: (logic) {
//           if (widget.characteristic.properties.read) {
//             buttons.add(
//               ButtonTheme(
//                 minWidth: 10,
//                 height: 20,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   child: TextButton(
//                     child: const Text('READ',
//                         style: TextStyle(color: Colors.white)),
//                     onPressed: () async {
//                       var sub = widget.characteristic.value.listen((value) {
//                         setState(() {
//                           logic.updateReadValue(
//                               widget.characteristic.uuid, value);
//                         });
//                       });
//                       await widget.characteristic.read();
//                       sub.cancel();
//                     },
//                   ),
//                 ),
//               ),
//             );
//           }
//           if (widget.characteristic.properties.write) {
//             buttons.add(
//               ButtonTheme(
//                 minWidth: 10,
//                 height: 20,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   child: ElevatedButton(
//                     child: const Text('WRITE',
//                         style: TextStyle(color: Colors.white)),
//                     onPressed: () async {
//                       await showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: const Text("Write"),
//                               content: Row(
//                                 children: <Widget>[
//                                   Expanded(
//                                     child: TextField(
//                                       controller: logic.writeController,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               actions: <Widget>[
//                                 TextButton(
//                                   child: const Text("Send"),
//                                   onPressed: () {
//                                     widget.characteristic.write(utf8.encode(
//                                         logic.writeController.value.text));
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                                 TextButton(
//                                   child: const Text("Cancel"),
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                               ],
//                             );
//                           });
//                     },
//                   ),
//                 ),
//               ),
//             );
//           }
//           if (widget.characteristic.properties.notify) {
//             buttons.add(
//               ButtonTheme(
//                 minWidth: 10,
//                 height: 20,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   child: ElevatedButton(
//                     child: const Text('NOTIFY',
//                         style: TextStyle(color: Colors.white)),
//                     onPressed: () async {
//                       widget.characteristic.value.listen((value) {
//                         setState(() {
//                           logic.updateReadValue(
//                               widget.characteristic.uuid, value);
//                         });
//                       });
//                       await widget.characteristic.setNotifyValue(true);
//                     },
//                   ),
//                 ),
//               ),
//             );
//           }
//
//           return buttons;
//         });
//   }
// }
//
// List<ButtonTheme> buttons(
//   BluetoothCharacteristic characteristic,
// ) {
//   final controller = Get.find<HomeController>();
//   GetBuilder<HomeController>(
//       init: controller,
//       builder: (logic) {
//         if (characteristic.properties.read) {
//           buttons.add(
//             ButtonTheme(
//               minWidth: 10,
//               height: 20,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 4),
//                 child: TextButton(
//                   child: const Text('READ',
//                       style: TextStyle(color: Colors.white)),
//                   onPressed: () async {
//                     var sub = characteristic.value.listen((value) {
//                       setState(() {
//                         logic.updateReadValue(
//                             characteristic.uuid, value);
//                       });
//                     });
//                     await characteristic.read();
//                     sub.cancel();
//                   },
//                 ),
//               ),
//             ),
//           );
//         }
//         if (characteristic.properties.write) {
//           buttons.add(
//             ButtonTheme(
//               minWidth: 10,
//               height: 20,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 4),
//                 child: ElevatedButton(
//                   child: const Text('WRITE',
//                       style: TextStyle(color: Colors.white)),
//                   onPressed: () async {
//                     await showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: const Text("Write"),
//                             content: Row(
//                               children: <Widget>[
//                                 Expanded(
//                                   child: TextField(
//                                     controller: logic.writeController,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             actions: <Widget>[
//                               TextButton(
//                                 child: const Text("Send"),
//                                 onPressed: () {
//                                   characteristic.write(utf8.encode(
//                                       logic.writeController.value.text));
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                               TextButton(
//                                 child: const Text("Cancel"),
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                             ],
//                           );
//                         });
//                   },
//                 ),
//               ),
//             ),
//           );
//         }
//         if (characteristic.properties.notify) {
//           buttons.add(
//             ButtonTheme(
//               minWidth: 10,
//               height: 20,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 4),
//                 child: ElevatedButton(
//                   child: const Text('NOTIFY',
//                       style: TextStyle(color: Colors.white)),
//                   onPressed: () async {
//                     characteristic.value.listen((value) {
//                       setState(() {
//                         logic.updateReadValue(
//                             characteristic.uuid, value);
//                       });
//                     });
//                     await characteristic.setNotifyValue(true);
//                   },
//                 ),
//               ),
//             ),
//           );
//         }
//
//         return buttons;
//       });
//  }

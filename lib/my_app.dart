import 'package:flutter/material.dart';
import 'package:flutter_ble/Home/presentation/pages/home_page.dart';
import 'package:flutter_ble/Services/Scooter/ScooterActivity/Implementation/scooter_init.dart';
import 'package:flutter_ble/Services/Scooter/ScooterActivity/Implementation/scooter_on.dart';
import 'package:flutter_ble/Services/Scooter/ScooterActivity/Interface/scooter_activity.dart';
import 'package:flutter_ble/Services/Scooter/ScooterOperations/Implementation/imports_scooter_operation.dart';
import 'package:flutter_ble/Services/Scooter/crc8.dart';
import 'package:flutter_ble/Services/Scooter/scooter_creator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final ScooterActivity activity = ScooterInit(key: "00");
    //
    //
    //
    // print("Input => ${activity.toString()} \n"
    //     "Encode => ${ScooterOperations().encode(activity)}");
    //
    // const String decodeData =
    //     'A3A408501e1f572b2a482c642828';
    //[A3,A4,08,50,1e,1f,57,2b,2a,48,2c,64,28,28]
    // print(""
    //     "Decode => ${ScooterOperations().decode(decodeData)}");
    final array = [
      0xA3,
      0xA4,
      0x08,
      0x50,
      0x1e,
      0x1f,
      0x57,
      0x2b,
      0x2a,
      0x48,
      0x2c,
      0x64,
      0x28,
      0x28
    ];
    final op = ScooterCreator().init('00').encode();
    final operation = CrC().computeCRC(array);
    print('op => ${op.toString()}');
    print('operation => ${operation.toString()}');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Bluetooth',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // home:    ProductPage(product: Product.example()),
    );
  }
}

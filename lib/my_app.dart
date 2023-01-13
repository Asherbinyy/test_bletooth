import 'package:flutter/material.dart';
import 'package:flutter_ble/Core/Helper/hex_helper.dart';
import 'package:flutter_ble/Home/presentation/pages/home_page.dart';
import 'package:flutter_ble/Services/Scooter/ScooterActivity/Interface/scooter_activity.dart';
import 'package:flutter_ble/Services/Scooter/ScooterOperations/Implementation/imports_scooter_operation.dart';
import 'package:flutter_ble/Services/Scooter/crc.dart';
import 'package:flutter_ble/Services/Scooter/scooter_creator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final array = [
      'A3', 'A4', '08', '50', '1e', '1f', '57', '2b', '2a', '48', '2c', '64', '28', '28'
    ];

    ScooterActivity.fromHex('A3A408501E1F572B2A482C64282889');
     final ScooterDataDecoder decode= ScooterDataDecoder(input: 'a3a401468c041639');
      print('decode => ${decode.decode}');
    // final operation = CrC().computeCRC(array);
    // print('op => ${op.toString()}');
    // print('operation => ${operation.toString()}');
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

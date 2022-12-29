import 'package:flutter/material.dart';
import 'package:flutter_ble/Home/presentation/pages/home_page.dart';
import 'package:flutter_ble/Services/Scooter/ScooterActivity/Implementation/scooter_init.dart';
import 'package:flutter_ble/Services/Scooter/ScooterActivity/Implementation/scooter_on.dart';
import 'package:flutter_ble/Services/Scooter/ScooterActivity/Interface/scooter_activity.dart';
import 'package:flutter_ble/Services/Scooter/ScooterOperations/Implementation/imports_scooter_operation.dart';
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
    //
    // print(""
    //     "Decode => ${ScooterOperations().decode(decodeData)}");
    final op = ScooterCreator().init('00').encode();

    print('op => ${op.toString()}');
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

import 'package:flutter/material.dart';
import 'package:flutter_ble/Home/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
     title: 'Test Bluetooth',
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage( ),
  );
}

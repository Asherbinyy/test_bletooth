import 'package:flutter/material.dart';
import 'package:flutter_ble/Home/presentation/manager/home_controller.dart';
import 'package:flutter_ble/Home/presentation/widgets/available_devices_builder.dart';
import 'package:flutter_ble/Home/presentation/widgets/connected_devices_builder.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth Discovery"),
      ),
      body: GetBuilder<HomeController>(
          init: homeController,
          builder: (_) {
            return (_.connectedDevice != null)
                ? ConnectedDevicesBuilder(
                    services: _.services,
                  )
                : AvailableDevicesBuilder(
                    devicesList: _.devicesList,
                    onConnectionPressed: (dev) async {
                      await _.connectDevice(dev);
                    },
                  );
          }),
    );
  }
}

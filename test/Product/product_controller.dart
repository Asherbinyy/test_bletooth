// import 'package:flutter_ble/Product/Product_model.dart';
// import 'package:get/get.dart';
//
// class ProductController extends GetxController {
//   final Product product;
//   ProductController({required this.product});
//
//   final _selectedValue = <int, int>{};
//
//   Map<int, int> get selectedValue => _selectedValue;
//
//   void onRadioChanged(int? value, int? groupValue) {
//      if (value != null && groupValue != null) {
//       _selectedValue[groupValue] = value;
//     }
//
//     update();
//      print('updated value: $value, groupValue: $groupValue');
//
//   }
//
//
//   List <int> selectedIds = [];
//   void submit() {
//     selectedIds.clear();
//
//     if (selectedIds.isEmpty){
//       for (var element in selectedValue.entries) {
//
//         selectedIds.add(element.value);
//       }
//       print('selectedIds: $selectedIds');
//
//       print('selectedValue: $selectedValue');
//
//     }
//
//   }
// }
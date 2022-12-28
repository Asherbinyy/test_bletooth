// import 'package:flutter/material.dart';
// import 'package:flutter_ble/Product/Product_model.dart';
// import 'package:flutter_ble/Product/product_controller.dart';
// import 'package:get/get.dart';
//
// class ProductPage extends StatelessWidget {
//   final Product product;
//
//   const ProductPage({
//     Key? key,
//     required this.product,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final productController = Get.put(ProductController(product: product));
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             /// List of Radio Buttons
//             Expanded(
//               child: GetBuilder<ProductController>(
//                   init: productController,
//                   builder: (_) {
//                     return Column(
//                       children: [
//                         Expanded(
//                           child: ListView.builder(
//                             itemCount: _.product.specfications?.length,
//                             itemBuilder: (context, index) {
//                               final specfication =
//                                   _.product.specfications?[index];
//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text(specfication?.name ?? ''),
//                                   ...List.generate(
//                                     specfication
//                                             ?.valueSpecficationModels?.length ??
//                                         0,
//                                     (index) => RadioListTile(
//                                       title: Text(
//                                         specfication
//                                                 ?.valueSpecficationModels?[
//                                                     index]
//                                                 .name ??
//                                             '',
//                                       ),
//                                       value: specfication
//                                           ?.valueSpecficationModels?[index].id,
//                                       groupValue:
//                                           _.selectedValue[specfication?.id],
//                                       onChanged: (value) {
//                                         _.onRadioChanged(
//                                             value, specfication?.id);
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//
//                         /// Button
//                         ElevatedButton(
//                           onPressed: () {
//
//                             _.submit();
//                           },
//                           child: const Text('Submit'),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

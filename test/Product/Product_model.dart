// class Product {
//   Product({
//     this.id,
//     this.orderId,
//     this.providerId,
//     this.images,
//     this.details,
//     this.userName,
//     this.categoryName,
//     this.name,
//     this.price,
//     this.percentTax,
//     this.sizeName,
//     this.subscribers,
//     this.specfications,
//     this.quarters,
//   });
//
//   int? id;
//   int? orderId;
//   String? providerId;
//   List<String>? images;
//   String? details;
//   String? userName;
//   String? categoryName;
//   String? name;
//   int? price;
//   int? percentTax;
//   String? sizeName;
//   List<String>? subscribers;
//   List<Specfication>? specfications;
//   List<Quarter>? quarters;
//
//   Product.example() {
//     id = 1;
//     orderId = 1;
//     providerId = '1';
//     images = ['1', '2'];
//     details = 'details';
//     userName = 'userName';
//     categoryName = 'categoryName';
//     name = 'name';
//     price = 1;
//     percentTax = 1;
//     sizeName = 'sizeName';
//     subscribers = ['1', '2'];
//     specfications =  Specfication.examples   ;
//     quarters = [Quarter.example()];
//   }
//
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     orderId = json["orderId"];
//     providerId = json["providerId"];
//     images = List<String>.from(json["images"].map((x) => x));
//     details = json["details"];
//     userName = json["userName"];
//     categoryName = json["categoryName"];
//     name = json["name"];
//     price = json["price"];
//     percentTax = json["percentTax"];
//     sizeName = json["sizeName"];
//     subscribers = List<String>.from(json["subscribers"].map((x) => x));
//     specfications = List<Specfication>.from(
//         json["specfications"].map((x) => Specfication.fromJson(x)));
//     quarters =
//         List<Quarter>.from(json["quarters"].map((x) => Quarter.fromJson(x)));
//   }
// }
//
// class Quarter {
//   Quarter({
//     this.id,
//     this.name,
//     this.percent,
//     this.active,
//   });
//
//   int? id;
//   String? name;
//   int? percent;
//   bool? active;
//
//   Quarter.example() {
//     id = 1;
//     name = 'name';
//     percent = 1;
//     active = true;
//   }
//
//   Quarter.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     percent = json["percent"];
//     active = json["active"];
//   }
// }
//
// class Specfication {
//   Specfication({
//     this.id,
//     this.name,
//     this.valueSpecficationModels,
//   });
//
//   int? id;
//   String? name;
//   List<ValueSpecficationModel>? valueSpecficationModels;
//
//   factory Specfication.fromJson(Map<String, dynamic> json) => Specfication(
//         id: json["id"],
//         name: json["name"],
//         valueSpecficationModels: List<ValueSpecficationModel>.from(
//             json["valueSpecficationModels"]
//                 .map((x) => ValueSpecficationModel.fromJson(x))),
//       );
//
//   // list of Specfication objects
//   static List<Specfication> examples = [
//     Specfication(
//       id: 1,
//       name: 'تقطيع',
//       valueSpecficationModels: [
//         ValueSpecficationModel(
//           id: 1,
//           name: 'رأس',
//           price: 100,
//         ),
//         ValueSpecficationModel(
//           id: 2,
//           name: 'جسم',
//           price: 200,
//         ),
//         ValueSpecficationModel(
//           id: 3,
//           name: 'رجل',
//           price: 300,
//         ),
//       ],
//     ),
//     Specfication(
//       id: 2,
//       name: 'اللون',
//       valueSpecficationModels: [
//         ValueSpecficationModel(
//           id: 4,
//           name: 'أحمر',
//           price: 100,
//         ),
//         ValueSpecficationModel(
//           id: 5,
//           name: 'أخضر',
//           price: 200,
//         ),
//         ValueSpecficationModel(
//           id: 6,
//           name: 'أزرق',
//           price: 300,
//         ),
//       ],
//     ),
//     Specfication(
//       id: 3,
//       name: 'الحجم',
//       valueSpecficationModels: [
//         ValueSpecficationModel(
//           id: 7,
//           name: 'صغير',
//           price: 100,
//         ),
//         ValueSpecficationModel(
//           id: 8,
//           name: 'متوسط',
//           price: 200,
//         ),
//         ValueSpecficationModel(
//           id: 9,
//           name: 'كبير',
//           price: 300,
//         ),
//       ],
//     ),
//   ];
// }
//
// class ValueSpecficationModel {
//   ValueSpecficationModel({
//     this.id,
//     this.name,
//     this.price,
//   });
//
//   int? id;
//   String? name;
//   int? price;
//
//   ValueSpecficationModel.example() {
//     id = 1;
//     name = 'name';
//     price = 1;
//   }
//
//   ValueSpecficationModel.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     price = json["price"];
//   }
// }
//
// //{
// //     "id": 35,
// //     "orderId": 48,
// //     "providerId": "a2fcd7da-ae26-4788-8ddb-601b6af48fa1",
// //     "images": [
// //         "https://eight-quarter.ip4s.com/images/Users/eaef32aca1eb4bef8d31d9110289a72e.jfif"
// //     ],
// //     "details": "ges",
// //     "userName": "ahmed",
// //     "categoryName": "تيس",
// //     "name": "asp",
// //     "price": 1000,
// //     "percentTax": 10,
// //     "sizeName": "asd",
// //     "subscribers": [
// //         "https://eight-quarter.ip4s.com/images/Users/blackImg.png"
// //     ],
// //     "specfications": [
// //         {
// //             "id": 103,
// //             "name": "تقطيع",
// //             "valueSpecficationModels": [
// //                 {
// //                     "id": 197,
// //                     "name": "راس",
// //                     "price": 1000
// //                 },
// //                 {
// //                     "id": 198,
// //                     "name": "لحم",
// //                     "price": 1000
// //                 }
// //             ]
// //         },
// //         {
// //             "id": 104,
// //             "name": "مشاوي",
// //             "valueSpecficationModels": [
// //                 {
// //                     "id": 199,
// //                     "name": "مان",
// //                     "price": 1000
// //                 },
// //                 {
// //                     "id": 200,
// //                     "name": "سري",
// //                     "price": 1000
// //                 }
// //             ]
// //         },
// //         {
// //             "id": 105,
// //             "name": "الراس",
// //             "valueSpecficationModels": [
// //                 {
// //                     "id": 201,
// //                     "name": "نص",
// //                     "price": 1000
// //                 },
// //                 {
// //                     "id": 202,
// //                     "name": "ربع",
// //                     "price": 1000
// //                 }
// //             ]
// //         }
// //     ],
// //     "quarters": [
// //         {
// //             "id": 53,
// //             "name": "ربع",
// //             "percent": 25,
// //             "active": true
// //         },
// //         {
// //             "id": 54,
// //             "name": "ربع",
// //             "percent": 25,
// //             "active": false
// //         },
// //         {
// //             "id": 55,
// //             "name": "نصف",
// //             "percent": 50,
// //             "active": false
// //         }
// //     ]
// // }

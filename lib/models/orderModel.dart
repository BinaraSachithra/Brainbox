import 'package:lakshapathi/models/ShopModel.dart';

class OrderModel {
  final String id;
  final String userName;
  final String userContact;
  final String contactName;
  final String address1;
  final String address2;
  final String town;
  final String city;
  final String postalCode;
  final List<FoodItemModel> cart;
  final String paymentMethod;
  final DateTime orderDate;

  OrderModel({
    required this.id,
    required this.userName,
    required this.userContact,
    required this.contactName,
    required this.address1,
    required this.address2,
    required this.town,
    required this.city,
    required this.postalCode,
    required this.cart,
    required this.paymentMethod,
    required this.orderDate,
  });

  factory OrderModel.fromMap(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userName: json['userName'],
      userContact: json['userContact'],
      contactName: json['contactName'],
      address1: json['address1'],
      address2: json['address2'],
      town: json['town'],
      city: json['city'],
      postalCode: json['postalCode'],
      cart: (json['cart'] as List)
          .map((item) => FoodItemModel.fromJson(item))
          .toList(),
      paymentMethod: json['paymentMethod'],
      orderDate: DateTime.parse(json['orderDate']),
    );
  }

  get deliveryDate => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userContact': userContact,
      'contactName': contactName,
      'address1': address1,
      'address2': address2,
      'town': town,
      'city': city,
      'postalCode': postalCode,
      'cart': cart.map((item) => item.toJson()).toList(),
      'paymentMethod': paymentMethod,
      'orderDate': orderDate.toIso8601String(),
    };
  }
}

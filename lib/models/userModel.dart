import 'package:lakshapathi/models/ShopModel.dart';

class UserModel {
  String firstname;
  String lastname;
  String email;
  String phone;
  String uid;
  String createdAt;
  // FarmerModel? farmer;
  // ConsumerModel? consumer;
  // RiderModel? rider;

  UserModel({
    required this.phone,
    required this.uid,
    required this.createdAt,
    required this.firstname,
    required this.lastname,
    required this.email,
    // this.farmer,
    // this.consumer,
    // this.rider,
  });

//from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phone: map['phone'] ?? '',
      uid: map['uid'] ?? '',
      createdAt: map['createdAt'] ?? '',
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      email: map['email'] ?? '',
      // farmer: FarmerModel.fromMap(map['farmer']),
      // consumer: ConsumerModel.fromMap(map['consumer']),
      // rider: RiderModel.fromMap(map['rider']),
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'createdAt': createdAt,
      'uid': uid,
      // 'farmer': farmer!.toMap(),
      // 'consumer': consumer!.toMap(),
      // 'rider': rider!.toMap(),
    };
  }
}

class FarmerModel {
  ProductModel products;
  // OrdersModel orders;
  FarmerModel({
    required this.products,
    // required this.orders,
  });

  Map<String, dynamic> toMap() {
    return {
      'products': products.toMap(),
    };
  }

  factory FarmerModel.fromMap(Map<String, dynamic> map) {
    return FarmerModel(
      products: ProductModel.fromMap(map['products']),
    );
  }
}

class ConsumerModel {
  ProductModel products;
  // OrdersModel orders;
  ConsumerModel({
    required this.products,
    // required this.orders,
  });

  Map<String, dynamic> toMap() {
    return {
      'products': products.toMap(),
    };
  }

  factory ConsumerModel.fromMap(Map<String, dynamic> map) {
    return ConsumerModel(
      products: ProductModel.fromMap(map['products']),
    );
  }
}

class RiderModel {
  ProductModel products;
  // OrdersModel orders;
  RiderModel({
    required this.products,
    // required this.orders,
  });

  Map<String, dynamic> toMap() {
    return {
      'products': products.toMap(),
    };
  }

  factory RiderModel.fromMap(Map<String, dynamic> map) {
    return RiderModel(
      products: ProductModel.fromMap(map['products']),
    );
  }
}

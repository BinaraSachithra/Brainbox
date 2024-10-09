import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String shop;
  final String url;
  final String rate;
  final String count;
  final List<FoodItemModel> foodItems;

  ProductModel({
    required this.shop,
    required this.url,
    required this.rate,
    required this.count,
    required this.foodItems,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    List<FoodItemModel> foodItems = [];
    if (json['foodItems'] != null) {
      foodItems = List<FoodItemModel>.from(
          json['foodItems'].map((item) => FoodItemModel.fromMap(item)));
    }
    return ProductModel(
      shop: json['shop'],
      url: json['url'],
      rate: json['rate'],
      count: json['count'],
      foodItems: foodItems,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'shop': shop,
      'url': url,
      'rate': rate,
      'count': count,
    };
  }
}

class ShopModel {
  final String id;
  final String shop;
  final String url;
  final String rate;
  final String count;
  final List<FoodItemModel> foodItems;

  ShopModel({
    required this.id,
    required this.shop,
    required this.url,
    required this.rate,
    required this.count,
    required this.foodItems,
  });
  factory ShopModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return ShopModel(
      id: snapshot.id, // Assign document ID here
      shop: data['shop'],
      url: data['url'],
      rate: data['rate'],
      count: data['count'],
      foodItems: List<FoodItemModel>.from(
          data['foodItems'].map((item) => FoodItemModel.fromJson(item))),
    );
  }
}

class FoodItemModel {
  final String title;
  final String price;
  final String count;
  final String url;

  FoodItemModel({
    required this.title,
    required this.price,
    required this.count,
    required this.url,
  });

  factory FoodItemModel.fromMap(Map<String, dynamic> json) {
    return FoodItemModel(
      title: json['title'],
      price: json['price'],
      count: json['count'],
      url: json['url'],
    );
  }
  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'count': count,
        'url': url,
      };

  factory FoodItemModel.fromJson(Map<String, dynamic> json) {
    return FoodItemModel(
      title: json['title'],
      price: json['price'],
      count: json['count'],
      url: json['url'],
    );
  }
}

class AppointmentModel {
  final DateTime date;
  final TimeOfDay time;
  final List<FoodItemModel> cart;

  AppointmentModel(
      {required this.date, required this.time, required this.cart});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      date: DateTime.parse(json['date']),
      time: TimeOfDay(
        hour: json['time']['hour'],
        minute: json['time']['minute'],
      ),
      cart: (json['cart'] as List)
          .map((item) => FoodItemModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'time': {
        'hour': time.hour,
        'minute': time.minute,
      },
      'cart': cart.map((item) => item.toJson()).toList(),
    };
  }
}

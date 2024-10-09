import 'package:cloud_firestore/cloud_firestore.dart';

class Advertisement {
  String? uid;
  String? title;
  String? unit;
  double? unitPrice;
  double? bulkPrice;
  double? unitsPerBulk;
  int? clicks;
  double? sales;
  String? imageUrl;
  DateTime? expirationDate;

  Advertisement({
    this.uid,
    this.title,
    this.unit,
    this.unitPrice,
    this.bulkPrice,
    this.unitsPerBulk,
    this.imageUrl,
    this.clicks,
    this.sales,
    this.expirationDate,
  });

  factory Advertisement.fromMap(Map<String, dynamic> data) {
    return Advertisement(
      uid: data['uid'],
      title: data['title'],
      unit: data['unit'],
      unitPrice: (data['unitPrice'] is int)
          ? (data['unitPrice'] as int).toDouble()
          : data['unitPrice'],
      bulkPrice: (data['bulkPrice'] is int)
          ? (data['bulkPrice'] as int).toDouble()
          : data['bulkPrice'],
      unitsPerBulk: (data['unitsPerBulk'] is int)
          ? (data['unitsPerBulk'] as int).toDouble()
          : data['unitsPerBulk'],
      imageUrl: data['imageUrl'],
      clicks: (data['clicks'] is double)
          ? (data['clicks'] as double).toInt()
          : data['clicks'],
      sales: (data['sales'] is int)
          ? (data['sales'] as int).toDouble()
          : data['sales'],
      expirationDate: (data['expirationDate'] is Timestamp)
          ? (data['expirationDate'] as Timestamp).toDate()
          : data['expirationDate'],
    );
  }
}

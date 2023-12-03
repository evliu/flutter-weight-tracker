import 'package:cloud_firestore/cloud_firestore.dart';

class WeightItem {
  String? id;
  String dateTime;
  double weight;
  String userId;

  WeightItem({
    this.id,
    String? dateTime,
    required this.weight,
    required this.userId,
  }) : dateTime = dateTime ?? DateTime.now().toString();

  @override
  String toString() {
    return 'Weight Item - ID: $id, Date Time: $dateTime, Weight: $weight, User ID: $userId';
  }
}

/// A WeightItem that can be converted to and from Firestore
class FirebaseWeightItem extends WeightItem {
  FirebaseWeightItem({
    super.id,
    super.dateTime,
    required super.weight,
    required super.userId,
  });

  factory FirebaseWeightItem.fromMap(Map<String, dynamic> data, String id) {
    return FirebaseWeightItem(
      id: id,
      dateTime: data['dateTime'],
      weight: data['weight'],
      userId: data['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime,
      'weight': weight,
      'userId': userId,
    };
  }

  /// Convert a WeightItem into a Map<String, dynamic> for Firestore
  Map<String, Object?> toJson() {
    return {
      'dateTime': Timestamp.fromDate(DateTime.parse(dateTime)),
      'weight': weight,
      'userId': userId,
    };
  }

  /// Create a WeightItem from a Map<String, dynamic> from Firestore
  FirebaseWeightItem.fromJson(Map<String, Object?> json)
      : this(
          dateTime: json['dateTime'] as String,
          weight: json['weight']! as double,
          userId: json['userId']! as String,
        );
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../weight/weight_item.dart';
import 'store_service.dart';

class FirestoreService implements StoreService {
  final collection = 'weight-items';
  final _db = FirebaseFirestore.instance;

  @override
  late String userId;

  @override
  void addWeightItemsSnapshopListener(
      void Function(List<WeightItem>) callback) {
    _db
        .collection(collection)
        // .where('userId', isEqualTo: userId) // if we were to permission against the user
        .orderBy('dateTime', descending: true)
        .snapshots()
        .listen(
          (snapshot) => callback(
            snapshot.docs
                .map(
                  (doc) => WeightItem(
                    id: doc.id,
                    dateTime: doc['dateTime'],
                    weight: doc['weight'].toDouble(),
                    userId: doc['userId'],
                  ),
                )
                .toList(),
          ),
        );
  }

  @override
  Future<List<WeightItem>> getWeightItems() {
    return _db
        .collection(collection)
        // .where('userId', isEqualTo: userId) // if we were to permission against the user
        .orderBy('dateTime', descending: true)
        .get()
        .then(
          (snapshot) => snapshot.docs
              .map(
                (doc) => WeightItem(
                  id: doc.id,
                  dateTime: doc['dateTime'],
                  weight: doc['weight'].toDouble(),
                  userId: doc['userId'],
                ),
              )
              .toList(),
        );
  }

  @override
  Future<void> addWeightItem(WeightItem item) async {
    await _db.collection(collection).add({
      'dateTime': item.dateTime,
      'weight': item.weight,
      'userId': item.userId,
    });
  }

  @override
  Future<void> deleteWeightItem(String id) async {
    await _db.collection(collection).doc(id).delete();
  }

  @override
  Future<void> updateWeightItem(WeightItem item) async {
    await _db.collection(collection).doc(item.id).update({
      'dateTime': item.dateTime,
      'weight': item.weight,
      'userId': item.userId,
    });
  }
}

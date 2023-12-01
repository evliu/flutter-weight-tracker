import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jasper_weight_tracker/src/store/store_service.dart';
import 'package:jasper_weight_tracker/src/weight/weight_item.dart';

class FirestoreService implements StoreService {
  final _db = FirebaseFirestore.instance;

  @override
  late String userId;

  @override
  Future<List<WeightItem>> getWeightItems() {
    return _db
        .collection('weight_items')
        .where('userId', isEqualTo: userId)
        .get()
        .then((snapshot) => snapshot.docs
            .map(
              (doc) => WeightItem(
                id: doc.id,
                dateTime: doc['dateTime'],
                weight: doc['weight'],
                userId: doc['userId'],
              ),
            )
            .toList());
  }

  @override
  Future<void> addWeightItem(WeightItem item) async {
    await _db.collection('weight_items').add({
      'dateTime': item.dateTime,
      'weight': item.weight,
      'userId': item.userId,
    });

    getWeightItems();
  }

  @override
  Future<void> deleteWeightItem(WeightItem item) async {
    await _db.collection('weight_items').doc(item.id).delete();

    getWeightItems();
  }

  @override
  Future<void> updateWeightItem(WeightItem item) async {
    await _db.collection('weight_items').doc(item.id).update({
      'dateTime': item.dateTime,
      'weight': item.weight,
      'userId': item.userId,
    });

    getWeightItems();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../weight/weight_item.dart';
import 'store_service.dart';

class FirestoreService implements StoreService {
  static final parser = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse;
  static final displayFormater = DateFormat('M/d/yyyy\nh:mm:ssa').format;

  final _db = FirebaseFirestore.instance;

  @override
  late String userId;

  @override
  Future<List<WeightItem>> getWeightItems() {
    return _db
        .collection('weight_items')
        // .where('userId', isEqualTo: userId) // if we were to permission against the user
        .orderBy('dateTime', descending: true)
        .get()
        .then(
          (snapshot) => snapshot.docs
              .map(
                (doc) => WeightItem(
                  id: doc.id,
                  dateTime: displayFormater(parser(doc['dateTime'])),
                  weight: doc['weight'],
                  userId: doc['userId'],
                ),
              )
              .toList(),
        );
  }

  @override
  Future<void> addWeightItem(WeightItem item) async {
    await _db.collection('weight_items').add({
      'dateTime': item.dateTime,
      'weight': item.weight,
      'userId': item.userId,
    });
  }

  @override
  Future<void> deleteWeightItem(String id) async {
    await _db.collection('weight_items').doc(id).delete();
  }

  @override
  Future<void> updateWeightItem(WeightItem item) async {
    await _db.collection('weight_items').doc(item.id).update({
      'dateTime': item.dateTime,
      'weight': item.weight,
      'userId': item.userId,
    });
  }
}

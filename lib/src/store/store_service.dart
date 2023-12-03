import '../weight/weight_item.dart';

/// Abstract class for the StoreService using WeightItem as the model

abstract class StoreService {
  late String userId;

  /// Returns a list of WeightItems
  Future<List<WeightItem>> getWeightItems();

  /// Adds a WeightItem to the store
  Future<void> addWeightItem(WeightItem item);

  /// Updates a WeightItem in the store
  Future<void> updateWeightItem(WeightItem item) async {}

  /// Deletes a WeightItem from the store
  Future<void> deleteWeightItem(String id) async {}
}

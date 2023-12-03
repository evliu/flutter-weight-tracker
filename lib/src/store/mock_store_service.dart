import 'package:flutter/material.dart';

import 'store_service.dart';
import '../weight/weight_item.dart';

var mockWeightItems = [
  WeightItem(id: '1', dateTime: '2/2/2002', weight: 234.0, userId: '12345'),
  WeightItem(id: '2', dateTime: '2/2/2002', weight: 234.0, userId: '12345'),
  WeightItem(id: '3', dateTime: '3/3/2023', weight: 345.0, userId: '12345'),
  WeightItem(id: '4', dateTime: '1/1/2000', weight: 123.0, userId: '12345'),
  // WeightItem(id: '5', dateTime: '2/2/2002', weight: 234.0, userId: '12345'),
  // WeightItem(id: '6', dateTime: '3/3/2023', weight: 345.0, userId: '12345'),
  // WeightItem(id: '7', dateTime: '1/1/2000', weight: 123.0, userId: '12345'),
  // WeightItem(id: '8', dateTime: '2/2/2002', weight: 234.0, userId: '12345'),
  // WeightItem(id: '9', dateTime: '3/3/2023', weight: 345.0, userId: '12345'),
  // WeightItem(id: '10', dateTime: '1/1/2000', weight: 123.0, userId: '12345'),
  // WeightItem(id: '11', dateTime: '2/2/2002', weight: 234.0, userId: '12345'),
  // WeightItem(id: '12', dateTime: '3/3/2023', weight: 345.0, userId: '12345'),
  // WeightItem(id: '13', dateTime: '1/1/2000', weight: 123.0, userId: '12345'),
  // WeightItem(id: '14', dateTime: '2/2/2002', weight: 234.0, userId: '12345'),
  // WeightItem(id: '15', dateTime: '3/3/2023', weight: 345.0, userId: '12345'),
  // WeightItem(id: '16', dateTime: '1/1/2000', weight: 123.0, userId: '12345'),
  // WeightItem(id: '17', dateTime: '2/2/2002', weight: 234.0, userId: '12345'),
  // WeightItem(id: '18', dateTime: '3/3/2023', weight: 345.0, userId: '12345'),
  // WeightItem(id: '19', dateTime: '1/1/2000', weight: 123.0, userId: '12345'),
  // WeightItem(id: '20', dateTime: '2/2/2002', weight: 234.0, userId: '12345'),
  // WeightItem(id: '21', dateTime: '3/3/2023', weight: 345.0, userId: '12345'),
  // WeightItem(id: '22', dateTime: '1/1/2000', weight: 123.0, userId: '12345'),
  // WeightItem(id: '23', dateTime: '2/2/2002', weight: 234.0, userId: '12345'),
  // WeightItem(id: '24', dateTime: '3/3/2023', weight: 345.0, userId: '12345'),
  // WeightItem(id: '25', dateTime: '1/1/2000', weight: 123.0, userId: '12345'),
  // WeightItem(id: '26', dateTime: '2/2/2002', weight: 234.0, userId: '12345'),
  // WeightItem(id: '27', dateTime: '3/3/2023', weight: 345.0, userId: '12345'),
];

class MockStoreService implements StoreService {
  @override
  late String userId;

  @override
  Future<List<WeightItem>> getWeightItems() async {
    return mockWeightItems;
  }

  @override
  Future<void> addWeightItem(WeightItem item) async {
    print('Adding new weight item');
    item.id = mockWeightItems.length.toString();

    mockWeightItems.add(item);

    await getWeightItems();
    // mockWeightItems.forEach(print);
  }

  @override
  Future<void> deleteWeightItem(String id) async {
    mockWeightItems.remove(mockWeightItems.firstWhere((el) => el.id == id));
  }

  @override
  Future<void> updateWeightItem(WeightItem item) async {
    final index = mockWeightItems.indexWhere((el) => el.id == item.id);
    if (index != -1) {
      mockWeightItems[index] = item;
    }
  }
}

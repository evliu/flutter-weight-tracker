import 'package:flutter/material.dart';

import '../weight/weight_item.dart';
import 'store_service.dart';

class StoreController with ChangeNotifier {
  StoreController(this._storeService);

  final StoreService _storeService;

  late List<WeightItem> _weightItems;

  List<WeightItem> get weightItems => _weightItems;

  Future<void> loadWeightItems() async {
    _weightItems = await _storeService.getWeightItems();

    notifyListeners();
  }

  Future<void> addStore(WeightItem item) async {
    _weightItems.add(item);

    notifyListeners();

    return _storeService.addWeightItem(item);
  }

  Future<void> updateStore(WeightItem item) async {
    final index = _weightItems.indexWhere((s) => s.id == item.id);

    _weightItems[index] = item;

    notifyListeners();

    return _storeService.updateWeightItem(item);
  }

  Future<void> deleteStore(WeightItem item) async {
    _weightItems.remove(item);

    notifyListeners();

    return _storeService.deleteWeightItem(item);
  }
}

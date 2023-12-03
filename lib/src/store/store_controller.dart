import 'package:flutter/foundation.dart';

import '../weight/weight_item.dart';
import 'store_service.dart';

class StoreController with ChangeNotifier {
  StoreController(this._storeService) {
    loadWeightItems();
  }

  final StoreService _storeService;
  late List<WeightItem> _weightItems = [];
  List<WeightItem> get weightItems => _weightItems;

  Future<void> loadWeightItems() async {
    _weightItems = await _storeService.getWeightItems();
    notifyListeners();
  }

  Future<void> addWeightItem(WeightItem item) async {
    await _storeService.addWeightItem(item);
    await loadWeightItems();
    notifyListeners();
  }

  Future<void> updateWeightItem(WeightItem item) async {
    await _storeService.updateWeightItem(item);
    await loadWeightItems();
    notifyListeners();
  }

  Future<void> deleteWeightItem(String id) async {
    await _storeService.deleteWeightItem(id);
    await loadWeightItems();

    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';

import '../weight/weight_item.dart';
import 'store_service.dart';

class StoreController with ChangeNotifier {
  StoreController(this._storeService) {
    loadWeightItems();
  }

  final StoreService _storeService;
  late List<WeightItem> _weightItems;
  List<WeightItem> get weightItems => _weightItems;

  Future<void> loadWeightItems() async {
    _weightItems = await _storeService.getWeightItems();

    notifyListeners();
  }

  Future<void> addWeightItem(WeightItem item) async {
    _weightItems.add(item);
    await _storeService.addWeightItem(item);
    await loadWeightItems();
    notifyListeners();
  }

  Future<void> updateWeightItem(WeightItem item) async {
    final index = _weightItems.indexWhere((s) => s.id == item.id);

    _weightItems[index] = item;

    await _storeService.updateWeightItem(item);
    await loadWeightItems();
    notifyListeners();
  }

  Future<void> deleteWeightItem(WeightItem item) async {
    _weightItems.remove(item);

    await _storeService.deleteWeightItem(item);
    await loadWeightItems();
    notifyListeners();
  }
}

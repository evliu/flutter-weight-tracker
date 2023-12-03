import 'package:flutter/material.dart';

import 'weight_item.dart';
import 'weight_list_tile_view.dart';

class WeightList extends StatelessWidget {
  WeightList({
    super.key,
    required this.items,
    void Function(String id, WeightItem item)? updateWeightItem,
    void Function(String id)? deleteWeightItem,
  })  : updateWeightItem =
            updateWeightItem ?? ((String id, WeightItem item) => {}),
        deleteWeightItem = deleteWeightItem ?? ((String id) => {});

  final List<WeightItem> items;

  final void Function(String id, WeightItem item) updateWeightItem;
  final void Function(String id) deleteWeightItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue[200]!, Colors.blue[700]!],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          restorationId: 'weightItemListView',
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];

            return WeightListTile(
              weight: item.weight,
              dateTime: item.dateTime,
            );
          },
        ),
      ),
    );
  }
}

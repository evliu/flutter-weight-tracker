import 'package:flutter/material.dart';

import 'weight_item.dart';
import 'weight_item_tile.dart';

class WeightList extends StatelessWidget {
  const WeightList({
    super.key,
    required this.items,
    required this.updateWeightItem,
    required this.deleteWeightItem,
  });

  final List<WeightItem> items;

  final void Function(WeightItem item) updateWeightItem;
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

            return WeightItemCard(
              weightItem: item,
              onDelete: () async => deleteWeightItem(item.id!),
              onUpdate: (double newWeight) async {
                updateWeightItem(
                  WeightItem(
                    id: item.id,
                    dateTime: item.dateTime,
                    weight: newWeight,
                    userId: item.userId,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

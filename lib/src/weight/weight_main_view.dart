import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'weight_item.dart';
import 'weight_list_view.dart';

/// Displays a list of WeightItems. This is the main view
class WeightItemListView extends StatelessWidget {
  static const routeName = '/';

  WeightItemListView({
    super.key,
    this.items = const <WeightItem>[],
    this.logout,
    this.addWeightItem,
    this.updateWeightItem,
    this.deleteWeightItem,
  });

  void Function()? logout;

  final List<WeightItem> items;
  void Function(double weight)? addWeightItem;
  void Function(WeightItem item)? updateWeightItem;
  void Function(WeightItem item)? deleteWeightItem;

  final addTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jasper Weight Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white70),
            onPressed: logout,
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[800]!, Colors.blue[600]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: WeightList(items: items),
      floatingActionButton: addWeightItem != null
          ? Opacity(
              opacity: 0.9,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Add Weight'),
                        content: TextField(
                          autofocus: true,
                          controller: addTextFieldController,
                          decoration: const InputDecoration(labelText: 'lbs'),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}'),
                            ), // Allow only numbers with up to 2 decimal places
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: Navigator.of(context).pop,
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              final weight =
                                  double.tryParse(addTextFieldController.text);

                              if (weight != null && addWeightItem != null) {
                                addWeightItem!(weight);
                              }

                              Navigator.of(context).pop();
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      );
                    },
                  );
                },
                backgroundColor: Colors.blue[700]!,
                foregroundColor: Colors.white,
                mini: true,
                shape: const CircleBorder(),
                child: const Icon(Icons.add),
              ),
            )
          : null,
    );
  }
}

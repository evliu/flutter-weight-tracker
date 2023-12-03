import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'weight_item.dart';

/*
 * Note: Due to time constraint, messy code is left in place.
 * TODO: clean up this code
 */

String toDisplayFormat(String date) => DateFormat('M/d/yyyy\nh:mm:ssa')
    .format(DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(date));

class WeightItemCard extends StatelessWidget {
  const WeightItemCard({
    super.key,
    required this.weightItem,
    required this.onDelete,
    required this.onUpdate,
  });

  final WeightItem weightItem;
  final Future<void> Function() onDelete;
  final Future<void> Function(double) onUpdate;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(weightItem.id),
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDelete().then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red[900]!,
              content: Text('Weight ${weightItem.weight} lbs deleted'),
            ),
          ),
        );
      },
      child: Card(
        elevation: 12,
        child: ListTile(
          leading: Text(
            toDisplayFormat(weightItem.dateTime),
            style: const TextStyle(fontSize: 12),
          ),
          title: Center(
            child: Text(
              '${weightItem.weight} lbs',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue[800]!,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              final TextEditingController controller = TextEditingController();
              controller.text = weightItem.weight.toString();

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Edit Weight'),
                    content: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      controller: controller,
                      keyboardType: TextInputType.number,
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      TextButton(
                        onPressed: controller.text == ''
                            ? null
                            : () async {
                                var newWeight = double.parse(controller.text);

                                await onUpdate(newWeight);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.blue[800]!,
                                    content: Text(
                                        'Weight ${weightItem.weight} lbs updated to $newWeight lbs'),
                                  ),
                                );

                                Navigator.of(context).pop();
                              },
                        child: const Text('Update'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.edit_note),
          ),
        ),
      ),
    );
  }
}

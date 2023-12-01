import 'package:flutter/material.dart';

import '../authentication/auth_controller.dart';
import 'weight_item.dart';

/// Displays a list of WeightItems. This is the main view
class WeightItemListView extends StatelessWidget {
  static const routeName = '/';

  const WeightItemListView({
    super.key,
    this.items = mockWeightItems,
    required this.authController,
  });

  final AnonymousAuthController authController;
  final List<WeightItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jasper Weight Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white70),
            onPressed: () {
              authController.logout();
            },
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
    );
  }
}

class WeightList extends StatelessWidget {
  const WeightList({super.key, required this.items});

  final List<WeightItem> items;

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
            )));
  }
}

class WeightListTile extends StatelessWidget {
  const WeightListTile(
      {super.key, required this.weight, required this.dateTime});

  final double weight;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          '${weight.toString()} lbs',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue[700]!,
          ),
        ),
        trailing: Text(dateTime, style: const TextStyle(fontSize: 10)),
      ),
    );
  }
}

const mockWeightItems = [
  WeightItem('1/1/2000', 123.0),
  WeightItem('2/2/2002', 234.0),
  WeightItem('3/3/2023', 345.0),
  WeightItem('1/1/2000', 123.0),
  WeightItem('2/2/2002', 234.0),
  WeightItem('3/3/2023', 345.0),
  WeightItem('1/1/2000', 123.0),
  WeightItem('2/2/2002', 234.0),
  WeightItem('3/3/2023', 345.0),
  WeightItem('1/1/2000', 123.0),
  WeightItem('2/2/2002', 234.0),
  WeightItem('3/3/2023', 345.0),
  WeightItem('1/1/2000', 123.0),
  WeightItem('2/2/2002', 234.0),
  WeightItem('3/3/2023', 345.0),
  WeightItem('1/1/2000', 123.0),
  WeightItem('2/2/2002', 234.0),
  WeightItem('3/3/2023', 345.0),
  WeightItem('1/1/2000', 123.0),
  WeightItem('2/2/2002', 234.0),
  WeightItem('3/3/2023', 345.0),
  WeightItem('1/1/2000', 123.0),
  WeightItem('2/2/2002', 234.0),
  WeightItem('3/3/2023', 345.0),
];

import 'package:flutter/material.dart';

import '../authentication/auth_controller.dart';
import 'weight_item.dart';
import 'weight_item_details_view.dart';

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
      ),

      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'weightItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return Card(
              child: ListTile(
                  title: Text('${item.weight.toString()} lbs',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      )),
                  subtitle:
                      Text(item.dateTime, style: const TextStyle(fontSize: 10)),
                  onTap: () {
                    // Navigate to the details page. If the user leaves and returns to
                    // the app after it has been killed while running in the
                    // background, the navigation stack is restored.
                    Navigator.restorablePushNamed(
                      context,
                      WeightItemDetailsView.routeName,
                    );
                  }));
        },
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

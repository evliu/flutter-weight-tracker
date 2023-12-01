import 'package:flutter/material.dart';

/// Displays detailed information about a WeightItem.
class WeightItemDetailsView extends StatelessWidget {
  const WeightItemDetailsView({super.key});

  static const routeName = '/weight_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weight Details')),
      body: const Center(child: Text('More Information Here')),
    );
  }
}

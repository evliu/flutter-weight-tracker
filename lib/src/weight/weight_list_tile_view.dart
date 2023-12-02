import 'package:flutter/material.dart';

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

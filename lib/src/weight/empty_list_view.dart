import 'package:flutter/material.dart';

class EmptyWeightListView extends StatelessWidget {
  const EmptyWeightListView({super.key});

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
      child: const Center(
        child: Text(
          'Please add a weight',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 8.0,
                color: Colors.black,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/config/setup.dart';

// Wire up the app
void main() async {
  final config = await setup();

  runApp(App(
    authController: config.authController,
    storeController: config.storeController,
  ));
}

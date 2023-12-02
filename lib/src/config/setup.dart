import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:jasper_weight_tracker/src/store/mock_store_service.dart';

import '../authentication/auth_controller.dart';
import '../authentication/firebase_auth_service.dart';
import '../store/firestore_service.dart';
import '../store/store_controller.dart';
import 'firebase_options.dart';

class SetupResult {
  final AnonymousAuthController authController;
  final StoreController storeController;

  SetupResult({required this.authController, required this.storeController});
}

Future<SetupResult> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setup Firebase Auth
  final authController = AnonymousAuthController(FirebaseAuthService());

  // Setup Firebase Firestore
  // var storeService = FirestoreService();
  final storeService = MockStoreService();
  final storeController = StoreController(storeService);

  return SetupResult(
    authController: authController,
    storeController: storeController,
  );
}

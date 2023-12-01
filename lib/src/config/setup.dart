import 'package:firebase_core/firebase_core.dart';

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
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setup Firebase Auth
  final authController = AnonymousAuthController(FirebaseAuthService());

  // Setup Firebase Firestore
  final storeController = StoreController(FirestoreService());

  return SetupResult(
    authController: authController,
    storeController: storeController,
  );
}

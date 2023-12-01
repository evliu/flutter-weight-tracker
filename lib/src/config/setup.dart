import 'package:firebase_core/firebase_core.dart';

import '../authentication/auth_controller.dart';
import '../authentication/firebase_auth_service.dart';
import 'firebase_options.dart';

class SetupResult {
  final AnonymousAuthController authController;
  final String blah;

  SetupResult({required this.authController, required this.blah});
}

Future<SetupResult> setup() async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setup Firebase Auth
  final authController = AnonymousAuthController(FirebaseAuthService());

  // Setup Firebase Firestore
  String blah = 'blah';

  return SetupResult(authController: authController, blah: blah);
}

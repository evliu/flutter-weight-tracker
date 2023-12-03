import 'package:flutter/foundation.dart';

import 'auth_service.dart';

class AnonymousAuthController with ChangeNotifier {
  AnonymousAuthController(this._authService);

  final AnonymousAuthService _authService;
  bool isLoading = false;

  Future<bool> login() async {
    if (kDebugMode) {
      print('Logging in...');
    }

    isLoading = true;
    final success = await _authService.login();

    if (kDebugMode) {
      print('success: $success');
    }

    if (success) {
      notifyListeners();
    }

    return success;
  }

  void logout() {
    if (kDebugMode) {
      print('Logging out...');
    }

    _authService.logout();

    notifyListeners();
  }

  bool isLoggedIn() => _authService.isLoggedIn();
  String? get userId => _authService.userId;
}

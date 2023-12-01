/// A service that handles user authentication.
abstract class AnonymousAuthService {
  Future<bool> login();
  void logout();
  bool isLoggedIn();
}

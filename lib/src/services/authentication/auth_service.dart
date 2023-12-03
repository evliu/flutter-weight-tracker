/// A service that handles user authentication.
abstract class AnonymousAuthService {
  /// Function to log the user in anonymously.
  Future<bool> login();

  /// Function to log the user out.
  void logout();

  /// Function to check if the user is logged in.
  bool isLoggedIn();

  /// The user's ID.
  String? get userId;
}

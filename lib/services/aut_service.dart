import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService() {
    _firebaseAuth.authStateChanges().listen(authStateChangersSteamListner);
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user {
    return _user;
  }

  User? _user;

  Future<bool> login(String email, String password) async {
    try {
      final crediantials = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      if (crediantials.user != null) {
        _user = crediantials.user;
        return true;
      }
    } catch (_e) {
      print(_e);
    }
    return false;
  }

  void authStateChangersSteamListner(User? user) {
    if (user != null) {
      _user = user;
    } else {
      _user = null;
    }
  }

  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}

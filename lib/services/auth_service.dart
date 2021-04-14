import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChange =>
      _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);

  Future<String> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    var updateData = UserUpdateInfo();
    updateData.displayName = name;
    await currentUser.updateProfile(updateData);
    await currentUser.reload();

    return currentUser.uid;
  }

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .uid;
  }

  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  signOut() {
    return _firebaseAuth.signOut();
  }

  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  Future getCurrentUser() async {
    return await _firebaseAuth.currentUser();
  }
}

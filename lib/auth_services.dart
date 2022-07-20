// import 'package:firebase_auth/firebase_auth.dart';

// class AuthServices {
//   static FirebaseAuth _auth = FirebaseAuth.instance;
//   static Future<FirebaseUser?> signInAnonymous() async {
//     try {
//       AuthResult result = await _auth.signInAnonymously();
//       _auth.signInAnonymously();
//       FirebaseUser firebaseUser = result.user;
//       return firebaseUser;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   static Future<void> signOut() async {
//     _auth.signOut();
//   }

//   static Stream<FirebaseUser> get fireBaseUserStream =>
//       _auth.onAuthStateChanged;
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);

  Future<bool> signInGoogle() async {
    try {
      await _googleSignIn.signIn();
      final userGoogle = _googleSignIn.currentUser;
      if (userGoogle != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await userGoogle.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
      }
      print(userGoogle);
      return _googleSignIn.currentUser != null;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "Unknow Errors");
      return false;
    }
  }

  Future<void> logoutGoogle() async {
    _googleSignIn.disconnect();
    print("Success loged-out google");
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = _firebaseAuth.currentUser;
      print(user);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "Unknow Errors");
      return false;
    }
  }

  Future<bool> signUp({required String email, required String password}) async {
    return false;
  }

  Future<void> logoutAccount() async {
    _firebaseAuth.signOut();
    print("Success loged-out account");
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? _googleSignIn = await GoogleSignIn().signIn();

      if (_googleSignIn == null) {
        //User can cancel the sign-in process
        debugPrint("User canceled the sign-in process");
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await _googleSignIn.authentication;

      final AuthCredential credential= GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken
      );

      final UserCredential authResult= await _auth.signInWithCredential(credential);
      debugPrint("user:${authResult.user?.email}");
      return authResult.user;
      
    } catch (error) {
      debugPrint("Error Signing in with google: $error");
      return null;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;


  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? _googleUser = await GoogleSignIn().signIn();

      if (_googleUser == null) {
        //User can cancel the sign-in process
        debugPrint("User canceled the sign-in process");
        return null;
      }

      final GoogleSignInAuthentication _googleAuth =
          await _googleUser.authentication;

      final AuthCredential credential= GoogleAuthProvider.credential(
        accessToken: _googleAuth.accessToken,
            idToken: _googleAuth.idToken,
      );

      final UserCredential authResult= await _auth.signInWithCredential(credential);
      debugPrint("User Email: ${authResult.user?.email}");
      debugPrint("User UID: ${authResult.user?.uid}");

      if(authResult.user !=null){
        createUserInDatabase(authResult.user!);
      }

      return authResult.user;

    } catch (error) {
      debugPrint("Error Signing in with google: $error");
      return null;
    }
  }



  Future<User?> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
        final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint("Facebook login success: ${authResult.user?.displayName}");

        if(authResult.user !=null){
          createUserInDatabase(authResult.user!);
        }

        return authResult.user;
      } else {
        debugPrint("Facebook login failed: ${result.message}");
        return null;
      }
    } catch (error) {
      debugPrint("Error signing in with Facebook: $error");
      return null;
    }
  }
  Future<User?> signInWithTwitter() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
        final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint("Facebook login success: ${authResult.user?.displayName}");
        return authResult.user;
      } else {
        debugPrint("Facebook login failed: ${result.message}");
        return null;
      }
    } catch (error) {
      debugPrint("Error signing in with Facebook: $error");
      return null;
    }
  }

  Future<void> createUserInDatabase(User user) async{
    final data=UserModel(
      userName:user.displayName,
      email: user.email,
      photoUrl: user.photoURL,
      phoneNumber: user.phoneNumber,
    );
    await _firestore.collection("users").doc(user.uid).set(data.toJson()).then((value){
      debugPrint("User Inserted, document: ${user.uid}");
    });
  }

}

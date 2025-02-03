import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;


  Future<UserModel?> FetchUserFromFirestore() async {
    try {
      final userData = await _firestore.collection("users").doc(_auth.currentUser!.uid).get();

      if(userData.data() != null){
        final user=UserModel.fromJson(userData.data()!);

        debugPrint("User Name: ${user.userName}");

        return user;
      }else{

      }

    } catch (error) {
      debugPrint("Error Signing in with google: $error");
      return null;
    }
  }



}

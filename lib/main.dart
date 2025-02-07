import 'package:bloc/bloc.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/ecommerce_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ecommerce_app/src/blocs/blocs.dart';
import 'ecommerce_app/src/data/preferences/local_preferences.dart';
import 'firebase_options.dart';


// import 'counter_app/counter_app.dart';
// void main() {
//   runApp(const MyApp());
// }


Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp (
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalPreferences().init();

  Bloc.observer=EcommerceAppObserver();
  runApp(const EcommerceApp());
}

/*
debug.android's password: android
Certificate fingerprints:
         SHA1: 48:F8:85:A2:78:E6:CE:3C:7E:38:FE:FB:59:E3:49:4D:3F:0B:C2:CD
         SHA256: A3:5D:60:4A:86:D7:5B:C7:F6:17:1F:86:FD:97:4A:C6:BA:EA:46:20:F0:59:0A:A0:38:31:1A:04:AE:39:D3:CE
Signature algorithm name: SHA256withRSA
Subject Public Key Algorithm: 2048-bit RSA key
Version: 3

Extensions:

#1: ObjectId: 2.5.29.14 Criticality=false
SubjectKeyIdentifier [
KeyIdentifier [
0000: 99 B6 48 59 A6 83 3E 42   95 39 41 A3 43 49 FA BB  ..HY..>B.9A.CI..
0010: 13 43 01 F9                                        .C..
]
]
*/
import 'package:bloc/bloc.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/ecommerce_app.dart';
import 'package:flutter/material.dart';
import 'ecommerce_app/src/blocs/blocs.dart';


// import 'counter_app/counter_app.dart';
// void main() {
//   runApp(const MyApp());
// }


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=EcommerceAppObserver();
  runApp(const EcommerceApp());
}


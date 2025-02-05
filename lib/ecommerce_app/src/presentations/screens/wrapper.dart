import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final child;
  const Wrapper({super.key,this.child});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}

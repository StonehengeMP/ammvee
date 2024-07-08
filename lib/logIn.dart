import 'package:flutter/material.dart';
import 'package:ammvee_release/addOns/bodyLog.dart';


class logIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
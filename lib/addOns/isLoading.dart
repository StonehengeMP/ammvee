import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class isLoading extends StatefulWidget {
  const isLoading({super.key});

  @override
  State<isLoading> createState() => _isLoadingState();
}

class _isLoadingState extends State<isLoading> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCircle(
          size: 140,
          color: kBlue,
          duration: Duration(seconds: 4),
        ),
      ),
    );
  }
}
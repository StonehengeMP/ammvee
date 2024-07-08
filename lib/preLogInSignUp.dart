import 'package:ammvee_release/addOns/Rounded_Button.dart';
import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/logIn.dart';
import 'package:ammvee_release/singUp.dart';
import 'package:flutter/material.dart';


class preLogin extends StatefulWidget {
  const preLogin({Key? key}) : super(key: key);

  @override
  State<preLogin> createState() => _preLoginState();
}

class _preLoginState extends State<preLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/backgroundmain.png"),
                fit: BoxFit.fill
            ),
          ),
          height: size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.15,
                ),
                const Text(
                  "Bienvenido a AMMVEE App",
                  style: TextStyle(
                      color: kBlue,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                SizedBox(
                  height: size.height * 0.505
                ),
                // Image.asset(
                //   "assets/bluelogo.png",
                //   height: size.height * 0.3,
                // ),
                // SizedBox(
                //   height: size.height * 0.27,
                // ),
                RoundedButton(
                  text: "Registrarse",
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return singUp();},),);}, color: kBlue,
                ),
                RoundedButton(
                  text: "Iniciar Sesion",
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return logIn();},),);}, color: kBlue,
                ),
                // SizedBox(
                //   height: size.height * 0.03,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
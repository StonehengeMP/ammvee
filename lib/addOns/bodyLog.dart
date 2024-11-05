import 'dart:async';
import 'package:ammvee_release/addOns/postLogin.dart';
import 'package:ammvee_release/addOns/rounded_input_field.dart';
import 'package:ammvee_release/initialMenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../singUp.dart';
import 'Already_Account.dart';
import 'Rounded_Button.dart';
import 'Rounded_Password_Field.dart';
import 'enterAsGuest.dart';

var email = "";
var pass = "";

class Body extends StatefulWidget {
  Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        Navigator.push(context, MaterialPageRoute(builder: (context) => initialMenu(pageContext: false)));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Container(
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
                height: size.height * 0.35,
              ),
              RoundedInputField(
                  hintText: "Correo Electrónico",
                  onChanged: (value) {
                    email = value;
                  },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  pass = value;
                },
              ),
              RoundedButton(
                text: "Iniciar Sesión",
                press: () async {
                  try {
                    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: pass
                    ).then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => initialMenu(pageContext: false)));
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Contraseña o correo incorrecto!"),
                        backgroundColor: Colors.red,
                      ));
                    });
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) {
                  //       return const initialMenu();
                  //     },
                  //   ),
                  // );
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              enterAsGuest(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return initialMenu(pageContext: true);
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                   context,
                    MaterialPageRoute(
                     builder: (context) {
                        return const singUp();
                      },
                     ),
                   );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

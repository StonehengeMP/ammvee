import 'package:ammvee_release/addOns/rounded_input_field.dart';
import 'package:ammvee_release/initialMenu.dart';
import 'package:ammvee_release/singUp.dart';
import 'package:flutter/material.dart';
import 'Already_Account.dart';
import 'Rounded_Button.dart';
import 'Rounded_Password_Field.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
            RoundedInputField(hintText: "Correo Electrónico", onChanged: (value) {}),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Iniciar Sesión",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    //TODO: verify if account exists in DB
                    return const initialMenu();
                  },
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.03,
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
    );
  }
}

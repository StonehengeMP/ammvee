import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "¿No tienes cuenta? " : "¿Ya tienes cuenta? ",
          style: const TextStyle(
              color: Colors.black,
              fontFamily: "Poppins"
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Asóciate!" : "Inicia Sesión!",
            style: const TextStyle(
                color: kBlue,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}
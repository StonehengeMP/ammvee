import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:flutter/material.dart';

class enterAsGuest extends StatelessWidget {
  final VoidCallback press;
  const enterAsGuest({
    Key? key,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Inicia sesión",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins"
          ),
        ),
        GestureDetector(
          onTap: press,
          child: const Text(
           " sin cuenta",
            style: TextStyle(
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
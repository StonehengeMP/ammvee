import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:flutter/material.dart';

class enterAsGuest extends StatelessWidget {
  final VoidCallback press;
  final String buttonName;
  final String title;

  const enterAsGuest({
    Key? key,
    required this.press,
    required this.buttonName,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
         Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins"
          ),
        ),
        GestureDetector(
          onTap: press,
          child:  Text(
           buttonName,
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
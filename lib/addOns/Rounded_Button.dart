import 'package:flutter/material.dart';
import 'package:ammvee_release/addOns/themeColors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kBlue,
    this.textColor = kWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: size.height * 0.05,
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color),),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
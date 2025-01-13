import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final title, extra, pathImg;
  final bool circle;
  final VoidCallback press;

  const ItemCard({
    Key? key,
    required this.title,
    required this.extra,
    required this.pathImg,
    required this.press,
    required this.circle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .35,
      width: size.width * .75,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(.50),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(circle ? 0.50 : 0),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/$pathImg",
                    width: size.width * 0.18,
                  ),
                ),
                Text(title, textAlign: TextAlign.center,),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  extra,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
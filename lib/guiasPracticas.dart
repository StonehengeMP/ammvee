import 'package:ammvee_release/addOns/itemCards.dart';
import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/addOns/viewAPDF.dart';
import 'package:ammvee_release/mainScreenBM.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'initialMenu.dart';

class guiasPracticas extends StatefulWidget {
  guiasPracticas({Key? key, required this.pageContext}) : super(key: key);
  bool pageContext;

  @override
  State<guiasPracticas> createState() => _guiasPracticasState();
}

class _guiasPracticasState extends State<guiasPracticas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return mainScreenBM(pageContext: widget.pageContext);
                  },
                ),
              );
            },
          ),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo.png',
                  height: MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Stack(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                              'assets/PurpleBackGroundEdit.png', fit: BoxFit.cover)
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
                          child: const Text("Selección de Guía:",
                            style: TextStyle(
                              fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: kWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ItemCard(
                      title: "Eutanasia en Equinos",
                      extra: "Guías prácticas · Por AMMVEE AC\nseptiembre 26, 2024",
                      pathImg: "bluelogo.png",
                      circle: true,
                      press: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return viewAPDF(Name: "EUTANASIA-EN-EQUINOS-1", pageContext: widget.pageContext);
                            },
                          ),
                        );
                  }),
                  ItemCard(
                      title: "Anemia Infecciosa Equina",
                      extra: "Guías prácticas · Por AMMVEE AC\nseptiembre 24, 2024",
                      pathImg: "bluelogo.png",
                      circle: true,
                      press: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return viewAPDF(Name: "manual-aie-v1", pageContext: widget.pageContext);
                            },
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:ammvee_release/addOns/itemCards.dart';
import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/addOns/viewAPDF.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'initialMenu.dart';

class responsivasMedicas extends StatefulWidget {
  responsivasMedicas({Key? key, required this.pageContext}) : super(key: key);
  bool pageContext;

  @override
  State<responsivasMedicas> createState() => _responsivasMedicasState();
}

class _responsivasMedicasState extends State<responsivasMedicas> {
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
                    return initialMenu(pageContext: widget.pageContext);
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Text("Selección de Guía:",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  ItemCard(
                      title: "AUTORIZACIÓN PARA PROCEDIMIENTO QUIRÚRGICO",
                      extra: "Responsivas Médicas · Por AMMVEE AC\nseptiembre 26, 2024",
                      press: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return viewAPDF(Name: "RESPONSIVA-CIRUGIA-2", pageContext: widget.pageContext, bool: false,);
                            },
                          ),
                        );
                      }),
                  ItemCard(
                      title: "CONSENTIMIENTO INFORMADO DE EUTANASIA",
                      extra: "Responsivas Médicas · Por AMMVEE AC\nseptiembre 26, 2024",
                      press: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return viewAPDF(Name: "AUTORIZACION-DE-EUTANASIA-2", pageContext: widget.pageContext, bool: false,);
                            },
                          ),
                        );
                      }),
                  ItemCard(
                      title: "AUTORIZACIÓN PARA PROCEDIMIENTOS DENTALES",
                      extra: "Responsivas Médicas · Por AMMVEE AC\nseptiembre 26, 2024",
                      press: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return viewAPDF(Name: "PROCEDIMIENTO-DENTAL-9.45.16", pageContext: widget.pageContext, bool: false,);
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

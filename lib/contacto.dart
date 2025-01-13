import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/mainScreenBM.dart';
import 'package:flutter/material.dart';
import 'initialMenu.dart';

class Contacto extends StatefulWidget {
  Contacto({Key? key, required this.pageContext}) : super(key: key);
  bool pageContext;

  @override
  State<Contacto> createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  var nombre = "";
  var apellido = "";
  var motivoDM = "";
  var mensajeDelCorreo = "";

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.06,
                      top: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.width * 0.06,
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "¡Gracias por descargar nuestra app de AMMVEE!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kdarkBlue,
                        ),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06,
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.width * 0.06,
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Valoramos tu interés en comunicarte con nosotros. Si tienes alguna pregunta, "
                      "sugerencia o necesitas más información sobre nuestros servicios o eventos,"
                      " por favor contactanos por los siguientes medios",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.001,
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.width * 0.06,
                  ),
                  child: const Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone),
                        Text(
                          "  Oficina: 01 (55) 5672 0907, 01 (55) 5243 3954",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.001,
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.width * 0.06,
                  ),
                  child: const Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.email),
                        Text(
                          "   formulario.ammvee.app@hotmail.com",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Icon(Icons.account_circle_sharp),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    child: const Text(
                        "Si quieres borrar tu cuenta, Haz click aquí",
                        textAlign: TextAlign.center))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

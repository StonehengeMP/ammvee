import 'package:ammvee_release/addOns/enterAsGuest.dart';
import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/logIn.dart';
import 'package:ammvee_release/mainScreenBM.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

                Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                            'assets/PurpleBackGroundEdit.png', fit: BoxFit.cover)
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
                              color: kWhite,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
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
                    child: enterAsGuest(
                        press: () {
                         !widget.pageContext ? showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Borrado de cuenta'),
                                content: const Text(
                                    '''Si seleccionas borrar se borrara la cuenta del servidor.

No habra forma de recuperar la cuenta una vez alla sido borrada.

Si aun asi deseas borrar la cuenta favor de seleccionar la opción correspondiente.'''),
                                actions: [
                                  TextButton(
                                    child: const Text('Cancelar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Borrar',
                                     style: TextStyle(
                                       color: Colors.red
                                     ),
                                    ),
                                    onPressed: () {
                                      // Call the delete account function
                                      deleteUserAccount();
                                    },
                                  ),
                                ],
                              );
                            },
                          ) : showDialog(
                           context: context,
                           builder: (BuildContext context) {
                             return AlertDialog(
                               title: const Text('No Puedes Borrar tu cuenta'),
                               content: const Text(
                                   '''Esta opcion es para solo personas con cuenta.'''),
                               actions: [
                                 TextButton(
                                   child: const Text('Cerrar'),
                                   onPressed: () {
                                     Navigator.of(context).pop();
                                   },
                                 ),
                               ],
                             );
                           },
                         );
                        },
                        buttonName: "Haz click aquí",
                        title: "Si quieres borrar tu cuenta ")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> deleteUserAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return logIn();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      if (e.code == "requires-recent-login") {
        await _reauthenticateAndDelete();
      } else {
        // Handle other Firebase exceptions
      }

    } catch (e) {
      print(e);
      // Handle general exception
    }
  }

  Future<void> _reauthenticateAndDelete() async {
    try {
      final providerData = FirebaseAuth.instance.currentUser?.providerData.first;

      if (AppleAuthProvider().providerId == providerData!.providerId) {
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(AppleAuthProvider());
      } else if (GoogleAuthProvider().providerId == providerData.providerId) {
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(GoogleAuthProvider());
      }

      await FirebaseAuth.instance.currentUser?.delete();
    } catch (e) {
      // Handle exceptions
    }
  }
}

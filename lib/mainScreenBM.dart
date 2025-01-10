import 'package:ammvee_release/contacto.dart';
import 'package:ammvee_release/guiasPracticas.dart';
import 'package:ammvee_release/initialMenu.dart';
import 'package:ammvee_release/logIn.dart';
import 'package:ammvee_release/responsivasMedicas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'acercaDeNosotros.dart';
import 'addOns/themeColors.dart';

class mainScreenBM extends StatefulWidget {
  mainScreenBM({Key? key, required this.pageContext}) : super(key: key);
  bool pageContext;

  @override
  State<mainScreenBM> createState() => _mainScreenBMState();
}

class _mainScreenBMState extends State<mainScreenBM> {

  late String exitMode;


  @override
  void initState() {
    super.initState();
    if (widget.pageContext == true) {
      exitMode = "Regresar a Iniciar Sesión";
    } else {
      exitMode = "Cerrar Sesión";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/logo.png',
                height: MediaQuery.of(context).size.height * 0.03),
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: IconButton(
              onPressed: () {},
              icon:
              const Icon(Icons.people_alt_sharp, color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: kBlack,
                      image: DecorationImage(
                          image: ExactAssetImage("assets/PurpleBackGroundEdit.png"), fit: BoxFit.fill
                      )
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AMMVEE App",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Acerca de Nosotros'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return acercaDeNosotros(pageContext: widget.pageContext);
                          },
                        ),
                      );
                    }
                  ),
                  ListTile(
                    title: Text('Contacto'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Contacto(pageContext: widget.pageContext);
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Guías prácticas'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return guiasPracticas(pageContext: widget.pageContext);
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Responsivas Médicas'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return responsivasMedicas(pageContext: widget.pageContext);
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Medicamentos'),
                    onTap: () {
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
                  ListTile(
                    title: Text(exitMode),
                    onTap: () {
                      showAlertDialog(context);
                    },
                  ),
                ],
              ),
            ),
      body: Container(
        height: MediaQuery.of(context).size.height* 0.98,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/PurpleBackGroundEdit.png', fit: BoxFit.fill),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      right: MediaQuery.of(context).size.width * 0.02,
                      left: MediaQuery.of(context).size.width * 0.02
                  ),
                  child: Image.asset('assets/logoMainScreenEdit.png', fit: BoxFit.cover,)
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/monterrey.png', fit: BoxFit.fitHeight),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height* 0.5,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset('assets/monterreyLogo.png'),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height* 0.5,
                      width: MediaQuery.of(context).size.width* 0.5,
                      child: Image.asset('assets/nuevoLeonLogo.png'),
                    ),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
  showAlertDialog(BuildContext context) {
    // set up the buttons
    if (widget.pageContext == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return logIn();
          },
        ),
      );
    } else {
      Widget cancelButton = TextButton(
        child: const Text("Permancer"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
        },
      );
      Widget continueButton = TextButton(
        child: const Text("Cerrar Sesion"),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return logIn();
              },
            ),
          );
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: const Text("AMMVEE"),
        content: const Text("Quieres cerrar sesion?"),
        actions: [
          cancelButton,
          continueButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}

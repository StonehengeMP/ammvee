import 'package:ammvee_release/addOns/isLoading.dart';
import 'package:ammvee_release/addOns/themeColors.dart';
import 'initialMenu.dart';
import 'package:flutter/material.dart';
import 'package:ammvee_release/addOns/themeColors.dart';



class acercaDeNosotros extends StatefulWidget {
  acercaDeNosotros({Key? key, required this.pageContext}) : super(key: key);
  bool pageContext;
  @override
  State<acercaDeNosotros> createState() => _acercaDeNosotrosState();
}
class _acercaDeNosotrosState extends State<acercaDeNosotros> {

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const Center(
                    child: Text(
                        "¿Quiénes somos?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kdarkBlue,
                          fontSize: 25.0
                      )
                    ),
                  ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
                  Padding(
                    padding:EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.06,
                      top: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.width * 0.06,
                    ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("AMMVEE ha servido para agrupar a la mayoría de los Médicos Veterinarios"
                            " Zootecnistas dedicados prioritariamente a la práctica. Su misión primordial"
                            " es la superación profesional para lo cual se impulsa permanentemente un "
                            "programa de Actualización Médica. La AMMVEE ha servido como vínculo con"
                            " la Asociación Americana de Practicantes en Equinos (AAEP por sus siglas en "
                            "inglés). A través de AMMVEE, algunos MVZ mexicanos han obtenido los contactos "
                            "iniciales para cursar estudios de postgrado en el extranjero. Con ello, se"
                            " mantiene vivo el modelo de Calidad Profesional que se persigue en nuestro país"
                            " y que ha permitido que el MVZ mexicano con especialidad en equinos alcance un "
                            "nivel de reconocimiento internacional."),
                      ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding:EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.06,
                      top: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.width * 0.06,
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "Conscientes de que aún falta mucho por recorrer para lograr el "
                              "pleno fortalecimiento de AMMVEE, contamos con la participación "
                              "activa de todos los agremiados, que en conjunto buscan alcanzar"
                              " las metas para las que fue creada. A mediano plazo, AMMVEE no "
                              "solo representará un mecanismo para organizar Congresos, sino"
                              " que irá más allá, para ofrecer beneficios tangibles a cada uno"
                              " de sus Asociados."),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  }
}
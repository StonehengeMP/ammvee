import 'package:ammvee_release/addOns/enterAsGuest.dart';
import 'package:ammvee_release/addOns/isLoading.dart';
import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/addOns/viewAPDF.dart';
import 'initialMenu.dart';
import 'package:flutter/material.dart';

class medInfoCard extends StatefulWidget {
  final String medName;
  final String medDose;
  final String medIndication;

  const medInfoCard({super.key,
    required this.medName,
    required this.medDose,
    required this.medIndication
  });

  @override
  State<medInfoCard> createState() => _medInfoCardState();
}

class _medInfoCardState extends State<medInfoCard> {
  bool loading = true;
  String medDVF = "";

  @override
  void initState() {
    super.initState();
    //TODO: "GET" FROM DB INFORMATION OF MEDICINE INFORMATION

    setState(() {
      loading = false;
      medDVF = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem.";
    });
  }

  @override
  Widget build(BuildContext context) => loading
      ? const isLoading()
      : PopScope(
          child: Scaffold(
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
                          return initialMenu(pageContext: false);
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
                actions: <Widget>[
                  Opacity(
                    opacity: 0,
                    child: IconButton(
                        onPressed: () {
                          //contact
                        },
                        icon: const Icon(Icons.people_alt_sharp,
                            color: Colors.black)),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Nomenclatura"),
                              content: const Text("VÍAS DE ADMINISTRACIÓN\n"
                                  "\t\tIV: Intra Venoso\n"
                                  "\t\tIM: Intra Muscular\n"
                                  "\t\tSC: Subcutáneo\n"
                                  "\t\tIA: Intra Articular\n"
                                  "\t\tIC: Intra Cardiaca\n"
                                  "UNIDADES DE MEDIDA\n"
                                  "\t\tUI: Unidades Internacionales\n"
                                  "\t\tmg: Miligramos\n"
                                  "\t\tL: Litros\n"
                                  "\t\tmL: Mililitros\n"
                                  "\t\tµg: Microgramos\n"
                                  "\t\tgr: Gramos\n"
                                  "\t\tkg: Kilogramos\n"
                                  "\t\tcm: Centímetros\n"
                                  "\t\tmEq: Miliequivalentes\n"
                                  "UNIDADES DE TIEMPO\n"
                                  "\t\thr: Hora\n"
                                  "\t\tmin: Minutos\n"
                                  "OTROS:\n"
                                  "\t\tSSF: Solución salina fisiológica\n"
                                  "\t\tSNG: Sonda Nasogástrica"),
                              actions: <Widget>[
                                TextButton(
                                    child: Text("Cerrar"),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.red,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.info_outline, color: Colors.black))
                ],
              ),
              backgroundColor: kWhite,
              body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .1, right: MediaQuery.of(context).size.width * .1),
                      child: Text(
                        widget.medName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Image.asset(
                      "assets/bluelogo.png",
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Dosis/Via/Frecuencia :",
                          style: TextStyle(
                            fontSize: 17,
                            color: kBlue,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06,
                          top: MediaQuery.of(context).size.height * 0.01,
                          right: MediaQuery.of(context).size.width * 0.06,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          textAlign: TextAlign.justify,
                          widget.medDose,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06,
                          top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Indicaciones :",
                          style: TextStyle(
                            fontSize: 17,
                            color: kBlue,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.06,
                        top: MediaQuery.of(context).size.height * 0.01,
                        right: MediaQuery.of(context).size.width * 0.06,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          textAlign: TextAlign.justify,
                          widget.medIndication,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        enterAsGuest(
                            press: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return viewAPDF(Name: "cartaReferencias", pageContext: false);
                                  },
                                ),
                              );
                            },
                            buttonName: " aquí",
                            title: "Puedes encontrar la referencia"
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                  ])))),
        );
}

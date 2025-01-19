import 'package:ammvee_release/addOns/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'addOns/rounded_input_field.dart';
import 'addOns/themeColors.dart';
import 'mainScreenBM.dart';

class formulaPeso extends StatefulWidget {
  formulaPeso({Key? key, required this.pageContext}) : super(key: key);
  bool pageContext;

  @override
  State<formulaPeso> createState() => _formulaPesoState();
}

class _formulaPesoState extends State<formulaPeso> {
  late var _result = 0.0;
  late var valuePT = 0;
  late var valueLC = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
              Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/PurpleBackGroundEdit.png',
                          fit: BoxFit.cover)),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.025),
                      child: const Text(
                        "Cálculo de Peso:",
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
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                    "Dirigido a los médicos que no cuentan con una báscula, puedan calcular el peso del caballo midiéndolo y obtener un valor más exacto para poder dosificar los medicamentos adecuadamente",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.justify),
              ),
              Image.asset("assets/caballoCalculo.jpg"),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.085,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                      onChanged: (value) {
                        valuePT = int.parse(value);
                        setState(() {
                          _result = ((valuePT^2) * valueLC)/11880;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Perímetro Toracico (cm) :',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01, horizontal: MediaQuery.of(context).size.width * 0.05),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.green, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightGreen, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.085,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        valueLC = int.parse(value);
                        setState(() {
                          _result = ((valuePT * valuePT) * valueLC)/11880;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Longitud del Cuerpo (cm) :',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01, horizontal: MediaQuery.of(context).size.width * 0.05),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.orange, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text("Peso: ${_result.toStringAsFixed(4)} Kg", style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              )),
            ],
          ),
        ),
      ),
    );
  }
}

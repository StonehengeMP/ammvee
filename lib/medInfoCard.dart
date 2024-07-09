import 'package:ammvee_release/addOns/isLoading.dart';
import 'package:ammvee_release/addOns/themeColors.dart';
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
                          return const initialMenu();
                        },
                      ),
                    );
                  },
                ),
                centerTitle: true,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  )
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
                    Text(
                      widget.medName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
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
                        )
                  ])))),
        );
}

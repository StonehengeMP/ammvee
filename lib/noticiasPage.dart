import 'package:flutter/material.dart';

import 'addOns/itemCards.dart';
import 'addOns/viewAPDF.dart';
import 'mainScreenBM.dart';

class noticiasPage extends StatefulWidget {
  noticiasPage({Key? key, required this.pageContext}) : super(key: key);
  bool pageContext;

  @override
  State<noticiasPage> createState() => _noticiasPageState();
}

class _noticiasPageState extends State<noticiasPage> {
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text("Últimas noticias:",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                ItemCard(
                    title: "Noticia Ketamina",
                    extra: "Categorías: Avisos, Blog y Notas Por AMMVEE AC. noviembre 4, 2024",
                    pathImg: "noticiak.jpg",
                    circle: false,
                    press: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return viewAPDF(Name: "keta", pageContext: widget.pageContext);
                          },
                        ),
                      );
                    }),
                ItemCard(
                    title: "Feliz año nuevo, les desea AMMVEE",
                    extra: "Categorías: Avisos, Blog y Notas Por AMMVEE AC. diciembre 31, 2024",
                    pathImg: "noticiamain.jpg",
                    circle: false,
                    press: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return viewAPDF(Name: "noticiapdf", pageContext: widget.pageContext);
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

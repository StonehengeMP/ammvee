import 'package:flutter/material.dart';

import 'mainScreenBM.dart';

class formulaPeso extends StatefulWidget {
  formulaPeso({Key? key, required this.pageContext}) : super(key: key);
  bool pageContext;

  @override
  State<formulaPeso> createState() => _formulaPesoState();
}

class _formulaPesoState extends State<formulaPeso> {
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
      body: Container(
        child: Column(
          children: [
            Image.asset(""),
            Row(
              children: [

              ],
            ),
            Text(""),
          ],
        ),
      ),
    );
  }
}

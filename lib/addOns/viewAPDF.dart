import 'dart:io';
import 'dart:typed_data';
import 'package:ammvee_release/guiasPracticas.dart';
import 'package:ammvee_release/mainScreenBM.dart';
import 'package:ammvee_release/responsivasMedicas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';

class viewAPDF extends StatefulWidget {
  final Name, pageContext;

  const viewAPDF({
    Key? key,
    required this.Name,
    required this.pageContext,
  }) : super(key: key);

  @override
  State<viewAPDF> createState() => _viewAPDFState();
}

class _viewAPDFState extends State<viewAPDF> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/${widget.Name}.pdf'),
    );
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
          actions: [
            IconButton(onPressed: () async {
              try {
                final ByteData bytes = await rootBundle.load('assets/${widget.Name}.pdf');
                final Uint8List list = bytes.buffer.asUint8List();
                final directory = Platform.isAndroid
                    ? await getExternalStorageDirectory() //FOR ANDROID
                    : await getApplicationSupportDirectory(); //FOR iOS
                final file = File('${directory?.path}/${widget.Name}.pdf');
                await file.writeAsBytes(list);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("PDF descargado de manera exitosa!!"),
                  backgroundColor: Colors.green,
                ));
                print('PDF Downloaded to ${file.path}');
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Error en descarga"),
                  backgroundColor: Colors.red,
                ));
                print('Error downloading PDF: $e');
              }
            }, icon: const Icon(Icons.download_sharp))
          ],
        ),
        body: PdfViewPinch(
          controller: pdfPinchController ,
        ),
      )
    );
  }
}
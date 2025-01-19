import 'dart:io';
import 'dart:typed_data';
import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/guiasPracticas.dart';
import 'package:ammvee_release/mainScreenBM.dart';
import 'package:ammvee_release/responsivasMedicas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class viewYoutubeVid extends StatefulWidget {
  final vidID, pageContext;

  const viewYoutubeVid({
    Key? key,
    required this.vidID,
    required this.pageContext,
  }) : super(key: key);

  @override
  State<viewYoutubeVid> createState() => _viewYoutubeVidState();
}

class _viewYoutubeVidState extends State<viewYoutubeVid> {
  final _controller = YoutubePlayerController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _controller.loadVideoById(videoId: widget.vidID);
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
                  setState(() {
                    _controller.pauseVideo();
                  });
                  Navigator.pop(context);
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
            body: Column(
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
                            "Recursos Visuales:",
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
                  YoutubePlayer(
                    controller: _controller,
                    aspectRatio:
                        16 / 9, // Aspect ratio you want to take in screen
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Rayos x Espécimen de casco",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05, top: size.height * 0.001),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/logo.png',
                              height: MediaQuery.of(context).size.height * 0.03),
                          const Text(
                            "   AMMVEE AC.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ])));
  }
}

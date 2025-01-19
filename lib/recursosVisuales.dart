import 'package:ammvee_release/addOns/itemCardsNoticias.dart';
import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/addOns/viewYoutubeVid.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'addOns/viewAPDF.dart';
import 'mainScreenBM.dart';

class recursosVisuales extends StatefulWidget {
  recursosVisuales({Key? key, required this.pageContext}) : super(key: key);
  bool pageContext;
  final _controller = YoutubePlayerController();

  @override
  State<recursosVisuales> createState() => _recursosVisualesState();
}

class _recursosVisualesState extends State<recursosVisuales> {
  @override
  void initState() {
    super.initState();
    widget._controller.loadVideoById(videoId: "mbBH3jQGyzE");
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
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.03),
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
                Stack(
                  children: [
                    Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Image.asset('assets/PurpleBackGroundEdit.png',
                            fit: BoxFit.cover)),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .size
                                .height * 0.025),
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
                ItemCardNoticia(
                    title: "Rayos x Espécimen de casco",
                    extra: "AMMVEE AC",
                    pathImg: "videorayosx.png",
                    circle: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return viewYoutubeVid(
                                vidID: "mbBH3jQGyzE",
                                pageContext: widget.pageContext);
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

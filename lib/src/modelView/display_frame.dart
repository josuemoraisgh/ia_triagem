import 'package:flutter/material.dart';
import '../modules/home/parameters.dart';
import 'header_card.dart';

class DisplayFrame extends StatelessWidget {
  final int id;
  final List<Widget>? widgets;
  const DisplayFrame({super.key, required this.id, this.widgets});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HeaderCard(
        headerTitle: telas[id]!['header'] == "" || telas[id]!['header'] == null
            ? null
            : Text(
                telas[id]!['header'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 26, height: 2, color: Colors.white),
              ),
        widgetBody: Column(
          children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: telas[id]!['hasFrame'] ?? true
                      ? BoxDecoration(
                          border: Border.all(width: 3.0, color: Colors.black),
                          color: Colors.white,
                        )
                      : null,
                  child: telas[id]!['body_type'] ==
                          "audio" // body_type: text || image || audio
                      ? SizedBox(
                          height: 300.0,
                          width: 400.0,
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Tocando áudio!!"),
                              ],
                            ),
                          ),
                        )
                      : telas[id]!['body_type'] == "image" &&
                              telas[id]!['body'] == ""
                          ? const SizedBox(
                              height: 300.0,
                              width: 400.0,
                            )
                          : telas[id]!['body_type'] ==
                                  "image" //  body_type: text || image || audio
                              ? telas[id]!['hasFrame'] ?? true
                                  ? Image.asset(
                                      telas[id]!['body'], //assets/arvore2.png
                                      height: 300.0,
                                      width: 400.0,
                                      alignment: Alignment.center,
                                    )
                                  : Image.asset(
                                      telas[id]!['body'], //assets/arvore2.png
                                      alignment: Alignment.bottomCenter,
                                    )
                              : telas[id]!['hasFrame'] ?? true
                                  ? Text(
                                      telas[id]!['body'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 100.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : Text(
                                      telas[id]!['body'],
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          decorationColor: Colors.black),
                                    ),
                ),
              ] +
              (widgets != null
                  ? <Widget>[const SizedBox(height: 15)] + widgets!
                  : []),
        ),
      ),
    );
  }
}

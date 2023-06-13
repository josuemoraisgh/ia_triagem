import 'package:flutter/material.dart';
import '../modules/home/parameters.dart';
import 'header_card.dart';

class DisplayFrame extends StatefulWidget {
  final int id;
  final List<Widget>? widgets;
  final void Function(String audio)? playMusic;
  const DisplayFrame(
      {super.key, required this.id, this.widgets, this.playMusic});

  @override
  State<DisplayFrame> createState() => _DisplayFrameState();
}

class _DisplayFrameState extends State<DisplayFrame> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final String body = telas[widget.id]!['body'] ?? "";
    return SingleChildScrollView(
      child: HeaderCard(
        headerTitle: telas[widget.id]!['header'] == "" ||
                telas[widget.id]!['header'] == null
            ? null
            : Text(
                telas[widget.id]!['header'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 26, height: 2, color: Colors.white),
              ),
        widgetBody: Column(
          children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: telas[widget.id]!['body_hasFrame'] ?? true
                      ? BoxDecoration(
                          border: Border.all(width: 3.0, color: Colors.black),
                          color: Colors.white,
                        )
                      : null,
                  child: (body == "") &&
                          (telas[widget.id]!['body_hasFrame'] ??
                              true) // body_type = vazio
                      ? const SizedBox(
                          height: 300.0,
                          width: 400.0,
                        )
                      : body.contains('.mp3') // body_type = audio
                          ? SizedBox(
                              height: 300.0,
                              width: 400.0,
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: !isPlaying
                                      ? <Widget>[
                                          IconButton(
                                              iconSize: 64,
                                              icon:
                                                  const Icon(Icons.play_arrow),
                                              onPressed: () async {
                                                if (widget.playMusic != null) {
                                                  widget.playMusic!(telas[
                                                      widget.id]!['body']);
                                                }
                                                setState(() {
                                                  isPlaying = true;
                                                });
                                              }),
                                          const Text(
                                              "Clique para iniciar o Audio"),
                                        ]
                                      : const <Widget>[
                                          CircularProgressIndicator(),
                                          SizedBox(height: 10),
                                          Text("Tocando o audio!!"),
                                        ],
                                ),
                              ),
                            )
                          : body.contains('.png') // body_type = image
                              ? telas[widget.id]!['body_hasFrame'] ?? true
                                  ? Image.asset(
                                      body, //assets/arvore2.png
                                      //height: 300.0,
                                      width: 400.0,
                                      alignment: Alignment.center,
                                    )
                                  : Image.asset(
                                      body, //assets/arvore2.png
                                      alignment: Alignment.bottomCenter,
                                    )
                              : telas[widget.id]!['body_hasFrame'] ??
                                      true // body_type = texto
                                  ? Text(
                                      body,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 100.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : body.isNotEmpty
                                      ? Text(
                                          body,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              decorationColor: Colors.black),
                                        )
                                      : null,
                ),
              ] +
              (widget.widgets != null
                  ? !(telas[widget.id]!['body_hasFrame'] ?? true) &&
                          body.isNotEmpty
                      ? <Widget>[const SizedBox(height: 15)] + widget.widgets!
                      : widget.widgets!
                  : []),
        ),
      ),
    );
  }
}

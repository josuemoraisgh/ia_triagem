import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../modelView/display_frame.dart';
import '../modelView/header_card.dart';
import '../modelView/question_frame.dart';
import '../modules/home/parameters.dart';

class TypeForm extends StatefulWidget {
  final int id;
  final ValueNotifier<List<String>> answer;
  const TypeForm({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeForm> createState() => _TypeFormState();
}

class _TypeFormState extends State<TypeForm> {
  var player = AudioPlayer();
  bool imageClose = false;
  String answer = "";

  @override
  void initState() {
    super.initState();
    final String body = telas[widget.id]!['itens'][0]['body'] ?? "";
    if ((telas[widget.id]!['itens'][0]['question'] != null) &&
        !body.contains('.mp3')) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() {
          imageClose = true;
        });
      });
    }
  }

  void playMusic(String fileName, String? question) async {
    if (fileName != '.mp3') {
      try {
        await player.setAudioSource(
          AudioSource.uri(Uri.parse("asset:///$fileName")),
          initialPosition: Duration.zero,
          preload: true,
        );
        //await player.setAsset(path); //load audio from assets
        player.play().then((value) {
          setState(() {
            if (question != null) {
              imageClose = true;
            }
          });
        });
      } catch (e) {
        debugPrint("Error loading audio source: $e");
      }
    } else {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() {
          imageClose = true;
        });
      });
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HeaderCard(
        headerTitle: imageClose
            ? Text(
                telas[widget.id]!['itens'][0]['question'] ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 26, height: 2, color: Colors.white),
              )
            : telas[widget.id]!['header'] == "" ||
                    telas[widget.id]!['header'] == null
                ? null
                : Text(
                    telas[widget.id]!['header'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 26, height: 2, color: Colors.white),
                  ),
        widgetBody: Column(
          children: (telas[widget.id]!['itens'] as List)
              .map<Widget>(
                (item) => imageClose
                    ? QuestionFrame(item: item, answer: widget.answer)
                    : DisplayFrame(
                        item: item,
                        widgets: item['question'] != null
                            ? []
                            : [
                                QuestionFrame(item: item, answer: widget.answer)
                              ],
                        playMusic: playMusic,
                      ),
              )
              .toList()
              .cast<Widget>(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  final _formKey = GlobalKey<FormState>();
  late List<String> answer;
  var player = AudioPlayer();
  bool imageClose = false;

  @override
  void initState() {
    super.initState();
    answer = List.filled((telas[widget.id]!['itens'] as List).length, "");
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
            } else {
              Modular.to.popAndPushNamed("/", arguments: widget.id + 1);
            }
          });
        });
      } catch (e) {
        debugPrint("Error loading audio source: $e");
      }
    } else {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() {
          if (question != null) {
            imageClose = true;
          } else {
            widget.answer.value = ['Sucess'];
          }
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
        widgetBody: Form(
          key: _formKey,
          onChanged: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.answer.value = [answer.join(";")];
            } else {
              widget.answer.value = [];
            }
          },
          autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
          child: Column(
            children: _montaAternativas(telas[widget.id]!['itens']),
          ),
        ),
      ),
    );
  }

  List<Widget> _montaAternativas(List<Map<String, dynamic>> items) {
    List<Widget> widgetList = [];
    for (int i = 0; i < items.length; i++) {
      widgetList.add(
        imageClose && items[i]['options'] != null
            ? QuestionFrame(
                item: items[i],
                answerFunc: (value) {
                  answer[i] = "$value; ${DateTime.now().toString()}";
                  //state.didChange(answer[i]);
                },
              )
            : DisplayFrame(
                item: items[i],
                widgets: items[i]['question'] != null ||
                        items[i]['options'] == null
                    ? []
                    : [
                        QuestionFrame(
                          item: items[i],
                          answerFunc: (value) {
                            answer[i] = "$value; ${DateTime.now().toString()}";
                            //state.didChange(answer[i]);
                          },
                        )
                      ],
                playMusic: playMusic,
              ),
      );
    }
    return (widgetList);
  }
}

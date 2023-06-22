import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:just_audio/just_audio.dart';
import '../modelView/custom_card_question.dart';
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
    return CustomCardQuestion(
        answer: widget.answer,
        header: imageClose
            ? telas[widget.id]!['itens'][0]['question']
            : (telas[widget.id]!['header'] ?? "") != ""
                ? telas[widget.id]!['header']
                : null,
        body: telas[widget.id]!['itens'],
        playMusic: playMusic);
  }

  /*
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
          child: FormField<List<String>>(
            initialValue: answer,
            autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
            validator: (List<String>? value) {
              if (value == null) {
                return 'Por favor responda todas as questões';
              } else {
                final count = value.where((item) => item != "").length;
                if (count < value.length) {
                  return 'Por favor responda todas as questões';
                }
              }
              return (null);
            },
            builder: (FormFieldState<List<String>> state) => MontaAlternativas(
              length: telas[widget.id]!['itens'] != null
                  ? telas[widget.id]!['itens'].length
                  : 1,
              builder: (int i) => Expanded(
                child: Column(
                  children: i != 0
                      ? const <Widget>[
                          SizedBox(height: 15),
                          Divider(),
                          SizedBox(height: 15),
                        ]
                      : const <Widget>[] +
                          <Widget>[
                            imageClose &&
                                    telas[widget.id]!['itens'][i]['options'] !=
                                        null
                                ? QuestionFrame(
                                    item: telas[widget.id]!['itens'][i],
                                    answerFunc: (value) {
                                      if (value == "") {
                                        answer[i] =
                                            "$value; ${DateTime.now().toString()}";
                                      } else {
                                        answer[i] = "";
                                      }
                                      state.didChange(answer);
                                    },
                                  )
                                : DisplayFrame(
                                    item: telas[widget.id]!['itens'][i],
                                    widgets: telas[widget.id]!['itens'][i]
                                                    ['question'] !=
                                                null ||
                                            telas[widget.id]!['itens'][i]
                                                    ['options'] ==
                                                null
                                        ? []
                                        : [
                                            QuestionFrame(
                                              item: telas[widget.id]!['itens']
                                                  [i],
                                              answerFunc: (value) {
                                                if (value != "") {
                                                  answer[i] =
                                                      "$value; ${DateTime.now().toString()}";
                                                } else {
                                                  answer[i] = "";
                                                }
                                                state.didChange(answer);
                                              },
                                            )
                                          ],
                                    playMusic: playMusic,
                                  ),
                          ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }*/
}

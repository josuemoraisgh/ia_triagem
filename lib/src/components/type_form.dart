import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../modelView/custom_radio_list.dart';
import '../modelView/display_frame.dart';
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
  final _formKey = GlobalKey<FormState>();
  String answer = "";

  @override
  void initState() {
    super.initState();
    if ((((telas[widget.id]!['body'] == null) ||
                (telas[widget.id]!['body'] as String).isEmpty) &&
            (telas[widget.id]!['body_hasFrame'] ?? true)) ||
        ((telas[widget.id]!['body'] != null) &&
            !(telas[widget.id]!['body'] as String).contains('.mp3')) ||
        (telas[widget.id]!['body'] == '.mp3')) {
      if (telas[widget.id]!['question'] != null) {
        Future.delayed(const Duration(seconds: 3)).then((value) {
          setState(() {
            imageClose = true;
          });
        });
      }
    } else {
      if ((telas[widget.id]!['body'] != null) &&
          (telas[widget.id]!['body'] as String).isNotEmpty) {
        _init();
      }
    }
  }

  Future<void> _init() async {
    final String path = telas[widget.id]!['body'];
    await player.setAudioSource(AudioSource.uri(Uri.parse('asset:///$path')),
        initialPosition: Duration.zero, preload: true);
    //await player.setAsset(path); //load audio from assets
    player.play().then((value) {
      setState(() {
        if (telas[widget.id]!['question'] != null) imageClose = true;
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return imageClose
        ? QuestionFrame(id: widget.id, answer: widget.answer)
        : DisplayFrame(
            id: widget.id,
            widgets: telas[widget.id]!['question'] != null
                ? []
                : [
                    Form(
                      key: _formKey,
                      onChanged: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          widget.answer.value = [answer];
                        } else {
                          widget.answer.value = [];
                        }
                      },
                      autovalidateMode:
                          AutovalidateMode.always, //.onUserInteraction,
                      child: CustomRadioList(
                        anwserFunc: (value) =>
                            answer = "$value; ${DateTime.now().toString()}",
                        hasPrefiroNaoDizer: false,
                        itens: telas[widget.id]!['options'],
                        optionsColumnsSize:
                            telas[widget.id]!['options_columns_size'],
                        validator: (String? value) {
                          if (value == null) {
                            return 'Por favor escolha um item';
                          } else if (value.isEmpty) {
                            return 'Por favor escolha um item';
                          }
                          return (null);
                        },
                      ),
                    ),
                  ],
          );
  }
}

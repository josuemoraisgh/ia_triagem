import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
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
    final String body = telas[widget.id]!['body'] ?? "";
    if ((telas[widget.id]!['question'] != null) &&
        (!body.contains('.mp3') || body == '.mp3')) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() {
          imageClose = true;
        });
      });
    } else {
      if ((telas[widget.id]!['body'] != null) &&
          (telas[widget.id]!['body'] as String).isNotEmpty) {
        _init();
      }
    }
  }

  Future<void> _init() async {
    //final String path = telas[widget.id]!['body'];
    try {
      await player.setAudioSource(
        AudioSource.uri(
          Uri.parse("asset:///${telas[widget.id]!['body']}"),
          tag: MediaItem(
            // Specify a unique ID for each media item:
            id: '1',
            // Metadata to display in the notification:
            album: "Album name",
            title: "Song name",
            artUri: Uri.parse('https://example.com/albumart.jpg'),
          ),
        ),
      );
      //await player.setAsset(path); //load audio from assets
      player.play().then((value) {
        setState(() {
          if (telas[widget.id]!['question'] != null) imageClose = true;
        });
      });
    } catch (e) {
      debugPrint("Error loading audio source: $e");
    }
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

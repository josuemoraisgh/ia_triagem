import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../modules/home/parameters.dart';
import 'header_card.dart';

class TypeConscAten extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeConscAten({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeConscAten> createState() => _TypeConscAtenState();
}

class _TypeConscAtenState extends State<TypeConscAten> {
  final _formKey = GlobalKey<FormState>();
  var player = AudioPlayer();
  bool imageClose = false;
  String answer = "";

  @override
  void initState() {
    super.initState();
    if ((telas[widget.id]!['mode'] != "audio") ||
        ((telas[widget.id]!['image'] as String).isEmpty)) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() {
          imageClose = true;
        });
      });
    } else {
      _init();
    }
  }

  Future<void> _init() async {
    final String path = telas[widget.id]!['image'];
    await player.setAudioSource(AudioSource.uri(Uri.parse('asset:///$path')),
        initialPosition: Duration.zero, preload: true);

    //await player.setAsset(path); //load audio from assets
    player.play().then((value) {
      setState(() {
        imageClose = true;
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
    return imageClose ? partTwo() : partOne();
  }

  Widget partOne() {
    return HeaderCard(
      headerTitle: telas[widget.id]!['header1'] == ""
          ? null
          : Text(
              telas[widget.id]!['header1'],
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 26, height: 2, color: Colors.white),
            ),
      widgetBody: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Colors.black),
          color: Colors.white,
        ),
        child: telas[widget.id]!['mode'] == "audio"
            ? SizedBox(
                height: 300.0,
                width: 400.0,
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 20),
                  child: const  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Tocando áudio!!"),
                    ],
                  ),
                ),
              )
            : telas[widget.id]!['image'] == ""
                ? const SizedBox(
                    height: 300.0,
                    width: 400.0,
                  )
                : telas[widget.id]!['mode'] == "consc"
                    ? Image.asset(
                        telas[widget.id]!['image'], //assets/arvore2.png
                        height: 300.0,
                        width: 400.0,
                        alignment: Alignment.bottomCenter,
                      )
                    : Text(
                        telas[widget.id]!['image'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 100.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
      ),
    );
  }

  Widget partTwo() {
    return HeaderCard(
      headerTitle: Text(
        telas[widget.id]!['header2'],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 26, height: 2, color: Colors.white),
      ),
      widgetBody: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            onChanged: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.answer.value = {'answer': answer};
              } else {
                widget.answer.value = {};
              }
            },
            autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
            child: FormField(
              initialValue: "",
              autovalidateMode: AutovalidateMode.always,
              builder: (FormFieldState<String> state) {
                return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: _montaAternativas(
                          state, telas[widget.id]!['op'] as List<String>),
                    ));
              },
              validator: (String? value) {
                if (value == null) {
                  return 'Por favor escolha um item';
                } else if (value.isEmpty) {
                  return 'Por favor escolha um item';
                }
                return (null);
              },
            ),
          )),
    );
  }

  List<Widget> _montaAternativas(
      FormFieldState<String> state, List<String> items) {
    List<Widget> widgetList = [];
    for (int i = 0; i < items.length; i++) {
      widgetList.add(
        RadioListTile(
          title: Text(items[i], style: const TextStyle(fontSize: 24.0)),
          value: items[i],
          groupValue: answer,
          onChanged: (value) {
            setState(() {
              answer = value.toString();
              state.didChange(answer);
            });
          },
        ),
      );
    }
    return (widgetList);
  }
}

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../modules/main/parameters.dart';
import 'header_card.dart';

class TypeAudioComplete extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeAudioComplete({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeAudioComplete> createState() => _TypeAudioCompleteState();
}

class _TypeAudioCompleteState extends State<TypeAudioComplete> {
  final _formKey = GlobalKey<FormState>();
  String seguencia1 = "", seguencia2 = "", seguencia3 = "";
  var player = AudioPlayer();
  bool imageClose = false;

  @override
  void initState() {
    super.initState();
    if ((telas[widget.id]!['mode'] != "audio") ||
        ((telas[widget.id]!['image'] as String).isEmpty)) {
      imageClose = true;
    } else {
      _init();
    }
  }

  Future<void> _init() async {
    final String path = telas[widget.id]!['image'];
    await player.setAsset(path); //load audio from assets
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
          child: SizedBox(
            height: 300.0,
            width: 400.0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: const Column(
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
          )),
    );
  }

  Widget partTwo() {
    return HeaderCard(
      headerTitle: Text(
        telas[widget.id]!['header2'],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 26, height: 2, color: Colors.white),
      ),
      widgetBody: Form(
        key: _formKey,
        onChanged: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            widget.answer.value = {
              'answer1': seguencia1,
              'answer2': seguencia2,
              'answer3': seguencia3
            };
          } else {
            widget.answer.value = {};
          }
        },
        autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3.0, color: Colors.black),
            color: Colors.white,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            child: Column(
              children:
                  _montaAternativas(telas[widget.id]!['op'] as List<String>),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _montaAternativas(List<String> items) {
    List<Widget> widgetList = [], widgetListRow = [];
    for (int i = 0; i < items.length; i++) {
      widgetListRow = [];
      if (telas[widget.id]!['op'][i][0] == "-") {
        widgetListRow.add(_montaEdit(i));
        widgetListRow.add(const SizedBox(width: 5));
        widgetListRow.add(_montaTexto(i));
      } else {
        widgetListRow.add(_montaTexto(i));
        widgetListRow.add(const SizedBox(width: 5));
        widgetListRow.add(_montaEdit(i));
      }
      widgetList.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widgetListRow));
      widgetList.add(const SizedBox(width: 15));
    }
    return (widgetList);
  }

  Widget _montaTexto(int i) {
    return (Container(
      alignment: Alignment.center,
      height: 50,
      width: 100,
      decoration: myContainerDecoration(),
      child: Text(
        telas[widget.id]!['op'][i],
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    ));
  }

  Widget _montaEdit(int i) {
    return (Expanded(
      child: TextFormField(
        decoration: const InputDecoration(
            border: UnderlineInputBorder(), labelText: "Resposta"),
        keyboardType: TextInputType.name,
        autovalidateMode: AutovalidateMode.always,
        validator: (value) {
          if (value == null) {
            return 'Resposta invalida!! Corrija por favor';
          } else if ((value.isEmpty)) {
            return 'Resposta invalida!! Corrija por favor';
          }
          return null;
        },
        onChanged: (v) => seguencia1 = v,
      ),
    ));
  }

  BoxDecoration myContainerDecoration() {
    return BoxDecoration(
      border: Border.all(width: 3.0, color: Colors.redAccent),
      color: Colors.white70,
    );
  }
}

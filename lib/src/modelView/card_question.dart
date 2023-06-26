import 'package:flutter/material.dart';
import 'package:ia_triagem/src/modelView/question_frame.dart';

import 'display_frame.dart';
import 'header_card.dart';
import 'monta_alternativas.dart';

class CardQuestion extends StatefulWidget {
  final String? header;
  final dynamic body;
  final ValueNotifier<List<String>> answer;
  final void Function(String audio)? playMusic;
  const CardQuestion(
      {super.key,
      required this.answer,
      this.header,
      required this.body,
      this.playMusic});

  @override
  State<CardQuestion> createState() => _CardQuestionState();
}

class _CardQuestionState extends State<CardQuestion> {
  final _formKey = GlobalKey<FormState>();
  List<String> answer = [];

  @override
  void initState() {
    super.initState();
    if (widget.body is! String) {
      final count = (widget.body as List)
          .where((item) => (item['options'] ?? "") != "")
          .length;
      answer = List.filled(count, "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HeaderCard(
        headerTitle: widget.header != null
            ? Text(
                widget.header!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 26, height: 2, color: Colors.white),
              )
            : null,
        widgetBody: (widget.body is String)
            ? Text(
                widget.body,
                textAlign: TextAlign.justify,
                style: const TextStyle(color: Colors.black, fontSize: 15.0),
              )
            : Form(
                key: _formKey,
                onChanged: () {
                  if (_formKey.currentState!.validate()) {
                    widget.answer.value = [answer.join(";")];
                  } else {
                    widget.answer.value = [];
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: FormField<List<String>>(
                  initialValue: answer,
                  validator: (List<String>? value) {
                    if (value == null) {
                      return 'Por favor responda todas as questões';
                    } else {
                      final count = value.where((item) => item != "").length;
                      if (count != value.length) {
                        return 'Por favor responda todas as questões';
                      }
                    }
                    return (null);
                  },
                  builder: (FormFieldState<List<String>> state) {
                    List<Map<String, dynamic>>? item = widget.body;
                    return MontaAlternativas(
                      length: item != null ? item.length : 1,
                      builder: (i) {
                        int contador = 0;
                        return Expanded(
                          child: Column(
                            children: <Widget>[
                                  if (item![i]['body_hasFrame'] != null)
                                    DisplayFrame(
                                      item: item[i],
                                      playMusic: widget.playMusic,
                                    ),
                                  if ((item[i]['body_hasFrame'] ?? false) ==
                                          true &&
                                      (item[i]['body'] ?? "") != "")
                                    const SizedBox(height: 15),
                                  if (item[i]['options'] != null)
                                    QuestionFrame(
                                      item: item[i],
                                      answerFunc: (value) {
                                        answer[contador++] = value;
                                        state.didChange(answer);
                                      },
                                    ),
                                ] +
                                ((item[i]['has_divider'] ?? false) == true
                                    ? <Widget>[
                                        const SizedBox(height: 15),
                                        const Divider(),
                                        const SizedBox(height: 15),
                                      ]
                                    : <Widget>[]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}

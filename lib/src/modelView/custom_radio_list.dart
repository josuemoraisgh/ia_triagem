import 'package:flutter/material.dart';
import 'package:ia_triagem/src/modelView/monta_alternativas.dart';
import 'package:ia_triagem/src/modelView/question_frame.dart';

class CustomRadioList extends StatefulWidget {
  final Function(String,int) answerFunc;
  final int? answerId;
  final String? description;
  final IconData? icon;
  final List<String> itens;
  final bool hasPrefiroNaoDizer;
  final int? optionsColumnsSize;
  final String? otherLabel;
  final Map<String, dynamic>? otherItem;
  const CustomRadioList({
    super.key,
    required this.answerFunc,
    this.description,
    this.icon,
    required this.itens,
    required this.hasPrefiroNaoDizer,
    this.otherLabel,
    this.otherItem,
    this.optionsColumnsSize, 
    this.answerId,
  });

  @override
  State<CustomRadioList> createState() => _CustomRadioListState();
}

class _CustomRadioListState extends State<CustomRadioList> {
  final _formKey = GlobalKey<FormState>();
  static const double fontSize = 18;
  String answer = "";
  String answerOther = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        if (_formKey.currentState!.validate()) {
          widget.answerFunc(
              "${answer == (widget.otherLabel ?? "Outro (Qual?)") ? answerOther : answer} - ${DateTime.now().toString()}",widget.answerId??0);
        } else {
          widget.answerFunc('',0);
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.description != null)
            Row(
              children: [
                if (widget.icon != null)
                  Icon(widget.icon!, color: Colors.black54),
                const SizedBox(width: 15),
                Text(
                  widget.description!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: fontSize,
                      color: Colors.black,
                      decorationColor: Colors.black),
                ),
              ],
            ),
          if (widget.description != null) const SizedBox(height: 15),
          FormField<String>(
            initialValue: answer,
            autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
            validator: (String? value) {
              if (value == null) {
                return 'Por favor escolha um item';
              } else {
                if (value.isEmpty) {
                  return 'Por favor escolha um item';
                }
              }
              return (null);
            },
            builder: (FormFieldState<String> state) => MontaAlternativas(
              optionsColumnsSize: widget.optionsColumnsSize,
              length: widget.itens.length,
              builder: (int id) => Expanded(
                child: RadioListTile(
                    //contentPadding: const EdgeInsets.all(2),
                    title: !widget.itens[id].contains('.png') &&
                            !widget.itens[id].contains('.mp3')
                        ? Text(widget.itens[id],
                            style: const TextStyle(fontSize: fontSize))
                        : Image.asset(
                            widget.itens[id],
                            height: 100.0,
                            width: 300.0,
                            alignment: Alignment.bottomCenter,
                          ),
                    value: widget.itens[id],
                    groupValue: answer,
                    onChanged: (String? e) {
                      answer = e.toString();
                      state.didChange(answer);
                    }),
              ),
              childList: <Widget>[
                if (widget.hasPrefiroNaoDizer)
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Prefiro não dizer",
                          style: TextStyle(fontSize: fontSize)),
                      value: "Prefiro não dizer",
                      groupValue: answer,
                      onChanged: (e) {
                        answer = e.toString();
                        state.didChange(answer);
                      },
                    ),
                  ),
                if (widget.otherItem != null)
                  Expanded(
                    child: RadioListTile(
                      title: Text(
                          widget.otherLabel == null
                              ? "Outro (Qual?)"
                              : widget.otherLabel!,
                          style: const TextStyle(fontSize: fontSize)),
                      value: widget.otherLabel == null
                          ? "other"
                          : widget.otherLabel!,
                      groupValue: answer,
                      onChanged: (value) {
                        answer = value.toString();
                        state.didChange("");
                      },
                    ),
                  ),
                if (answer == (widget.otherLabel ?? "other"))
                  Expanded(
                    child: QuestionFrame(
                      answerFunc: (value, i) {
                        answerOther = value.toString();
                        state.didChange(answerOther);
                      },
                      item: widget.otherItem!, 
                      answerId: 0,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'custom_icon_buttom_list.dart';
import 'custom_radio_list.dart';

class QuestionFrame extends StatefulWidget {
  final Map<String, dynamic> item;
  final dynamic Function(String) answerFunc;
  const QuestionFrame(
      {super.key, required this.item, required this.answerFunc});

  @override
  State<QuestionFrame> createState() => _QuestionFrameState();
}

class _QuestionFrameState extends State<QuestionFrame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widget.item['mim_size_awnser'] == null &&
              widget.item['max_size_awnser'] == null
          ? CustomRadioList(
              anwserFunc: widget
                  .answerFunc, //(value) => widget.answer.value = "$value; ${DateTime.now().toString()}",
              hasPrefiroNaoDizer: false,
              itens: widget.item['options'],
              optionsColumnsSize: widget.item['options_columns_size'],
              validator: (String? value) {
                if (value == null) {
                  return 'Por favor escolha um item';
                } else if (value.isEmpty) {
                  return 'Por favor escolha um item';
                }
                return (null);
              },
            )
          : CustomIconButtomList(
              answerFunc: widget.answerFunc,
              itens: widget.item['options'],
              optionsColumnsSize: widget.item['options_columns_size'],
              validator: (List<String>? value) {
                if (value == null) {
                  return 'Por favor escolha um item';
                } else if (value.length < widget.item['mim_size_awnser']) {
                  return 'Por favor escolha um item';
                } else if (value.length > widget.item['max_size_awnser']) {
                  return 'Por favor escolha um item';
                }
                return (null);
              },
            ),
    );
  }
}

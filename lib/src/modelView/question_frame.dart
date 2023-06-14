import 'package:flutter/material.dart';
import 'custom_radio_list.dart';

class QuestionFrame extends StatefulWidget {
  final Map<String, dynamic> item;
  final ValueNotifier<List<String>> answer;
  const QuestionFrame({super.key, required this.item, required this.answer});

  @override
  State<QuestionFrame> createState() => _QuestionFrameState();
}

class _QuestionFrameState extends State<QuestionFrame> {
  final _formKey = GlobalKey<FormState>();
  String answer = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        onChanged: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            widget.answer.value = [answer];
          } else {
            widget.answer.value = [];
          }
        },
        autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
        child: CustomRadioList(
          anwserFunc: (value) =>
              answer = "$value; ${DateTime.now().toString()}",
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
        ),
      ),
    );
  }
}

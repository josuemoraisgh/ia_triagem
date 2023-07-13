import 'package:flutter/material.dart';
import 'package:ia_triagem/src/modelView/custom_text_form_list.dart';
import 'package:ia_triagem/src/modelView/dots_line.dart';
import 'custom_check_box_list.dart';
import 'custom_select_icon_list.dart';
import 'custom_radio_list.dart';

class QuestionFrame extends StatefulWidget {
  final Map<String, dynamic> item;
  final int answerId;
  final dynamic Function(String, int) answerFunc;
  const QuestionFrame(
      {super.key, required this.item, required this.answerFunc, required this.answerId});

  @override
  State<QuestionFrame> createState() => _QuestionFrameState();
}

class _QuestionFrameState extends State<QuestionFrame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: switch (widget.item['options_style'] ?? 'radioList') {
        'radioList' => CustomRadioList(
            icon: widget.item['icon'],
            description: widget.item['title'],
            answerId:  widget.answerId,
            answerFunc: widget.answerFunc,
            hasPrefiroNaoDizer: widget.item['hasPrefiroNaoDizer'] ?? false,
            itens: widget.item['options'],
            otherLabel: widget.item['otherLabel'],
            otherItem: widget.item['otherItem'],
            optionsColumnsSize: widget.item['options_columns_size'],
          ),
        'dotLine' => DotsLine(
            answerId:  widget.answerId,          
            answerFunc: widget.answerFunc,
          ),
        'textForm' => CustomTextFormList(
            optionsColumnsSize: widget.item['options_columns_size'],
            answerId:  widget.answerId,            
            answerFunc: widget.answerFunc,
            itens: widget.item,
            validator: (List<String>? value) {
              if (value == null) {
                return 'Por favor escolha um item';
              } else {
                final count = value.where((item) => item != "").length;
                if (count < value.length) {
                  return 'Por favor escolha um item';
                }
              }
              return (null);
            },
          ),
        'selectIcon' => CustomSelectIconList(
            description: widget.item['title'],
            answerId:  widget.answerId,            
            answerFunc: widget.answerFunc,
            itens: widget.item['options'],
            optionsColumnsSize: widget.item['options_columns_size'],
            validator: (List<String>? value) {
              if (value == null) {
                return 'Por favor escolha um item';
              } else {
                final count = value.where((item) => item != "").length;
                if (count < widget.item['mim_size_awnser']) {
                  return 'Por favor escolha um item';
                } else if (count > widget.item['max_size_awnser']) {
                  return 'Por favor escolha um item';
                }
              }
              return (null);
            },
          ),
        'checkBox' => CustomCheckBoxList(
            description: widget.item['title'],
            answerId:  widget.answerId,            
            answerFunc: widget
                .answerFunc, //(value) => widget.answer.value = "$value; ${DateTime.now().toString()}",
            hasPrefiroNaoDizer: false,
            itens: widget.item['options'],
            optionsColumnsSize: widget.item['options_columns_size'],
            validator: (List<String>? value) {
              if (value == null) {
                return 'Por favor escolha um item';
              } else {
                final count = value.where((item) => item != "").length;
                if (count < widget.item['mim_size_awnser']) {
                  return 'Por favor escolha um item';
                } else if (count > widget.item['max_size_awnser']) {
                  return 'Por favor escolha um item';
                }
              }
              return (null);
            },
          ),
        _ => const Center(child: CircularProgressIndicator()), //Default value
      },
    );
  }
}

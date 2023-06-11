import 'package:flutter/material.dart';
import '../modules/home/parameters.dart';
import '../modelView/header_card.dart';

class TypeTextForm extends StatefulWidget {
  final int id;
  final ValueNotifier<List<String>> answer;
  const TypeTextForm({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeTextForm> createState() => _TypeTextFormState();
}

class _TypeTextFormState extends State<TypeTextForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> answer = [];

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      headerTitle: Text(
        telas[widget.id]!['header'],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 26, height: 2, color: Colors.white),
      ),
      widgetBody: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Colors.black),
          color: Colors.white,
        ),
        child: Form(
          key: _formKey,
          onChanged: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.answer.value = [answer.join(",")];
            } else {
              widget.answer.value = [];
            }
          },
          autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
          child: Column(
            children: _montaAternativas(),
          ),
        ),
      ),
    );
  }

  List<Widget> _montaAternativas() {
    List<Widget> widgetList = [];
    final bool hasText = (telas[widget.id]!['labelText'] as List).isEmpty;
    for (int i = 0; i < (telas[widget.id]!['labelText'] as List).length; i++) {
      answer.add("");
      if (hasText) {
        widgetList.add(const SizedBox(width: 15));
        widgetList.add(Text(
          telas[widget.id]!['options'][i],
          textAlign: TextAlign.justify,
          style: const TextStyle(
              fontSize: 35, color: Colors.black, decorationColor: Colors.black),
        ));
      }
      widgetList.add(const SizedBox(width: 15));
      widgetList.add(
        TextFormField(
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            icon: telas[widget.id]!['icons'] != null
                ? Icon(telas[widget.id]!['icons'][i])
                : null,
            labelText: telas[widget.id]!['labelText'][i],
          ),
          keyboardType: TextInputType.name,
          autovalidateMode: AutovalidateMode.always,
          validator: (value) {
            if (value == null) {
              return 'Opção invalida!! Corrija por favor';
            } else if ((value.isEmpty)) {
              return 'Opção invalida!! Corrija por favor';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              answer[i] = "$value; ${DateTime.now().toString()}";
            });
          },
        ),
      );
    }
    return (widgetList);
  }
}
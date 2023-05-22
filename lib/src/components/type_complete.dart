import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../modules/main/parameters.dart';
import 'header_card.dart';

class TypeComplete extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeComplete({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeComplete> createState() => _TypeCompleteState();
}

class _TypeCompleteState extends State<TypeComplete> {
  final _formKey = GlobalKey<FormState>();
  String seguencia = "";

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
              widget.answer.value = {'answer': seguencia};
            } else {
              widget.answer.value = {};
            }
          },
          autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
          child: Column(
            children: <Widget>[
              const SizedBox(width: 15),
              Text(
                telas[widget.id]!['op'],
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    decorationColor: Colors.black),
              ),
              const SizedBox(width: 15),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.attribution),
                    labelText: "Seguência *"),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == null) {
                    return 'Seguência invalida!! Corrija por favor';
                  } else if ((value.isEmpty)) {
                    return 'Seguência invalida!! Corrija por favor';
                  }
                  return null;
                },
                onChanged: (v) {
                  seguencia = v;
                  if (v.isNotEmpty) {
                    _formKey.currentState!.save();
                    widget.answer.value = {'answer': seguencia};
                  } else {
                    widget.answer.value = {};
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

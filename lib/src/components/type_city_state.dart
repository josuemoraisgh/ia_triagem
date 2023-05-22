import 'package:flutter/material.dart';
import '../modules/main/parameters.dart';
import 'header_card.dart';

class TypeCityState extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeCityState({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeCityState> createState() => _TypeCityStateState();
}

class _TypeCityStateState extends State<TypeCityState> {
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
              widget.answer.value = {'answer': answer};
            } else {
              widget.answer.value = {};
            }
          },
          autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
          child: Column(
            children:
                _montaAternativas(telas[widget.id]!['op'] as List<String>),
          ),
        ),
      ),
    );
  }

  List<Widget> _montaAternativas(List<String> items) {
    List<Widget> widgetList = [];
    for (int i = 0; i < items.length; i++) {
      answer.add("");
      widgetList.add(const SizedBox(width: 15));
      widgetList.add(
        TextFormField(
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            icon: const Icon(Icons.attribution),
            labelText: telas[widget.id]!['op'][i],
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
              answer[i] = value.toString();
            });
          },
        ),
      );
    }
    return (widgetList);
  }
}

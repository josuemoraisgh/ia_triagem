import 'package:flutter/material.dart';
import '../modelView/monta_alternativas.dart';
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
  late List<String> answer;

  @override
  void initState() {
    super.initState();
    answer = List.filled((telas[widget.id]!['options'] as List).length, "");
  }

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
          autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
          onChanged: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.answer.value = [answer.join(",")];
            } else {
              widget.answer.value = [];
            }
          },
          child: MontaAlternativas(
            length: (telas[widget.id]!['options'] as List).length,
            builder: (int i) => Expanded(
              child: Column(
                children: ((telas[widget.id]!['options'][i] != "" &&
                            telas[widget.id]!['options'][i] != null)
                        ? <Widget>[
                            const SizedBox(width: 15),
                            Text(
                              telas[widget.id]!['options'][i],
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  decorationColor: Colors.black),
                            ),
                          ]
                        : <Widget>[]) +
                    <Widget>[
                      const SizedBox(width: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          icon: telas[widget.id]!['icons'][i] != null
                              ? Icon(telas[widget.id]!['icons'][i])
                              : null,
                          labelText: telas[widget.id]!['labelText'][i],
                        ),
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (value) {
                          if (value == null) {
                            return 'Opção invalida!! Corrija por favor';
                          } else if (value == "") {
                            return 'Opção invalida!! Corrija por favor';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value != "") {
                            answer[i] = "$value; ${DateTime.now().toString()}";
                          } else {
                            answer[i] = "";
                          }
                          _formKey.currentState!.didChangeDependencies();
                        },
                      ),
                    ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

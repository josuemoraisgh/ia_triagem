import 'package:flutter/material.dart';
import '../modules/main/parameters.dart';
import 'header_card.dart';

class TypeIntel extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeIntel({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeIntel> createState() => _TypeIntelState();
}

class _TypeIntelState extends State<TypeIntel> {
  final _formKey = GlobalKey<FormState>();
  String answer = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HeaderCard(
        headerTitle: Text(
          telas[widget.id]!['header'],
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 26, height: 2, color: Colors.white),
        ),
        widgetBody: Column(
          children: [
            Container(
              decoration: telas[widget.id]!['modo_body'] == "image"
                  ? BoxDecoration(
                      border: Border.all(width: 3.0, color: Colors.black),
                      color: Colors.white,
                    )
                  : null,
              child: telas[widget.id]!['modo_body'] == "image"
                  ? telas[widget.id]!['body'] == ""
                      ? SizedBox(
                          height: telas[widget.id]!['height'] ?? 150.0,
                          width: 400.0,
                        )
                      : Image.asset(
                          telas[widget.id]!['body'], //assets/arvore2.png
                          height: telas[widget.id]!['height'] ?? 150.0,
                          width: 400.0,
                          alignment: Alignment.center,
                        )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 0, right: 10, bottom: 0),
                      child: Text(
                        telas[widget.id]!['body'],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decorationColor: Colors.black),
                      ),
                    ),
            ),
            if (!(telas[widget.id]!['modo_body'] == "text" &&
                telas[widget.id]!['body'] == ""))
              const Divider(),
            Form(
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
              child: FormField(
                initialValue: "",
                autovalidateMode: AutovalidateMode.always,
                builder: (FormFieldState<String> state) {
                  return _montaAternativas(
                      state, telas[widget.id]!['op'] as List<String>);
                },
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
          ],
        ),
      ),
    );
  }

  Widget _montaAternativas(FormFieldState<String> state, List<String> items) {
    List<Widget> widgetListRow = [], widgetListColumn = [];
    var tam = telas[widget.id]!['itens_row'] ?? 3;
    for (int j = 0; j <= (items.length / tam).floor(); j++) {
      for (int i = 0; (((j * tam) + i) < items.length) && (i < tam); i++) {
        widgetListRow.add(
          Expanded(
            child: RadioListTile(
              contentPadding:
                  const EdgeInsets.only(left: 2, top: 10, right: 2, bottom: 10),
              title: telas[widget.id]!['modo_op'] == 'image'
                  ? Image.asset(
                      telas[widget.id]!['op'][((j * tam) + i)],
                      height: 100.0,
                      width: 300.0,
                      alignment: Alignment.bottomCenter,
                    )
                  : Text(
                      telas[widget.id]!['op'][((j * tam) + i)],
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decorationColor: Colors.black),
                    ),
              value: ((j * tam) + i).toString(),
              groupValue: answer,
              onChanged: (value) {
                setState(() {
                  answer = value.toString();
                  state.didChange(answer);
                });
              },
            ),
          ),
        );
      }
      widgetListColumn.add(Row(children: widgetListRow));
      widgetListRow = [];
    }
    return Column(children: (widgetListColumn));
  }
}

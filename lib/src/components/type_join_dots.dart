import 'package:flutter/material.dart';
import '../modules/main/parameters.dart';
import 'header_card.dart';

class TypeJoinDots extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeJoinDots({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeJoinDots> createState() => _TypeJoinDotsState();
}

class _TypeJoinDotsState extends State<TypeJoinDots> {
  final _formKey = GlobalKey<FormState>();
  String answer = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.answer.value = {'answer': ''};
    return Column(
      children: [
        HeaderCard(
          headerTitle: telas[widget.id]!['header'] == ""
              ? null
              : Text(
                  telas[widget.id]!['header'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 26, height: 2, color: Colors.white),
                ),
          widgetBody: Padding(
              padding: const EdgeInsets.all(8.0),
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
                child: FormField(
                  initialValue: "",
                  autovalidateMode: AutovalidateMode.always,
                  builder: (FormFieldState<String> state) {
                    return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: _montaAternativas(
                              state, telas[widget.id]!['op'] as List<String>),
                        ));
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
              )),
        ),
        const SizedBox(height: 10),
        HeaderCard(
          headerTitle: null,
          widgetBody: Image.asset(
            telas[widget.id]!['image'], //assets/arvore2.png
            height: 400.0,
            width: 400.0,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ],
    );
  }

  List<Widget> _montaAternativas(
      FormFieldState<String> state, List<String> items) {
    List<Widget> widgetList = [];
    for (int i = 0; i < items.length; i++) {
      widgetList.add(
        RadioListTile(
          title: Text(items[i], style: const TextStyle(fontSize: 24.0)),
          value: items[i],
          groupValue: answer,
          onChanged: (value) {
            setState(() {
              answer = value.toString();
              state.didChange(answer);
            });
          },
        ),
      );
    }
    return (widgetList);
  }
}

import 'package:flutter/material.dart';
import 'package:ia_triagem/src/modelView/monta_alternativas.dart';

class CustomTextFormList extends StatefulWidget {
  final Map<String, dynamic> itens;
  final int? optionsColumnsSize;
  final void Function(String) answerFunc;
  final String? Function(List<String>?)? validator;
  const CustomTextFormList(
      {super.key,
      required this.answerFunc,
      this.validator,
      required this.itens,
      this.optionsColumnsSize});

  @override
  State<CustomTextFormList> createState() => _CustomTextFormListState();
}

class _CustomTextFormListState extends State<CustomTextFormList> {
  late List<String> answer;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    answer = List.filled(widget.itens['options']?.length ?? 1, "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          widget.answerFunc(answer.join(';'));
        } else {
          widget.answerFunc('');
        }
      },
      autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
      child: FormField<List<String>>(
        initialValue: answer,
        autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
        validator: widget.validator,
        builder: (FormFieldState<List<String>> state) => MontaAlternativas(
          optionsColumnsSize: widget.optionsColumnsSize,
          length: widget.itens['options']?.length ?? 1,
          builder: (int id) => Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ((widget.itens['title']?[id] ?? "") != ""
                      ? <Widget>[
                          const SizedBox(width: 15),
                          Center(
                            child: Text(
                              widget.itens['title']![id],
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  decorationColor: Colors.black),
                            ),
                          ),
                        ]
                      : <Widget>[]) +
                  <Widget>[
                    const SizedBox(width: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        icon: widget.itens['icons']?[id] != null
                            ? Icon(widget.itens['icons']![id])
                            : null,
                        labelText: widget.itens['options']?[id],
                      ),
                      keyboardType: widget.itens['keyboardType']?[id],
                      inputFormatters: widget.itens['inputFormatters']?[id],
                      autovalidateMode: AutovalidateMode.always,
                      validator: widget.itens['validator']?[id] ??
                          ((value) {
                            if (value == null) {
                              return 'Opção invalida!! Corrija por favor';
                            } else if (value == "") {
                              return 'Opção invalida!! Corrija por favor';
                            }
                            return null;
                          }),
                      onChanged: (value) {
                        setState(
                          () {
                            if (value != "") {
                              answer[id] =
                                  "$value - ${DateTime.now().toString()}";
                            } else {
                              answer[id] = "";
                            }
                            state.didChange(answer);
                          },
                        );
                      },
                    ),
                  ],
            ),
          ),
        ),
      ),
    );
  }
}
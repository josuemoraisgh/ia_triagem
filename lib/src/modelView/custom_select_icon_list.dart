import 'package:flutter/material.dart';
import 'package:ia_triagem/src/modelView/monta_alternativas.dart';

class CustomSelectIconList extends StatefulWidget {
  final Function(String) answerFunc;
  final String? description;
  final Icon? icon;
  final List<String> itens;
  final int? optionsColumnsSize;
  final String? Function(List<String>?)? validator;
  const CustomSelectIconList({
    super.key,
    required this.answerFunc,
    this.description,
    this.icon,
    required this.itens,
    this.validator,
    this.optionsColumnsSize,
  });

  @override
  State<CustomSelectIconList> createState() => _CustomSelectIconListState();
}

class _CustomSelectIconListState extends State<CustomSelectIconList> {
  late List<String> answers;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    answers = List.filled(widget.itens.length, "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          widget.answerFunc(answers.join(";"));
        } else {
          widget.answerFunc("");
        }
      },
      autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
      child: FormField<List<String>>(
        initialValue: answers,
        autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
        validator: widget.validator,
        builder: (FormFieldState<List<String>> state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.description != null)
              Row(
                children: [
                  if (widget.icon != null) widget.icon!,
                  const SizedBox(width: 15),
                  Text(
                    widget.description!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decorationColor: Colors.black),
                  ),
                ],
              ),
            if (widget.description != null) const SizedBox(height: 15),
            MontaAlternativas(
              length: widget.itens.length,
              optionsColumnsSize: widget.optionsColumnsSize,
              builder: (int i) => Expanded(
                child: TextButton(
                  child: Image.asset(widget.itens[i],
                      opacity: answers[i] != ""
                          ? null
                          : const AlwaysStoppedAnimation(.3)),
                  onPressed: () {
                    setState(() {
                      if (answers[i] != "") {
                        answers[i] = "";
                      } else {
                        answers[i] =
                            "${widget.itens[i]} - ${DateTime.now().toString()}";
                      }
                      state.didChange(answers);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CustomIconButtomList extends StatefulWidget {
  final Function(String) answerFunc;
  final String? description;
  final Icon? icon;
  final List<String> itens;
  final int? optionsColumnsSize;
  final String? Function(List<String>?)? validator;
  const CustomIconButtomList({
    super.key,
    required this.answerFunc,
    this.description,
    this.icon,
    required this.itens,
    this.validator,
    this.optionsColumnsSize,
  });

  @override
  State<CustomIconButtomList> createState() => _CustomIconButtomListState();
}

class _CustomIconButtomListState extends State<CustomIconButtomList> {
  final _formKey = GlobalKey<FormState>();
  late List<String> answer;
  @override
  void initState() {
    super.initState();
    answer = List.filled(widget.itens.length, "");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          widget.answerFunc(answer.join(";"));
        } else {
          widget.answerFunc("");
        }
      },
      autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
      child: Column(
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
          _montaAternativas(answer),
        ],
      ),
    );
  }

  Widget _montaAternativas(List<String> answer) {
    List<Widget> widgetListRow = [];
    for (int i = 0; i < answer.length; i++) {
      widgetListRow.add(
        FormField<List<String>>(
          initialValue: answer,
          autovalidateMode: AutovalidateMode.always,
          builder: (FormFieldState<List<String>> state) {
            return Expanded(
              child: TextButton(
                //contentPadding: const EdgeInsets.all(2),
                child: Image.asset(widget.itens[i],
                    opacity: answer[i] == widget.itens[i]
                        ? null
                        : const AlwaysStoppedAnimation(.3)),
                onPressed: () {
                  if (answer[i] == widget.itens[i]) {
                    answer[i] = "";
                  } else {
                    answer[i] = widget.itens[i];
                  }
                  state.didChange(answer);
                },
              ),
            );
          },
          validator: widget.validator,
        ),
      );
    }
    widgetListRow = widgetListRow
        .slices(widget.optionsColumnsSize ?? 1)
        .map<Widget>(
          (e) => Row(children: e),
        )
        .toList();
    return Column(children: (widgetListRow));
  }
}

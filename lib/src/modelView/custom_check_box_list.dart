import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ia_triagem/src/modelView/monta_alternativas.dart';

class CustomCheckBoxList extends StatefulWidget {
  final Function(String) anwserFunc;
  final String? description;
  final Icon? icon;
  final List<String> itens;
  final String? otherLabel;
  final bool hasPrefiroNaoDizer;
  final int? optionsColumnsSize;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  const CustomCheckBoxList({
    super.key,
    required this.anwserFunc,
    this.description,
    this.icon,
    required this.itens,
    required this.hasPrefiroNaoDizer,
    this.otherLabel,
    this.labelText,
    this.inputFormatters,
    this.validator,
    this.optionsColumnsSize,
  });

  @override
  State<CustomCheckBoxList> createState() => _CustomCheckBoxListState();
}

class _CustomCheckBoxListState extends State<CustomCheckBoxList> {
  static const double fontSize = 18;
  String anwser = "";
  String anwserOther = "";

  @override
  Widget build(BuildContext context) {
    return Column(
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
          optionsColumnsSize: widget.optionsColumnsSize,
          length: widget.itens.length,
          builder: (int id) => Expanded(
            child: CheckboxListTile(
              //contentPadding: const EdgeInsets.all(2),
              title: !widget.itens[id].contains('.png') &&
                      !widget.itens[id].contains('.mp3')
                  ? Text(widget.itens[id],
                      style: const TextStyle(fontSize: fontSize))
                  : Image.asset(
                      widget.itens[id],
                      height: 100.0,
                      width: 300.0,
                      alignment: Alignment.bottomCenter,
                    ),
              value: anwser != "",
              onChanged: (e) {
                anwser = e.toString();
                if (anwser.isNotEmpty) {
                  widget.anwserFunc("$anwser - ${DateTime.now().toString()}");
                } else {
                  widget.anwserFunc("");
                }
              },
            ),
          ),
        )
      ],
    );
  }
}

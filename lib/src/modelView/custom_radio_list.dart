import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ia_triagem/src/modelView/monta_alternativas.dart';

class CustomRadioList extends StatefulWidget {
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
  const CustomRadioList({
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
  State<CustomRadioList> createState() => _CustomRadioListState();
}

class _CustomRadioListState extends State<CustomRadioList> {
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
            child: RadioListTile(
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
              value: widget.itens[id],
              groupValue: anwser,
              onChanged: (e) {
                anwser = e.toString();
                widget.anwserFunc(anwser);
              },
            ),
          ),
          childList: <Widget>[
            if (widget.hasPrefiroNaoDizer)
              Expanded(
                child: RadioListTile(
                  title: const Text("Prefiro não dizer",
                      style: TextStyle(fontSize: fontSize)),
                  value: "Prefiro não dizer",
                  groupValue: anwser,
                  onChanged: (e) {
                    anwser = e.toString();
                    widget.anwserFunc(anwser);
                  },
                ),
              ),
            if (widget.labelText != null)
              Expanded(
                child: RadioListTile(
                  title: Text(
                      widget.otherLabel == null
                          ? "Outro (Qual?)"
                          : widget.otherLabel!,
                      style: const TextStyle(fontSize: fontSize)),
                  value:
                      widget.otherLabel == null ? "other" : widget.otherLabel!,
                  groupValue: anwser,
                  onChanged: (value) {
                    anwser = value.toString();
                  },
                ),
              ),
            if (anwser ==
                (widget.otherLabel == null ? "other" : widget.otherLabel!))
              Expanded(
                child: TextFormField(
                  initialValue: anwserOther,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: widget.labelText,
                  ),
                  keyboardType: TextInputType.name,
                  inputFormatters: widget.inputFormatters,
                  autovalidateMode: AutovalidateMode.always,
                  validator: widget.validator,
                  onChanged: (value) {
                    anwserOther = value.toString();
                    widget.anwserFunc(anwserOther);
                  },
                ),
              ),
          ],
        )
      ],
    );
  }
}

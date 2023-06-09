import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomRadioList extends StatefulWidget {
  final Function(String) anwserFunc;
  final String? description;
  final Icon? icon;
  final List<String> itens;
  final String? otherLabel;
  final bool hasPrefiroNaoDizer;
  final bool? optionsIsText;
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
    this.optionsIsText,
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
        FormField(
          initialValue: anwser,
          autovalidateMode: AutovalidateMode.always,
          builder: (FormFieldState<String> state) {
            return _montaAternativas(state);
          },
          validator: widget.validator,
        ),
      ],
    );
  }

  Widget _montaAternativas(FormFieldState<String> state) {
    List<Widget> widgetListRow = widget.itens
            .map(
              (iten) => Expanded(
                child: RadioListTile(
                  //contentPadding: const EdgeInsets.all(2),
                  title: widget.optionsIsText ?? true
                      ? Text(iten, style: const TextStyle(fontSize: fontSize))
                      : Image.asset(
                          iten,
                          height: 100.0,
                          width: 300.0,
                          alignment: Alignment.bottomCenter,
                        ),
                  value: iten,
                  groupValue: anwser,
                  onChanged: (e) {
                    anwser = e.toString();
                    widget.anwserFunc(anwser);
                    state.didChange(anwser);
                  },
                ),
              ),
            )
            .toList()
            .cast<Widget>() +
        <Widget>[
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
                  state.didChange(anwser);
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
                value: widget.otherLabel == null ? "other" : widget.otherLabel!,
                groupValue: anwser,
                onChanged: (value) {
                  anwser = value.toString();
                  state.didChange(anwser);
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
                  state.didChange(anwserOther);
                },
              ),
            ),
        ];
    widgetListRow = widgetListRow
        .slices(widget.optionsColumnsSize ?? 1)
        .map<Widget>(
          (e) => Row(children: e),
        )
        .toList();
    return Column(children: (widgetListRow));
  }
}

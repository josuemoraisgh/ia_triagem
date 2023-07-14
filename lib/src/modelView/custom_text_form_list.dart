import 'package:flutter/material.dart';
import 'package:ia_triagem/src/modelView/monta_alternativas.dart';

class CustomTextFormList extends StatefulWidget {
  final Map<String, dynamic> itens;
  final int? optionsColumnsSize;
  final Function(String, int) answerFunc;
  final int? answerId;
  const CustomTextFormList(
      {super.key,
      required this.answerFunc,
      required this.itens,
      this.optionsColumnsSize,
      this.answerId});

  @override
  State<CustomTextFormList> createState() => _CustomTextFormListState();
}

class _CustomTextFormListState extends State<CustomTextFormList> {
  late List<String> answer;
  late List<TextEditingController> textEditingController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    answer = List.filled(widget.itens['options']?.length ?? 1, "");
    textEditingController = List.filled(
        widget.itens['options']?.length ?? 1, TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          widget.answerFunc(answer.join(';'), widget.answerId ?? 0);
        } else {
          widget.answerFunc('', widget.answerId ?? 0);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Colors.black),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
          child: MontaAlternativas(
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
                      widget.itens['options_fix']?[id] == null
                          ? _montaEdit(id)
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                widget.itens['options_fix']?[id][0] == "-"
                                    ? _montaEdit(id)
                                    : _montaTexto(id),
                                const SizedBox(width: 5),
                                widget.itens['options_fix']?[id][0] == "-"
                                    ? _montaTexto(id)
                                    : _montaEdit(id),
                              ],
                            ),
                    ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration myContainerDecoration() {
    return BoxDecoration(
      border: Border.all(width: 3.0, color: Colors.redAccent),
      color: Colors.white70,
    );
  }

  Widget _montaTexto(int id) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 100,
      decoration: myContainerDecoration(),
      child: Text(
        widget.itens['options_fix']?[id] ?? "",
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }

  Widget _montaEdit(int id) {
    return TextFormField(
      initialValue: answer[id],
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        icon: widget.itens['icons']?[id] != null
            ? Icon(widget.itens['icons']![id])
            : null,
        labelText: widget.itens['options']?[id],
      ),
      keyboardType: widget.itens['keyboardType']?[id],
      inputFormatters: widget.itens['inputFormatters']?[id],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        final String? condicao = widget.itens['validator']?[id](value);
        if (condicao != null) {
          answer[id] = "";
          return condicao;
        }
        answer[id] = "$value - ${DateTime.now().toString()}";
        return null;
      },
    );
  }
}

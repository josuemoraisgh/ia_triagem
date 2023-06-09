import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../modelView/custom_radio_list.dart';
import '../modules/home/parameters.dart';
import '../modelView/header_card.dart';

class TypeLaudo extends StatefulWidget {
  final int id;
  final ValueNotifier<List<String>> answer;
  const TypeLaudo({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeLaudo> createState() => _TypeLaudoState();
}

class _TypeLaudoState extends State<TypeLaudo> {
  final _formKey = GlobalKey<FormState>();
  String hasLaudo = "";
  String typeLaudo = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          if (hasLaudo == "não") typeLaudo = "";
          widget.answer.value = [hasLaudo == "não" ? "não" : typeLaudo];
        } else {
          widget.answer.value = [];
        }
      },
      autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderCard(
            headerTitle: Text(
              telas[widget.id]!['header'],
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 26, height: 2, color: Colors.white),
            ),
            widgetBody: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  FormField(
                    initialValue: hasLaudo,
                    autovalidateMode: AutovalidateMode.always,
                    builder: (FormFieldState<String> state) {
                      return Column(
                        children: [
                          RadioListTile(
                            title: const Text("Não",
                                style: TextStyle(
                                  fontSize: 26,
                                )),
                            value: "não",
                            groupValue: hasLaudo,
                            onChanged: (value) {
                              setState(() {
                                hasLaudo = value.toString();
                                state.didChange(hasLaudo);
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("Sim",
                                style: TextStyle(
                                  fontSize: 26,
                                )),
                            value: "sim",
                            groupValue: hasLaudo,
                            onChanged: (value) {
                              setState(() {
                                hasLaudo = value.toString();
                                state.didChange(hasLaudo);
                              });
                            },
                          ),
                        ],
                      );
                    },
                    validator: (String? value) {
                      if (value == null) {
                        return 'Por favor escolha um item';
                      } else if (value.isEmpty) {
                        return 'Por favor escolha um item';
                      } else if ((value == 'sim') && (typeLaudo == "")) {
                        return 'Por favor escolha um item';
                      }
                      return (null);
                    },
                  ),
                  if (hasLaudo == 'sim')
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 15),
                        const Divider(),
                        const SizedBox(height: 15),
                        CustomRadioList(
                          anwserFunc: (value) => typeLaudo =
                              "$value; ${DateTime.now().toString()}",
                          description:
                              "Caso afirmativo, selecione o diagnóstico\n correspondente. *",
                          icon: const Icon(Icons.admin_panel_settings,
                              color: Colors.black54),
                          hasPrefiroNaoDizer: false,
                          itens: const [
                            "Transtornos de Ansiedade",
                            "Transtornos Alimentares",
                            "Transtorno Bipolar",
                            "Transtornos Depressivos",
                            "Transtorno Obsessivo-compulsivo",
                            "Transtorno da personalidade borderline",
                            "Transtorno da personalidade histriônica",
                            "Transtorno da personalidade narcisista",
                            "Transtorno da personalidade paranoide",
                          ],
                          otherLabel: "Outro tipo de transtorno",
                          labelText:
                              'Digite a denominação desse outro tipo de transtorno',
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          validator: (value) {
                            if (hasLaudo == 'sim') {
                              if (value == null) {
                                return 'Digite a denominação desse outro tipo de transtorno';
                              } else if (value.length < 4) {
                                return 'Digite a denominação desse outro tipo de transtorno';
                              }
                            }
                            return null;
                          },
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

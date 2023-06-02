import 'package:flutter/material.dart';
import '../modules/home/parameters.dart';
import 'header_card.dart';

class TypeLaudo extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeLaudo({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeLaudo> createState() => _TypeLaudoState();
}

class _TypeLaudoState extends State<TypeLaudo> {
  final _formKey = GlobalKey<FormState>();
  String hasLaudo = "";
  String typeLaudo = "";
  String outroNome = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        if (_formKey.currentState!.validate() || hasLaudo == "nao") {
          _formKey.currentState!.save();
          widget.answer.value = {
            'laudo': hasLaudo == "sim"
                ? typeLaudo == 'outro'
                    ? outroNome
                    : typeLaudo
                : "não",
          };
        } else {
          widget.answer.value = {};
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
                      } else if ((value == 'sim') &&
                          (typeLaudo == "outro") &&
                          (outroNome == "")) {
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
                        const Row(
                          children: [
                            Icon(Icons.admin_panel_settings,
                                color: Colors.black54),
                            SizedBox(width: 15),
                            Text(
                              "Caso afirmativo, selecione o diagnóstico\n correspondente. *",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  decorationColor: Colors.black),
                            ),
                          ],
                        ),
                        FormField(
                          initialValue: "",
                          autovalidateMode: AutovalidateMode.always,
                          builder: (FormFieldState<String> state1) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  RadioListTile(
                                    title: const Text(
                                        "Transtornos de Ansiedade",
                                        style: TextStyle(fontSize: 13)),
                                    value: "ansiedade",
                                    groupValue: typeLaudo,
                                    onChanged: (value) {
                                      typeLaudo = value.toString();
                                      state1.didChange(typeLaudo);
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text("Transtornos Alimentares",
                                        style: TextStyle(fontSize: 13)),
                                    value: "alimentares",
                                    groupValue: typeLaudo,
                                    onChanged: (value) {
                                      typeLaudo = value.toString();
                                      state1.didChange(typeLaudo);
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text("Transtorno Bipolar",
                                        style: TextStyle(fontSize: 13)),
                                    value: "bipolar",
                                    groupValue: typeLaudo,
                                    onChanged: (value) {
                                      typeLaudo = value.toString();
                                      state1.didChange(typeLaudo);
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text("Transtornos Depressivos",
                                        style: TextStyle(fontSize: 13)),
                                    value: "depressivos",
                                    groupValue: typeLaudo,
                                    onChanged: (value) {
                                      typeLaudo = value.toString();
                                      state1.didChange(typeLaudo);
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text(
                                        "Transtorno Obsessivo-compulsivo",
                                        style: TextStyle(fontSize: 13)),
                                    value: "obsessivo-compulsivo",
                                    groupValue: typeLaudo,
                                    onChanged: (value) {
                                      typeLaudo = value.toString();
                                      state1.didChange(typeLaudo);
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text(
                                        "Transtorno da personalidade borderline",
                                        style: TextStyle(fontSize: 13)),
                                    value: "borderline",
                                    groupValue: typeLaudo,
                                    onChanged: (value) {
                                      typeLaudo = value.toString();
                                      state1.didChange(typeLaudo);
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text(
                                        "Transtorno da personalidade histriônica",
                                        style: TextStyle(fontSize: 13)),
                                    value: "histriônica",
                                    groupValue: typeLaudo,
                                    onChanged: (value) {
                                      typeLaudo = value.toString();
                                      state1.didChange(typeLaudo);
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text(
                                        "Transtorno da personalidade narcisista",
                                        style: TextStyle(fontSize: 13)),
                                    value: "narcisista",
                                    groupValue: typeLaudo,
                                    onChanged: (value) {
                                      typeLaudo = value.toString();
                                      state1.didChange(typeLaudo);
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text(
                                        "Transtorno da personalidade paranoide",
                                        style: TextStyle(fontSize: 13)),
                                    value: "paranoide",
                                    groupValue: typeLaudo,
                                    onChanged: (value) {
                                      typeLaudo = value.toString();
                                      state1.didChange(typeLaudo);
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text(
                                        "Outro tipo de transtorno",
                                        style: TextStyle(fontSize: 13)),
                                    value: "outro",
                                    groupValue: typeLaudo,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          typeLaudo = value.toString();
                                          state1.didChange(typeLaudo);
                                        },
                                      );
                                    },
                                  ),
                                  if (typeLaudo == 'outro')
                                    TextFormField(
                                      initialValue: outroNome,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Digite a denominação desse outro tipo de transtorno',
                                      ),
                                      keyboardType: TextInputType.name,
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Digite a denominação desse outro tipo de transtorno';
                                        } else if (value.length < 4) {
                                          return 'Digite a denominação desse outro tipo de transtorno';
                                        }
                                        return null;
                                      },
                                      onChanged: (v) =>
                                          setState(() => outroNome = v),
                                    ),
                                ],
                              ),
                            );
                          },
                          validator: (String? value) {
                            if (value == null) {
                              return 'Por favor escolha um item';
                            } else if (value.length < 3) {
                              return 'Por favor escolha um item';
                            }
                            return (null);
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

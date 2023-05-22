import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../modules/main/parameters.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'header_card.dart';

class TypeQuest extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeQuest({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeQuest> createState() => _TypeQuestState();
}

class _TypeQuestState extends State<TypeQuest> {
  final _formKey = GlobalKey<FormState>();
  String idade = "";
  String gender = "";
  String schooling = "";
  String time = "";
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          widget.answer.value = {
            'idade': idade,
            'genero': gender,
            'schooling': schooling,
            'time': time,
            'data': data
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
            widgetBody: Text(telas[widget.id]!['header'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 26, height: 2, color: Colors.black)),
          ),
          const SizedBox(height: 10),
          HeaderCard(
            headerTitle: const Text(
              "Informações Gerais",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, height: 2, color: Colors.white),
            ),
            widgetBody: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.attribution),
                        labelText: "Idade *"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (value == null) {
                        return 'Idade invalida!! Corrija por favor';
                      } else if ((value.isEmpty) ||
                          (int.parse(value) <= 0) ||
                          (int.parse(value) >= 130)) {
                        return 'Idade invalida!! Corrija por favor';
                      }
                      return null;
                    },
                    onChanged: (v) => setState(() {
                      idade = v;
                      _formKey.currentState!.didChangeDependencies();
                    }),
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      Icon(Icons.grid_view_rounded, color: Colors.black54),
                      SizedBox(width: 15),
                      Text(
                        "Gênero *",
                        textAlign: TextAlign.start,
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
                    builder: (FormFieldState<String> state) {
                      return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              RadioListTile(
                                title: const Text("Masculino",
                                    style: TextStyle(fontSize: 13)),
                                value: "male",
                                groupValue: gender,
                                onChanged: (value) {
                                  gender = value.toString();
                                  state.didChange(gender);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Feminino",
                                    style: TextStyle(fontSize: 13)),
                                value: "female",
                                groupValue: gender,
                                onChanged: (value) {
                                  gender = value.toString();
                                  state.didChange(gender);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Outro",
                                    style: TextStyle(fontSize: 13)),
                                value: "other",
                                groupValue: gender,
                                onChanged: (value) {
                                  gender = value.toString();
                                  state.didChange(gender);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Prefiro não dizer",
                                    style: TextStyle(fontSize: 13)),
                                value: "Prefiro não dizer",
                                groupValue: gender,
                                onChanged: (value) {
                                  gender = value.toString();
                                  state.didChange(gender);
                                },
                              ),
                            ],
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
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      Icon(Icons.admin_panel_settings, color: Colors.black54),
                      SizedBox(width: 15),
                      Text(
                        "Escolaridade *",
                        textAlign: TextAlign.start,
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
                    builder: (FormFieldState<String> state) {
                      return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              RadioListTile(
                                title: const Text(
                                    "Nível fundamental completo (antiga 4º série completa)",
                                    style: TextStyle(fontSize: 13)),
                                value: "fundamental",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Nível básico completo",
                                    style: TextStyle(fontSize: 13)),
                                value: "basico",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Nível médio completo",
                                    style: TextStyle(fontSize: 13)),
                                value: "medio",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Nível superior completo",
                                    style: TextStyle(fontSize: 13)),
                                value: "superior",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                            ],
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
                  TextFormField(
                    initialValue: time,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.lock_clock),
                        labelText: 'Que horas é agora?'),
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      HoraInputFormatter(),
                    ],
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (value == null) {
                        return 'Horário Inválido!!';
                      } else if ((value.isEmpty) || (value.length != 5)) {
                        return 'Horário Inválido!!';
                      }
                      return null;
                    },
                    onChanged: (v) => setState(() => time = v),
                  ),
                  TextFormField(
                    initialValue: data,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.date_range),
                        labelText: 'Qual é a data de hoje?'),
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter(),
                    ],
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (value == null) {
                        return 'Data atual Incorreta!!';
                      } else if ((value.isEmpty) || (value.length != 10)) {
                        return 'Data atual Incorreta!!';
                      }
                      return null;
                    },
                    onChanged: (v) => setState(() => data = v),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

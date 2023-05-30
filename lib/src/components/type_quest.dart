import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String schooling = "";
  String time = "";
  String data = "";
  String gender = "";
  String genderother = "";
  String generoRegistro = "";
  String raca = "";
  String isUnicoIrmao = "";
  String qtdadeIrmaos = "";
  String estadocivil = "";
  String possuiFilhos = "";
  String qtdadefilhos = "";
  String qtdadefilhosmenores = "";
  String possuiReligiao = "";
  String religiao = "";
  String renda = "";
  String laudosaudemental = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          widget.answer.value = {
            'data': data,
            'time': time,
            'idade': idade,
            'genero': gender == 'other' ? genderother : gender,
            'generoRegistro': generoRegistro,
            'raça': raca,
            'qtdadeirmaos': isUnicoIrmao == "Não" ? qtdadeIrmaos : "0",
            "estadocivil": estadocivil,
            'qtdadefilhos': possuiFilhos == "Sim" ? qtdadefilhos : "0",
            'qtdadefilhosmenores': qtdadefilhosmenores,
            'religiao':
                possuiReligiao == "Tenho religião" ? religiao : "Sem religião",
            'schooling': schooling,
            'renda': renda,
          };
        } else {
          widget.answer.value = {};
        }
      },
      autovalidateMode: AutovalidateMode.always, //.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          HeaderCard(
            headerTitle: const Text(
              "Questionário Sociodemográfico",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, height: 2, color: Colors.white),
            ),
            widgetBody: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: time,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.lock_clock),
                        labelText: 'Que horas são neste instante?'),
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
                        labelText: 'Data de hoje?'),
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
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.cake),
                        labelText: "Qua a sua Idade?"),
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
                      Icon(Icons.transgender, color: Colors.black54),
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
                                title: const Text("Outro (Qual?)",
                                    style: TextStyle(fontSize: 13)),
                                value: "other",
                                groupValue: gender,
                                onChanged: (value) {
                                  gender = value.toString();
                                  state.didChange(gender);
                                },
                              ),
                              if (gender == 'other')
                                TextFormField(
                                  initialValue: genderother,
                                  decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Qual o seu gênero?"),
                                  keyboardType: TextInputType.name,
                                  inputFormatters: [
                                    FilteringTextInputFormatter
                                        .singleLineFormatter,
                                  ],
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Descrição invalida!! Corrija por favor';
                                    } else if ((value.isEmpty) ||
                                        (value.length < 3)) {
                                      return 'Descrição invalida!! Corrija por favor';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => setState(
                                    () {
                                      genderother = value.toString();
                                      _formKey.currentState!
                                          .didChangeDependencies();
                                    },
                                  ),
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
                      Icon(Icons.wc, color: Colors.black54),
                      SizedBox(width: 15),
                      Text(
                        "Qual foi o sexo atribuído no seu nascimento?",
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
                                title: const Text("Feminino",
                                    style: TextStyle(fontSize: 13)),
                                value: "female",
                                groupValue: generoRegistro,
                                onChanged: (value) {
                                  generoRegistro = value.toString();
                                  state.didChange(generoRegistro);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Masculino",
                                    style: TextStyle(fontSize: 13)),
                                value: "male",
                                groupValue: generoRegistro,
                                onChanged: (value) {
                                  generoRegistro = value.toString();
                                  state.didChange(generoRegistro);
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
                      Icon(Icons.person, color: Colors.black54),
                      SizedBox(width: 15),
                      Text(
                        "Assinale a alternativa que identifica a sua Cor ou Raça:",
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
                                title: const Text("Preta",
                                    style: TextStyle(fontSize: 13)),
                                value: "Preta",
                                groupValue: raca,
                                onChanged: (value) {
                                  raca = value.toString();
                                  state.didChange(raca);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Branca",
                                    style: TextStyle(fontSize: 13)),
                                value: "Branca",
                                groupValue: raca,
                                onChanged: (value) {
                                  raca = value.toString();
                                  state.didChange(raca);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Parda",
                                    style: TextStyle(fontSize: 13)),
                                value: "Parda",
                                groupValue: raca,
                                onChanged: (value) {
                                  raca = value.toString();
                                  state.didChange(raca);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Amarela",
                                    style: TextStyle(fontSize: 13)),
                                value: "Amarela",
                                groupValue: raca,
                                onChanged: (value) {
                                  raca = value.toString();
                                  state.didChange(raca);
                                },
                              ),
                              RadioListTile(
                                title: const Text("IndÍgena",
                                    style: TextStyle(fontSize: 13)),
                                value: "IndÍgena",
                                groupValue: raca,
                                onChanged: (value) {
                                  raca = value.toString();
                                  state.didChange(raca);
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
                      Icon(Icons.diversity_3, color: Colors.black54),
                      SizedBox(width: 15),
                      Text(
                        "Dentro de sua família, você é o(a) único(a) filho(a)?",
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
                                title: const Text("Sim",
                                    style: TextStyle(fontSize: 13)),
                                value: "Sim",
                                groupValue: isUnicoIrmao,
                                onChanged: (value) {
                                  isUnicoIrmao = value.toString();
                                  state.didChange(isUnicoIrmao);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Não",
                                    style: TextStyle(fontSize: 13)),
                                value: "Não",
                                groupValue: isUnicoIrmao,
                                onChanged: (value) {
                                  isUnicoIrmao = value.toString();
                                  state.didChange(isUnicoIrmao);
                                },
                              ),
                              if (isUnicoIrmao == "Não")
                                TextFormField(
                                  initialValue: qtdadeIrmaos,
                                  decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Quantos irmãos voçê tem?"),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Quantidade invalida!! Corrija por favor';
                                    } else if ((value.isEmpty)) {
                                      return 'Quantidade invalida!! Corrija por favor';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => setState(
                                    () {
                                      qtdadeIrmaos = value.toString();
                                      _formKey.currentState!
                                          .didChangeDependencies();
                                    },
                                  ),
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
                      Icon(Icons.person, color: Colors.black54),
                      SizedBox(width: 15),
                      Text(
                        "Qual o seu estado civil?",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            decorationColor: Colors.black),
                      ),
                    ],
                  ),
                  FormField(
                    initialValue: estadocivil,
                    autovalidateMode: AutovalidateMode.always,
                    builder: (FormFieldState<String> state) {
                      return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              RadioListTile(
                                title: const Text("Solteiro (a):",
                                    style: TextStyle(fontSize: 13)),
                                value: "Solteiro",
                                groupValue: estadocivil,
                                onChanged: (value) {
                                  estadocivil = value.toString();
                                  state.didChange(estadocivil);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Casado (a)",
                                    style: TextStyle(fontSize: 13)),
                                value: "Casado",
                                groupValue: estadocivil,
                                onChanged: (value) {
                                  estadocivil = value.toString();
                                  state.didChange(estadocivil);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Viúvo (a)",
                                    style: TextStyle(fontSize: 13)),
                                value: "Viúvo",
                                groupValue: estadocivil,
                                onChanged: (value) {
                                  estadocivil = value.toString();
                                  state.didChange(estadocivil);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Separação legal (judicial ou divórcio)",
                                    style: TextStyle(fontSize: 13)),
                                value: "Separação",
                              groupValue: estadocivil,
                                onChanged: (value) {
                                  estadocivil = value.toString();
                                  state.didChange(estadocivil);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Amaziado",
                                    style: TextStyle(fontSize: 13)),
                                value: "Amaziado",
                                groupValue: estadocivil,
                                onChanged: (value) {
                                  estadocivil = value.toString();
                                  state.didChange(estadocivil);
                                },
                              ),
                              RadioListTile(
                                title: const Text("outro",
                                    style: TextStyle(fontSize: 13)),
                                value: "outro",
                                groupValue: estadocivil,
                                onChanged: (value) {
                                  estadocivil = value.toString();
                                  state.didChange(estadocivil);
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
                      Icon(Icons.group_add, color: Colors.black54),
                      SizedBox(width: 15),
                      Text(
                        "Possui filhos(as)?",
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
                                title: const Text("Não",
                                    style: TextStyle(fontSize: 13)),
                                value: "Não",
                                groupValue: possuiFilhos,
                                onChanged: (value) {
                                  possuiFilhos = value.toString();
                                  state.didChange(possuiFilhos);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Sim",
                                    style: TextStyle(fontSize: 13)),
                                value: "Sim",
                                groupValue: possuiFilhos,
                                onChanged: (value) {
                                  possuiFilhos = value.toString();
                                  state.didChange(possuiFilhos);
                                },
                              ),
                              if (possuiFilhos == "Sim")
                                TextFormField(
                                  initialValue: qtdadefilhos,
                                  decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Quantos filhos voçê tem?"),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Quantidade invalida!! Corrija por favor';
                                    } else if ((value.isEmpty)) {
                                      return 'Quantidade invalida!! Corrija por favor';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => setState(
                                    () {
                                      qtdadefilhos = value.toString();
                                      _formKey.currentState!
                                          .didChangeDependencies();
                                    },
                                  ),
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
                      Icon(Icons.child_friendly, color: Colors.black54),
                      SizedBox(width: 15),
                      Text(
                        "Possui filhos(as) menores de 6 anos?",
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
                              title: const Text("Não",
                                  style: TextStyle(fontSize: 13)),
                              value: "Não",
                              groupValue: qtdadefilhosmenores,
                              onChanged: (value) {
                                qtdadefilhosmenores = value.toString();
                                state.didChange(qtdadefilhosmenores);
                              },
                            ),
                            RadioListTile(
                              title: const Text("Sim",
                                  style: TextStyle(fontSize: 13)),
                              value: "Sim",
                              groupValue: qtdadefilhosmenores,
                              onChanged: (value) {
                                qtdadefilhosmenores = value.toString();
                                state.didChange(qtdadefilhosmenores);
                              },
                            ),
                          ],
                        ),
                      );
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
                      Icon(Icons.church, color: Colors.black54),
                      SizedBox(width: 15),
                      Text(
                        "Religião *",
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
                                title: const Text("Sem religião",
                                    style: TextStyle(fontSize: 13)),
                                value: "Sem religião",
                                groupValue: possuiReligiao,
                                onChanged: (value) {
                                  possuiReligiao = value.toString();
                                  state.didChange(possuiReligiao);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Tenho religião (Qual?)",
                                    style: TextStyle(fontSize: 13)),
                                value: "Tenho religião",
                                groupValue: possuiReligiao,
                                onChanged: (value) {
                                  possuiReligiao = value.toString();
                                  state.didChange(possuiReligiao);
                                },
                              ),
                              if (possuiReligiao == "Tenho religião")
                                TextFormField(
                                  initialValue: religiao,
                                  decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Qual religião?"),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Religião invalida!! Corrija por favor';
                                    } else if ((value.isEmpty)) {
                                      return 'Religião invalida!! Corrija por favor';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => setState(
                                    () {
                                      religiao = value.toString();
                                      _formKey.currentState!
                                          .didChangeDependencies();
                                    },
                                  ),
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
                      Icon(Icons.school, color: Colors.black54),
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
                                title: const Text("Sem Escolaridade",
                                    style: TextStyle(fontSize: 13)),
                                value: "Sem Escolaridade",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Ensino Fundamental (1º grau) incompleto",
                                    style: TextStyle(fontSize: 13)),
                                value:
                                    "Ensino Fundamental (1º grau) incompleto",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Ensino Fundamental (1º grau) completo",
                                    style: TextStyle(fontSize: 13)),
                                value: "Ensino Fundamental (1º grau) completo",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Ensino Médio (2º grau) incompleto",
                                    style: TextStyle(fontSize: 13)),
                                value: "Ensino Médio (2º grau) incompleto",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Ensino Médio (2º grau) completo",
                                    style: TextStyle(fontSize: 13)),
                                value: "Ensino Médio (2º grau) completo",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Superior Incompleto",
                                    style: TextStyle(fontSize: 13)),
                                value: "Superior Incompleto",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Superior Completo",
                                    style: TextStyle(fontSize: 13)),
                                value: "Superior Completo",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Mestrado",
                                    style: TextStyle(fontSize: 13)),
                                value: "Mestrado",
                                groupValue: schooling,
                                onChanged: (value) {
                                  schooling = value.toString();
                                  state.didChange(schooling);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Doutorado",
                                    style: TextStyle(fontSize: 13)),
                                value: "Doutorado",
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
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.black54),
                      SizedBox(width: 15),
                      Text(
                        "Renda familiar mensal de sua casa (somatória)",
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
                                title: const Text("Até 1 salário mínimo",
                                    style: TextStyle(fontSize: 13)),
                                value: "Até 1 salário mínimo",
                                groupValue: renda,
                                onChanged: (value) {
                                  renda = value.toString();
                                  state.didChange(renda);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Mais de 1 a 2 salários mínimos",
                                    style: TextStyle(fontSize: 13)),
                                value: "Mais de 1 a 2 salários mínimos",
                                groupValue: renda,
                                onChanged: (value) {
                                  renda = value.toString();
                                  state.didChange(renda);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Mais de 2 a 3 salários mínimos",
                                    style: TextStyle(fontSize: 13)),
                                value: "Mais de 2 a 3 salários mínimos",
                                groupValue: renda,
                                onChanged: (value) {
                                  renda = value.toString();
                                  state.didChange(renda);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Mais de 3 a 5 salários mínimos",
                                    style: TextStyle(fontSize: 13)),
                                value: "Mais de 3 a 5 salários mínimos",
                                groupValue: renda,
                                onChanged: (value) {
                                  renda = value.toString();
                                  state.didChange(renda);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Mais de 5 a 8 salários mínimos",
                                    style: TextStyle(fontSize: 13)),
                                value: "Mais de 5 a 8 salários mínimos",
                                groupValue: renda,
                                onChanged: (value) {
                                  renda = value.toString();
                                  state.didChange(renda);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Mais de 8 a 12 salários mínimos",
                                    style: TextStyle(fontSize: 13)),
                                value: "Mais de 8 a 12 salários mínimos",
                                groupValue: renda,
                                onChanged: (value) {
                                  renda = value.toString();
                                  state.didChange(renda);
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Mais de 12 a 20 salários mínimos",
                                    style: TextStyle(fontSize: 13)),
                                value: "Mais de 12 a 20 salários mínimos",
                                groupValue: renda,
                                onChanged: (value) {
                                  renda = value.toString();
                                  state.didChange(renda);
                                },
                              ),
                              RadioListTile(
                                title: const Text("Mais de 20 salários mínimos",
                                    style: TextStyle(fontSize: 13)),
                                value: "Mais de 20 salários mínimos",
                                groupValue: renda,
                                onChanged: (value) {
                                  renda = value.toString();
                                  state.didChange(renda);
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

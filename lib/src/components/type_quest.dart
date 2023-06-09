import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import '../modelView/custom_radio_list.dart';
import '../modelView/header_card.dart';

class TypeQuest extends StatefulWidget {
  final int id;
  final ValueNotifier<List<String>> answer;
  const TypeQuest({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeQuest> createState() => _TypeQuestState();
}

class _TypeQuestState extends State<TypeQuest> {
  final _formKey = GlobalKey<FormState>();
  String idade = "",
      schooling = "",
      time = "",
      data = "",
      gender = "",
      generoRegistro = "",
      raca = "",
      qtdadeIrmaos = "",
      estadocivil = "",
      qtdadefilhos = "",
      qtdadefilhosmenores = "",
      religiao = "",
      renda = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          widget.answer.value = [
            data,
            time,
            idade,
            gender,
            generoRegistro,
            raca,
            qtdadeIrmaos,
            estadocivil,
            qtdadefilhos,
            qtdadefilhosmenores,
            religiao,
            schooling,
            renda
          ];
        } else {
          widget.answer.value = [];
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
                    onChanged: (v) => setState(
                        () => time = "$v; ${DateTime.now().toString()}"),
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
                    onChanged: (v) => setState(
                        () => data = "$v; ${DateTime.now().toString()}"),
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
                  CustomRadioList(
                    anwserFunc: (value) =>
                        gender = "$value; ${DateTime.now().toString()}",
                    description: "Gênero *",
                    icon: const Icon(Icons.transgender, color: Colors.black54),
                    hasPrefiroNaoDizer: true,
                    itens: const ["Feminino", "Masculino"],
                    labelText: "Qual o seu gênero?",
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'Descrição invalida!! Corrija por favor';
                      } else if ((value.isEmpty) || (value.length < 3)) {
                        return 'Descrição invalida!! Corrija por favor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  CustomRadioList(
                    anwserFunc: (value) =>
                        generoRegistro = "$value; ${DateTime.now().toString()}",
                    description: "Qual foi o sexo atribuído no seu nascimento?",
                    icon: const Icon(Icons.wc, color: Colors.black54),
                    hasPrefiroNaoDizer: false,
                    itens: const ["Feminino", "Masculino"],
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
                  CustomRadioList(
                    anwserFunc: (value) =>
                        raca = "$value; ${DateTime.now().toString()}",
                    description:
                        "Assinale a alternativa que identifica a sua Cor ou Raça:",
                    icon: const Icon(Icons.person, color: Colors.black54),
                    hasPrefiroNaoDizer: true,
                    itens: const [
                      "Preta",
                      "Branca",
                      "Parda",
                      "Amarela",
                      "IndÍgena"
                    ],
                    labelText: "Qual a sua Cor ou Raça ?",
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'Descrição invalida!! Corrija por favor';
                      } else if ((value.isEmpty) || (value.length < 3)) {
                        return 'Descrição invalida!! Corrija por favor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  CustomRadioList(
                    anwserFunc: (value) =>
                        qtdadeIrmaos = "$value; ${DateTime.now().toString()}",
                    description:
                        "Dentro de sua família, você é o(a) único(a) filho(a)?",
                    icon: const Icon(Icons.diversity_3, color: Colors.black54),
                    hasPrefiroNaoDizer: false,
                    itens: const ["Sim"],
                    otherLabel: "Não",
                    labelText: "Quantos irmãos voçê tem?",
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'Quantidade invalida!! Corrija por favor';
                      } else if ((value.isEmpty)) {
                        return 'Quantidade invalida!! Corrija por favor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  CustomRadioList(
                    anwserFunc: (value) =>
                        estadocivil = "$value; ${DateTime.now().toString()}",
                    description: "Qual o seu estado civil?",
                    icon: const Icon(Icons.diversity_2, color: Colors.black54),
                    hasPrefiroNaoDizer: false,
                    itens: const [
                      "Solteiro (a):",
                      "Casado (a)",
                      "Viúvo (a)",
                      "Separação legal (judicial ou divórcio)",
                      "Amaziado",
                    ],
                    labelText: "Qual estado civil ?",
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'Descrição invalida!! Corrija por favor';
                      } else if ((value.isEmpty) || (value.length < 3)) {
                        return 'Descrição invalida!! Corrija por favor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  CustomRadioList(
                    anwserFunc: (value) =>
                        qtdadefilhos = "$value; ${DateTime.now().toString()}",
                    description: "Possui filhos(as)?",
                    icon: const Icon(Icons.group_add, color: Colors.black54),
                    hasPrefiroNaoDizer: false,
                    itens: const ["Não"],
                    otherLabel: "Sim",
                    labelText: "Quantos filhos voçê tem?",
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'Quantidade invalida!! Corrija por favor';
                      } else if ((value.isEmpty)) {
                        return 'Quantidade invalida!! Corrija por favor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  CustomRadioList(
                    anwserFunc: (value) =>
                        qtdadefilhos = "$value; ${DateTime.now().toString()}",
                    description: "Possui filhos(as) menores de 6 anos?",
                    icon:
                        const Icon(Icons.child_friendly, color: Colors.black54),
                    hasPrefiroNaoDizer: false,
                    itens: const ["Não", "Sim"],
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
                  CustomRadioList(
                    anwserFunc: (value) =>
                        religiao = "$value; ${DateTime.now().toString()}",
                    description: "Religião *",
                    icon: const Icon(Icons.church, color: Colors.black54),
                    hasPrefiroNaoDizer: false,
                    itens: const ["Sem religião"],
                    otherLabel: "Tenho religião (Qual?)",
                    labelText: "Qual estado civil ?",
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'Religião invalida!! Corrija por favor';
                      } else if ((value.isEmpty)) {
                        return 'Religião invalida!! Corrija por favor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  CustomRadioList(
                    anwserFunc: (value) =>
                        schooling = "$value; ${DateTime.now().toString()}",
                    description: "Escolaridade *",
                    icon: const Icon(Icons.school, color: Colors.black54),
                    hasPrefiroNaoDizer: false,
                    itens: const [
                      "Sem Escolaridade",
                      "Ensino Fundamental (1º grau) incompleto",
                      "Ensino Fundamental (1º grau) completo",
                      "Ensino Médio (2º grau) incompleto",
                      "Ensino Médio (2º grau) completo",
                      "Superior Incompleto",
                      "Superior Completo",
                      "Mestrado",
                      "Doutorado",
                    ],
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
                  CustomRadioList(
                    anwserFunc: (value) =>
                        renda = "$value; ${DateTime.now().toString()}",
                    description:
                        "Renda familiar mensal de sua casa (somatória)",
                    icon: const Icon(Icons.attach_money, color: Colors.black54),
                    hasPrefiroNaoDizer: false,
                    itens: const [
                      "Até 1 salário mínimo",
                      "Mais de 1 a 2 salários mínimos",
                      "Mais de 2 a 3 salários mínimos",
                      "Mais de 3 a 5 salários mínimos",
                      "Mais de 5 a 8 salários mínimos",
                      "Mais de 8 a 12 salários mínimos",
                      "Mais de 12 a 20 salários mínimos",
                      "Mais de 20 salários mínimos",
                    ],
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

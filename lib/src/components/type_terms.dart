import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../modules/main/parameters.dart';
import 'header_card.dart';

class TypeTerms extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeTerms({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeTerms> createState() => _TypeTermsState();
}

class _TypeTermsState extends State<TypeTerms> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final focusNode = FocusNode();
  bool checkBoxValue = false;
  @override
  void initState() {
    super.initState();
    widget.answer.value = {};
  }

  _senderMessage() {
    if (_formKey.currentState?.validate() ?? false) {
      //Faça aqui o codigo com a mensagem final message = textController.text;
      textController.text = '';
    }
    focusNode.requestFocus();
  }

  _changeComboBox(bool? newValue) {
    newValue ??= false;
    if (newValue) {
      widget.answer.value = {'aceito': true};
    } else {
      widget.answer.value = {};
    }
    setState(() => checkBoxValue = newValue!);
  }

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      headerTitle: Text(
        telas[widget.id]!['header'],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 26, height: 2, color: Colors.white),
      ),
      widgetBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            telas[widget.id]!['body1'],
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10.0),
          CheckboxListTile(
            title: const Text('Concordo'),
            value: checkBoxValue,
            onChanged: _changeComboBox,
          ),
          const SizedBox(height: 10.0),
          CheckboxListTile(
              title: const Text('Não concordo'),
              value: !checkBoxValue,
              onChanged: (newValue) {
                newValue ??= false;
                _changeComboBox(!newValue);
              }),
          const SizedBox(height: 10.0),
          Text(
            telas[widget.id]!['body2'],
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                      RegExp('[\\s]')), // Remove espaços em branco
                  FilteringTextInputFormatter.deny(RegExp(
                      r'[^\w\s@\.-]')), // Remove caracteres especiais, exceto @, . e -
                ],
                focusNode: focusNode,
                controller: textController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  }
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                      .hasMatch(value)) {
                    return 'Por favor, insira um email válido.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Seu e-mail',
                  hintText: 'Seu e-mail',
                  suffixIcon: AnimatedBuilder(
                    animation: textController,
                    builder: (context, _) {
                      return IconButton(
                        onPressed: _senderMessage,
                        icon: const Icon(Icons.send),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 10.0),
          Text(
            telas[widget.id]!['body3'],
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10.0),
          Image.asset(
            telas[widget.id]!['image'][0], //assets/arvore2.png
            alignment: Alignment.bottomCenter,
          ),
          const SizedBox(height: 10.0),
          Image.asset(
            telas[widget.id]!['image'][1], //assets/arvore2.png
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}

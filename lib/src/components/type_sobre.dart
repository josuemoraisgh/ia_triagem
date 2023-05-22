import 'package:flutter/material.dart';
import '../modules/main/parameters.dart';
import 'header_card.dart';

class TypeSobre extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeSobre({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeSobre> createState() => _TypeSobreState();
}

class _TypeSobreState extends State<TypeSobre> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      widget.answer.value = {'data': 'Sucess'};
    });
  }

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      headerTitle: Text(
        telas[widget.id]!['header'],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 26, height: 2, color: Colors.white),
      ),
      widgetBody: Text(
        telas[widget.id]!['body'],
        textAlign: TextAlign.justify,
        style: const TextStyle(color: Colors.black, fontSize: 15.0),
      ),
    );
  }
}

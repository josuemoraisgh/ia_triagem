import 'package:flutter/material.dart';
import '../modules/home/parameters.dart';
import 'header_card.dart';

class TypeClean extends StatefulWidget {
  final int id;
  final ValueNotifier<Map<String, dynamic>> answer;
  const TypeClean({Key? key, required this.id, required this.answer})
      : super(key: key);

  @override
  State<TypeClean> createState() => _TypeCleanState();
}

class _TypeCleanState extends State<TypeClean> {
  @override
  Widget build(BuildContext context) {
    widget.answer.value = {"anser": ""};
    return HeaderCard(
      headerTitle: Text(
        telas[widget.id]!['header'],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 26, height: 2, color: Colors.white),
      ),
      widgetBody: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Colors.black),
          color: Colors.white,
        ),
        child: const SizedBox(
          height: 300.0,
          width: 400.0,
        ),
      ),
    );
  }
}

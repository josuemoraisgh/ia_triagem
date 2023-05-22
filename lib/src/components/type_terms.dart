import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    widget.answer.value = {};
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
            telas[widget.id]!['body'],
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10.0),
          const Divider(),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Material(
              color: Colors.lightGreenAccent.shade100,
              child: Checkbox(
                  value: widget.answer.value['aceito'] != null,
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        widget.answer.value = {'aceito': true};
                      } else {
                        widget.answer.value = {};
                      }
                    });
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
              child: Text(
                'Eu li e aceito os termos e condições',
                style: TextStyle(height: 2),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

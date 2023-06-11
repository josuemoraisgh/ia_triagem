import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../components/type_audio_comple.dart';
import '../../components/type_five_errors.dart';
import '../../components/type_text_form.dart';
import '../../components/type_clean.dart';
import '../../components/type_form.dart';
import '../../components/type_laudo.dart';
import '../../components/type_quest.dart';
import '../../components/type_sobre.dart';
import '../../components/type_terms.dart';
import '../../components/type_yes_no.dart';
import '../../modelView/display_frame.dart';
import '../../notfound_page.dart';
import 'parameters.dart';
import 'telas_controller.dart';

double typeSpace(BuildContext context) {
  const tamDesejado = 500.0;
  final Size size = MediaQuery.of(context).size;
  return ((size.width - tamDesejado) > 0 ? (size.width - tamDesejado) / 2 : 0);
}

class TelasPage extends StatefulWidget {
  final TelasController? controller;
  final int? id;
  const TelasPage({Key? key, required this.id, this.controller})
      : super(key: key);

  @override
  State<TelasPage> createState() => _TelasPageState();
}

class _TelasPageState extends State<TelasPage> {
  late TelasController controller;
  final answerNotifier = ValueNotifier<List<String>>([]);

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? Modular.get<TelasController>();
  }

  @override
  Widget build(BuildContext context) {
    double tam = typeSpace(context);
    return widget.id == null
        ? const NotFoundPage()
        : Scaffold(
            body: Container(
                padding:
                    EdgeInsets.only(left: tam, top: 10, right: tam, bottom: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.lightGreen.shade100,
                child: SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    typeMainFunciton(),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 0, top: 10, right: 10, bottom: 0),
                          alignment: Alignment.bottomRight,
                          child: Text(widget.id.toString()),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        if (telas[widget.id]!['hasProx'])
                          Container(
                            padding: const EdgeInsets.only(
                                left: 0, top: 10, right: 10, bottom: 0),
                            alignment: Alignment.bottomRight,
                            child: _proximaButton(),
                          ),
                      ],
                    ),
                  ],
                ))));
  }

  Widget typeMainFunciton() {
    switch (telas[widget.id]!['style'] as String) {
      case 'display_Frame':
        return (DisplayFrame(id: widget.id!));
      case 'clean':
        return (TypeClean(id: widget.id!));
      case 'sobre':
        return (TypeSobre(id: widget.id!, answer: answerNotifier));
      case 'terms':
        return (TypeTerms(id: widget.id!, answer: answerNotifier));
      case 'quest':
        return (TypeQuest(id: widget.id!, answer: answerNotifier));
      case 'laudo':
        return (TypeLaudo(id: widget.id!, answer: answerNotifier));
      case 'form':
        return (TypeForm(id: widget.id!, answer: answerNotifier));
      case 'yes_no':
        return (TypeYesNo(id: widget.id!, answer: answerNotifier));
      case 'five_errors':
        return (TypeFiveErrors(id: widget.id!));
      case 'audio_complete':
        return (TypeAudioComplete(id: widget.id!, answer: answerNotifier));
      case 'text_form':
        return (TypeTextForm(id: widget.id!, answer: answerNotifier));
      default:
        return (const Center(child: Text("Pagina não Encontrada !!")));
    }
  }

  Widget _proximaButton() {
    return ValueListenableBuilder<List<String>>(
      valueListenable: answerNotifier,
      builder: (BuildContext context, List<String> resp, Widget? child) =>
          ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(const Size(180, 50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.white))),
        ),
        onPressed: resp.isEmpty
            ? null
            : () {
                debugPrint("${(widget.id! + 1).toString()};${resp.toString()}");
                Modular.to.popAndPushNamed("/", arguments: widget.id! + 1);
                controller.answer += answerNotifier.value;
              },
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                top: 5,
                right: 15,
                bottom: 5,
              ), //apply padding to all four sides
              child: Text(
                "Próxima",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0,
                ),
              ),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

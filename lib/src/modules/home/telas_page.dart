import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../components/type_audio_comple.dart';
import '../../components/type_five_errors.dart';
import '../../components/type_city_state.dart';
import '../../components/type_clean.dart';
import '../../components/type_complete.dart';
import '../../components/type_consc_aten.dart';
import '../../components/type_intel.dart';
import '../../components/type_join_dots.dart';
import '../../components/type_laudo.dart';
import '../../components/type_quest.dart';
import '../../components/type_sobre.dart';
import '../../components/type_terms.dart';
import '../../components/type_yes_no.dart';
import '../../notfound_page.dart';
import 'parameters.dart';
import 'telas_controller.dart';

double typeSpace(BuildContext context) {
  const tamDesejado = 500.0;
  final Size size = MediaQuery.of(context).size;
  return ((size.width - tamDesejado) > 0 ? (size.width - tamDesejado) / 2 : 0);
}

class TelasPage extends StatelessWidget {
  final controller = TelasController();
  final int? id;
  final Map<String,dynamic>? answer;
  TelasPage({Key? key, required this.id, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tam = typeSpace(context);
    return id == null
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
                          child: Text(id.toString()),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        if (telas[id]!['hasProx'])
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
    switch (telas[id]!['type'] as String) {
      case 'clean':
        return (TypeClean(id: id!, answer: controller.answer));
      case 'sobre':
        return (TypeSobre(id: id!, answer: controller.answer));
      case 'terms':
        return (TypeTerms(id: id!, answer: controller.answer));
      case 'quest':
        return (TypeQuest(
            id: id!, startTime: DateTime.now(), answer: controller.answer));
      case 'laudo':
        return (TypeLaudo(id: id!, answer: controller.answer));
      case 'consc_aten':
        return (TypeConscAten(id: id!, answer: controller.answer));
      case 'intel':
        return (TypeIntel(id: id!, answer: controller.answer));
      case 'yes_no':
        return (TypeYesNo(id: id!, answer: controller.answer));
      case 'complete':
        return (TypeComplete(id: id!, answer: controller.answer));
      case 'five_errors':
        return (TypeFiveErrors(id: id!, answer: controller.answer));
      case 'join_dots':
        return (TypeJoinDots(id: id!, answer: controller.answer));
      case 'audio_complete':
        return (TypeAudioComplete(id: id!, answer: controller.answer));
      case 'city_state':
        return (TypeCityState(id: id!, answer: controller.answer));
      default:
        return (const Center(child: Text("Pagina não Encontrada !!")));
    }
  }

  Widget _proximaButton() {
    return ValueListenableBuilder<Map<String, dynamic>>(
      valueListenable: controller.answer,
      builder:
          (BuildContext context, Map<String, dynamic> resp, Widget? child) =>
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
                debugPrint("${(id! + 1).toString()};${resp.toString()}");
                Modular.to.popAndPushNamed("/", arguments: id! + 1);
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

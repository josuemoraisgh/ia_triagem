import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class DotsLine extends StatefulWidget {
  final Function(String,int) answerFunc;
  final int? answerId;
  const DotsLine({super.key, required this.answerFunc, this.answerId});

  @override
  State<DotsLine> createState() => _DotsLineState();
}

class _DotsLineState extends State<DotsLine> {
  static const int mult = 50;
  static const int bias = 25;
  bool isEdit = true;
  Offset? firstPoint;
  List<Offset> pointScreem = [];
  List<(Offset, Offset)> pointSelected = [];

  @override
  void initState() {
    super.initState();
    for (double x = 0; x < 8; x++) {
      for (double y = 0; y < 8; y++) {
        pointScreem += [Offset(x * mult + bias, y * mult + bias)];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: isEdit == true ? Colors.red : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isEdit = true;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: isEdit == false ? Colors.red : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isEdit = false;
                });
              },
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3.0, color: Colors.black),
            color: Colors.white,
          ),
          child: Center(
            child: SizedBox(
              height: 400.0,
              width: 400.0,
              child: GestureDetector(
                onPanDown: (DragDownDetails details) {
                  if (isEdit) {
                    List<num> distanceList = pointScreem
                        .map((ps) => distance(ps, details.localPosition))
                        .toList();
                    var ponto = pointScreem
                        .elementAt(distanceList.indexOf(distanceList.min));
                    if (firstPoint == null) {
                      firstPoint = ponto;
                    } else {
                      if (firstPoint! != ponto) {
                        pointSelected += [(firstPoint!, ponto)];
                        firstPoint = null;
                      }
                    }
                  } else {
                    if (pointSelected.isNotEmpty) {
                      List<num> distanceList = pointSelected.map((ps) {
                        final p1 = distance(ps.$1, details.localPosition);
                        final p2 = distance(ps.$2, details.localPosition);
                        final d = distance(ps.$1, ps.$2);
                        final s = (p1 + p2 + d) / 2;
                        return p1 < d && p2 < d //fórmula de Heron
                            ? 2 * sqrt(s * (s - p1) * (s - p2) * (s - d)) / d
                            : mult;
                      }).toList();
                      num min = distanceList.min;
                      int index = distanceList.indexOf(min);
                      if (index >= 0) {
                        if (min < mult / 5) {
                          pointSelected.removeAt(index);
                        }
                      }
                    }
                  }
                  if (pointSelected.isNotEmpty) {
                    widget.answerFunc(
                        "${pointSelected.toString().replaceAll('Offset', '')} - ${DateTime.now().toString()}",widget.answerId??0);
                  } else {
                    widget.answerFunc('vazio',0);
                  }
                  setState(() {});
                },
                child: CustomPaint(
                  painter: OpenPainter(
                      pointScreem: pointScreem, pointSelected: pointSelected),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  num distance(Offset ponto1, Offset ponto2) {
    return sqrt(pow(ponto1.dx - ponto2.dx, 2) + pow(ponto1.dy - ponto2.dy, 2));
  }
}

class OpenPainter extends CustomPainter {
  List<Offset> pointScreem;
  List<(Offset, Offset)> pointSelected;
  OpenPainter({required this.pointScreem, required this.pointSelected});

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;

    //draw points on canvas
    canvas.drawPoints(PointMode.points, pointScreem, paint1);
    for (var ps in pointSelected) {
      canvas.drawLine(ps.$1, ps.$2, paint1);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

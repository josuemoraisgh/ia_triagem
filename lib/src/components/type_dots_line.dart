import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../modelView/header_card.dart';
import '../modules/home/parameters.dart';

class TypeDotsLine extends StatefulWidget {
  final int id;
  final ValueNotifier<List<String>> answer;
  const TypeDotsLine({super.key, required this.id, required this.answer});

  @override
  State<TypeDotsLine> createState() => _TypeDotsLineState();
}

class _TypeDotsLineState extends State<TypeDotsLine> {
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
    return SingleChildScrollView(
      child: HeaderCard(
        headerTitle: Text(
          telas[widget.id]!['header'],
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 26, height: 2, color: Colors.white),
        ),
        widgetBody: Column(
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
                            .map((ps) =>
                                (pow(ps.dx - details.localPosition.dx, 2) +
                                    pow(ps.dy - details.localPosition.dy, 2)))
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
                        List<num> distanceList = pointSelected.map((ps) {
                          final mNum = (ps.$1.dy - ps.$2.dy);
                          final mDen = (ps.$1.dx - ps.$2.dx);
                          if (mNum == 0) {
                            return 0;
                          } else {
                            if (mDen == 0) {
                              return 0;
                            } else {
                              var m = mNum / mDen;
                              return (details.localPosition.dy -
                                          m * details.localPosition.dx +
                                          (m * ps.$2.dx - ps.$2.dy))
                                      .abs() /
                                  sqrt(1 + pow(m, 2));
                            }
                          }
                        }).toList();
                        int index = distanceList.indexOf(distanceList.min);
                        if (index >= 0) {
                          pointSelected.removeAt(index);
                        }
                      }
                      setState(() {});
                    },
                    child: CustomPaint(
                      painter: OpenPainter(
                          pointScreem: pointScreem,
                          pointSelected: pointSelected),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

import 'package:flutter/material.dart';
import '../modules/home/parameters.dart';
import '../modelView/header_card.dart';

class TypeFiveErrors extends StatefulWidget {
  final int id;

  const TypeFiveErrors({Key? key, required this.id})
      : super(key: key);

  @override
  State<TypeFiveErrors> createState() => _TypeFiveErrorsState();
}

class _TypeFiveErrorsState extends State<TypeFiveErrors> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCard(
          headerTitle: null,
          widgetBody: telas[widget.id]!['header'] == ""
              ? null
              : Text(telas[widget.id]!['header'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 26, height: 2, color: Colors.black)),
        ),
        const SizedBox(height: 10),
        DefaultTabController(
          length: 2,
          child: HeaderCard(
            headerTitle: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.comment_sharp)),
                Tab(icon: Icon(Icons.comments_disabled)),
              ],
            ),
            widgetBody: SizedBox(
              width: 400,
              height: 700,
              child: TabBarView(
                children: [
                  Image.asset(
                    telas[widget.id]!['image1'], //assets/arvore2.png
                    alignment: Alignment.bottomCenter,
                  ),
                  Image.asset(
                    telas[widget.id]!['image2'], //assets/arvore2.png
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

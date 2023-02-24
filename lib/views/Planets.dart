import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Planets extends StatefulWidget {
  const Planets({Key? key}) : super(key: key);

  @override
  State<Planets> createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {
  @override
  Widget build(BuildContext context) {
    Map e = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText("${e['title']}"),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: Duration(seconds: 2),
                    builder: (context, val, Widget) {
                      return Transform.rotate(
                        angle: val,
                        child: Image.asset(
                          e['images'],
                        ),
                      );
                    },
                  )),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        "${e['info']}",
                        style: TextStyle(color: Colors.white),
                      ),
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

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tdk_bouncingwidget/tdk_bouncingwidget.dart';
import '../views/Global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: AnimatedTextKit(
            animatedTexts: [WavyAnimatedText("G a l a x y  P l a n e t s")]),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('sun');
            },
            icon: Icon(Icons.blur_on),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              children: allplanets
                  .map(
                    (e) => BouncingWidgetInOut(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('planets', arguments: e);
                      },
                      bouncingType: BouncingType.bounceInAndOut ,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          alignment: Alignment.center,
                          width: 380,
                          height: 100,
                          color: Colors.grey,
                          child: Text("${e['title']}"),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}

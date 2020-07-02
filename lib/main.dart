import 'package:firstanimation/loader.dart';
import 'package:firstanimation/radialanimation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Container(
          
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildAnimationWithCurve("easeIn", Loader(curve: Curves.easeIn,)),
                buildAnimationWithCurve("bounceIn", Loader(curve: Curves.bounceIn,)),
                buildAnimationWithCurve("ease", Loader(curve: Curves.ease,)),
                buildAnimationWithCurve("easeOut", Loader(curve: Curves.easeOut,)),
                buildAnimationWithCurve("easeOutCirc", Loader(curve: Curves.easeOutCirc,)),
                buildAnimationWithCurve("slowMiddle", Loader(curve: Curves.slowMiddle,)),
                buildAnimationWithCurve("decelerate", Loader(curve: Curves.decelerate,)),
                buildAnimationWithCurve("easeOutBack", Loader(curve: Curves.easeOutBack,)),
                buildAnimationWithCurve("elasticOut", RadialMenu(curve: Curves.elasticOut,)),
                buildAnimationWithCurve("easeInCubic", RadialMenu(curve: Curves.easeInCubic,)),
                buildAnimationWithCurve("linear", RadialMenu(curve: Curves.linear,)),
                buildAnimationWithCurve("linearToEaseOut", RadialMenu(curve: Curves.linearToEaseOut,)),
                buildAnimationWithCurve("easeInOutSine", RadialMenu(curve: Curves.easeInOutSine,)),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Column buildAnimationWithCurve(String curve, Widget child) {
    return Column(
      children: <Widget>[
        child,
        SizedBox(
          height: 30,
        ),
        Text(
          curve,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  Loader({Key key, this.curve}) : super(key: key);
  final Curve curve;
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: Duration(milliseconds: 800), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: widget.curve);
    animation.addListener(() {
      setState(() {});
    });
    rotate = Tween<double>(begin: -90, end: -93)
            .animate(CurvedAnimation(parent: controller, curve: Curves.ease)),
        translate = Tween<double>(
                begin: 0, end: 250.0 - (listOfControllers.length * 10))
            .animate(CurvedAnimation(parent: controller, curve: Curves.ease)),
    animation.addStatusListener((status) {});
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 30,
      width:  animation.value*80,
    );
  }
}

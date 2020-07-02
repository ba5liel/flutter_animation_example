import 'package:flutter/material.dart';
import 'dart:math';

class RadialMenuWithRotaion extends StatefulWidget {
  final Curve curve;
  RadialMenuWithRotaion({Key key, this.curve}) : super(key: key);

  @override
  _RadialMenuWithRotaionState createState() => _RadialMenuWithRotaionState();
}

class _RadialMenuWithRotaionState extends State<RadialMenuWithRotaion>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print(controller);
    return RadialAnimation(
      controller: controller,
      curve: widget.curve,
    );
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation scale;
  final Animation translate;
  final Animation rotation;
  final Curve curve;
  RadialAnimation({Key key, this.controller, this.curve})
      : scale = Tween<double>(begin: 1.5, end: 0)
            .animate(CurvedAnimation(parent: controller, curve: curve)),
        translate = Tween<double>(begin: 0, end: 100)
            .animate(CurvedAnimation(parent: controller, curve: Curves.linear)),
        rotation = Tween<double>(begin: 0, end: 360).animate(
            CurvedAnimation(parent: controller, curve: Interval(0, 0.7))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Transform.rotate(
                    angle: radian(rotation.value),
                    child: Stack(
                      children: <Widget>[
                        buildFloatingRotatingButton(90,
                            color: Colors.green, icon: Icons.computer),
                        buildFloatingRotatingButton(0,
                            color: Colors.indigo, icon: Icons.tune),
                        buildFloatingRotatingButton(45,
                            color: Colors.lime, icon: Icons.tv),
                        buildFloatingRotatingButton(135,
                            color: Colors.pink, icon: Icons.web),
                        buildFloatingRotatingButton(180,
                            color: Colors.deepOrange, icon: Icons.usb),
                        buildFloatingRotatingButton(225,
                            color: Colors.yellow, icon: Icons.camera),
                        buildFloatingRotatingButton(270,
                            color: Colors.cyan, icon: Icons.cake),
                        buildFloatingRotatingButton(315,
                            color: Colors.purple, icon: Icons.games),
                        buildFloatingRotatingButton(360,
                            color: Colors.teal, icon: Icons.watch),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: scale.value - 1.5,
                    child: FloatingActionButton(
                      onPressed: _close,
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Transform.scale(
                    scale: scale.value,
                    child: FloatingActionButton(
                      onPressed: _open,
                      child: Icon(Icons.lock_open),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Widget buildFloatingRotatingButton(double deg, {Color color, IconData icon}) {
    return Transform.translate(
      offset: Offset(translate.value * cos(radian(deg)),
          translate.value * sin(radian(deg))),
      child: FloatingActionButton(
        backgroundColor: color,
        onPressed: null,
        child: Icon(icon),
      ),
    );
  }

  void _open() {
    controller.forward();
  }

  void _close() {
    controller.reverse();
  }

  double radian(double deg) {
    return pi * deg / 180;
  }
}

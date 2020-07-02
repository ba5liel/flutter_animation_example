import 'package:flutter/material.dart';

class RadialMenu extends StatefulWidget {
  final Curve curve;
  RadialMenu({Key key, this.curve}) : super(key: key);

  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
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
  final Curve curve;
  RadialAnimation({Key key, this.controller, this.curve})
      : scale = Tween<double>(begin: 1.5, end: 0)
            .animate(CurvedAnimation(parent: controller, curve: curve)),
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
                Transform.scale(
                  scale: scale.value-1.5,
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
      }
    );
  }
  void _open(){
    controller.forward();
  }
  void _close(){
    controller.reverse();
  }
}

import 'package:flutter/material.dart';

class PointBrailleWidget extends StatefulWidget {
  final double diametro;
  final bool paint;

  const PointBrailleWidget({Key key, this.diametro, this.paint = false})
      : super(key: key);
  @override
  _PointBrailleWidgetState createState() =>
      _PointBrailleWidgetState(diametro: this.diametro, paint: this.paint);
}

class _PointBrailleWidgetState extends State<PointBrailleWidget> {
  final double diametro;
  final bool paint;

  _PointBrailleWidgetState({this.diametro, this.paint});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: diametro,
      height: diametro,
      decoration: BoxDecoration(
        border: BoxBorder.lerp(
          Border.all(color: Colors.black),
          Border.all(color: Colors.black),
          10,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        color: (paint ? Colors.black : Colors.transparent),
      ),
    );
  }
}

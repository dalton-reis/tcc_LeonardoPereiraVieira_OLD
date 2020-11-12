import 'package:flutter/material.dart';

class HeaderCurveWidget extends StatelessWidget {
  final Color color;
  final Size size;
  final double curve, bordeCurve;
  final Gradient gradient;
  final Widget child;
  const HeaderCurveWidget(
      {Key key,
      this.color,
      this.size,
      this.curve,
      this.bordeCurve,
      this.gradient,
      this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveClipperPath(
        sizeW: size.width,
        sizeH: size.height,
        curve: curve,
        bordeCurve: bordeCurve,
      ),
      child: Stack(
        children: [
          Container(
            height: 200,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(color: color, gradient: gradient),
          ),
        ],
      ),
    );
  }
}

class CurveClipperPath extends CustomClipper<Path> {
  final double sizeW, sizeH, curve, bordeCurve;

  CurveClipperPath({this.sizeW, this.sizeH, this.curve, this.bordeCurve});
  @override
  Path getClip(Size size) {
    double begin = bordeCurve;
    var path = Path();
    path.moveTo(begin, curve);
    path.lineTo(sizeW - begin, curve);
    path.quadraticBezierTo(sizeW - 3, 3, sizeW, begin);
    path.lineTo(sizeW, sizeH * curve);
    path.quadraticBezierTo(sizeW * .5, sizeH * curve * 2, 0, sizeH * curve);
    path.lineTo(0, begin);
    path.quadraticBezierTo(4, 4, begin, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
